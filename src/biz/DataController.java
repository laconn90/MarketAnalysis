package biz;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AlleyDataBean;
import bean.DongDataBean;
import bean.ResultBean;
import bean.ResultDataBean;
import bean.StoreSales;
import model.DataDAO;
import model.GetAreaCode;
import model.GetDongData;

@WebServlet("/data")
public class DataController extends HttpServlet {

	public DataController() {
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String dong = request.getParameter("d");
		String gu = request.getParameter("g");
		String service = request.getParameter("service");

		if (dong == null) {
			request.getSession().setAttribute("areaCheck", "block");
			response.sendRedirect("mapService.jsp");
		} else if (service.length() < 2) {
			request.getSession().setAttribute("serviceCheck", "block");
			response.sendRedirect("mapService.jsp");

		} else {
			ArrayList<String> codeList = getAreaCode(dong);
			if (codeList.size() > 0) {
				ArrayList<AlleyDataBean> area = getAreaData(codeList);
				ResultDataBean result = getResult(dong, service, codeList);
				ArrayList<StoreSales> sData = getSData(codeList, service);
				if(sData==null) {
					ArrayList<String> surCodeList = getSurAreaCode(gu, dong);
					sData=getSData(surCodeList, service);
				}
				ArrayList<DongDataBean> datas = getDongData(dong, sData, area);

				for (int i = 0; i < datas.size(); i++) {
					if (datas.get(i) == null) {
						datas.get(i - 1);
				
				}else {
					DongDataBean data=datas.get(i);
				if(data.getDate().equals("201701")) {
							int sal=data.getSales();
							if(sal>Math.round(1.5*datas.get(i-1).getSales())) {
								sal=(int)Math.round(sal*0.5);
							}
							
							data.setStores(datas.get(i-1).getStores());
							data.setSales(sal);
						}
						request.getSession().setAttribute(String.format("area%d", i), data);
					}

				}
				int sales=result.getSales();
				DecimalFormat df=new DecimalFormat("#,###");
				String sale=df.format(sales);
				request.getSession().setAttribute("sales", sale);
				request.getSession().setAttribute("result", result);
			} else {
				ArrayList<String> surCodeList = getSurAreaCode(gu, dong);
				ArrayList<AlleyDataBean> area = getAreaData(surCodeList);
				ResultDataBean result = getResult(dong, service, codeList);
				ArrayList<StoreSales> sData = getSData(codeList, service);
				ArrayList<DongDataBean> datas = getDongData(dong, sData, area);

				for (int i = 0; i < datas.size(); i++) {
				
					request.getSession().setAttribute(String.format("area%d", i), datas.get(i));
				}
				int sales=result.getSales();
				DecimalFormat df=new DecimalFormat("#,###");
				String sale=df.format(sales);
				request.getSession().setAttribute("sales", sale);
				request.getSession().setAttribute("result", result);
			}

			request.getSession().setAttribute("gu", gu);
			request.getSession().setAttribute("dong", dong);
			request.getSession().setAttribute("service", service);

			response.sendRedirect("mapAnalysis.jsp");

		}

	}

	public static ArrayList<String> getSurAreaCode(String gu, String dong) {
		ArrayList<String[]> file;
		HashMap<String, ArrayList<String>> guMap;
		ArrayList<String> codeList = new ArrayList<>();
		try {

			file = GetAreaCode.getDataList();

			guMap = GetAreaCode.convertDongMap(file);
			ArrayList<String> dongList = guMap.get(gu);
			for (String dongs : dongList) {
				if (dongs == dong) {

				} else {
					ArrayList<String> codes = GetAreaCode.convertD2C(guMap, dong);
					if (codes.size() > 0) {
						codeList.addAll(codes);
					} else {

					}

				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			codeList = null;
		}
		return codeList;
	}

	public static ArrayList<String> getAreaCode(String dong) {

		HashMap<String, ArrayList<String>> dongMap;
		ArrayList<String> codeList;
		try {
			dongMap = GetAreaCode.convertCodeMap(GetAreaCode.getDataList());
			codeList = GetAreaCode.convertD2C(dongMap, dong);

		} catch (IOException e) {
			e.printStackTrace();
			codeList = null;
		}

		return codeList;
	}

	public static ArrayList<AlleyDataBean> getAreaData(ArrayList<String> codeList) {
		ArrayList<AlleyDataBean> area = new ArrayList<>();
		ArrayList<AlleyDataBean> data;
		for (String code : codeList) {
			try {
				code = code + ".0";
				data = DataDAO.selectArea(code);
				if (data == null) {

				} else if (data.size() < 14) {
					AlleyDataBean tmp = data.get(data.size() - 1);
					data.add(tmp);
					area.addAll(data);

				} else {
					area.addAll(data);

				}

			} catch (

			SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return area;

	}

	public static ArrayList<AlleyDataBean> getSurAreaData(ArrayList<ArrayList<String>> codeList) {
		ArrayList<AlleyDataBean> area = new ArrayList<>();
		ArrayList<AlleyDataBean> data = null;
		for (ArrayList<String> codes : codeList) {
			for (String code : codes) {
				try {
					data = DataDAO.selectArea(code);
					if (data.size() > 0) {
						area.addAll(data);
					} else {

					}
					area.addAll(data);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return area;
	}

	public static ArrayList<DongDataBean> getDongData(String dong, ArrayList<StoreSales> sData,
			ArrayList<AlleyDataBean> area) {
		String[] dateList = new String[] { "201606.0", "201607.0", "201608.0", "201609.0", "201610.0", "201611.0",
				"201612.0", "201701.0", "201702.0", "201703.0", "201704.0", "201705.0", "201706.0", "201707.0",
				"201708.0" };
		ArrayList<DongDataBean> dongData = GetDongData.getDongData(dong, sData, area);
		ArrayList<DongDataBean> dData = new ArrayList<>();
		for (int i = 0; i < dongData.size(); i++) {
			DongDataBean dongs = dongData.get(i);
			if (dongData.get(i).getDate() == null) {

				dongs.setDate(dateList[i]);
				if (i > 1) {
				int sales = (dongData.get(i - 1).getSales() + dongData.get(i + 1).getSales()) / 2;
				dongs.setSales(sales);
				}else {
					dongs.setSales(dongData.get(i+1).getSales());
				}
				dongs.setTotalLivingPeople(dongData.get(i - 1).getTotalLivingPeople());
				dongs.setTotalPeople(dongData.get(i - 1).getTotalPeople());
				dongs.setStores(dongData.get(i - 1).getStores());
				dongs.setAvgOutcome(dongData.get(i - 1).getAvgNearOutcome());
				dData.add(dongs);
			} else {
				if (i > 1) {
					float ratio = dongData.get(i - 1).getSales() / dongs.getSales();
					if (ratio > 1.5) {
						dongs.setSales((int) Math.round(dongs.getSales() * 0.8));
					} else if (ratio < 0.5) {
						dongs.setSales((int) Math.round(dongs.getSales() * 1.2));
					} else {
					}
					
					float ratio1 = dongData.get(i - 1).getAvgOutcome() / dongs.getAvgOutcome();
					if (ratio1 > 1.5) {
	
						dongs.setSales((int) Math.round(dongs.getSales() * 0.8));
					} else if (ratio1 < 0.5) {
						dongs.setSales((int) Math.round(dongs.getSales() * 1.2));
					} else {
					}
					
					float ratio2 = dongData.get(i - 1).getStores() / dongs.getStores();
					if (ratio2 > 1.5) {
						System.out.println(dongs.getDate());
						dongs.setStores((int) Math.round(dongs.getStores() * 0.8));
					} else if (ratio2 < 0.5) {
						dongs.setStores((int) Math.round(dongs.getStores() * 1.2));
					} else {
					}
					
					
					dData.add(dongs);
				} else {
					if (dongData.get(i).getDate() == null) {
						dongs = dongData.get(i + 1);
						dongs.setDate(dateList[0]);
						dData.add(dongs);

					} else {
						dData.add(dongs);
					}
				}
			}
		}
		return dData;
	}

	@SuppressWarnings("null")
	public static ArrayList<StoreSales> getSData(ArrayList<String> codeList, String service) {

		ArrayList<StoreSales> sData = new ArrayList<>();
		String serviceCode;
		if (service.equals("한식")) {
			serviceCode = "CS100001";
		} else if (service.equals("중식")) {
			serviceCode = "CS100002";
		} else if (service.equals("일식")) {
			serviceCode = "CS100003";
		} else if (service.equals("양식")) {
			serviceCode = "CS100004";
		} else if (service.equals("분식")) {
			serviceCode = "CS100005";
		} else if (service.equals("패스트푸드")) {
			serviceCode = "CS100006";
		} else if (service.equals("치킨")) {
			serviceCode = "CS100007";
		} else if (service.equals("제과")) {
			serviceCode = "CS100008";
		} else if (service.equals("커피·음료")) {
			serviceCode = "CS100009";
		} else if (service.equals("호프·간이주점")) {
			serviceCode = "CS100010";
		} else {
			serviceCode = "0";
		}

		try {
			for (String code : codeList) {
				code = code + ".0";
				ArrayList<StoreSales> s = DataDAO.selectStoreSales(code, serviceCode);

				if (s != null) {
					if (s.size() < 14) {
						StoreSales tmp = s.get(s.size() - 1);
						s.add(tmp);
						sData.addAll(s);
					} else {
						sData.addAll(s);
					}

				} else {

				}
			}
			return sData;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static ResultDataBean getResult(String dong, String service, ArrayList<String> codeList) {
		String serviceCode;
		ResultDataBean result = new ResultDataBean();
		int len = codeList.size();
		HashMap<String, Integer> classes = new HashMap<>();
		float per = 0;
		float sales = 0;

		if (service.equals("한식")) {
			serviceCode = "CS100001";
		} else if (service.equals("중식")) {
			serviceCode = "CS100002";
		} else if (service.equals("일식")) {
			serviceCode = "CS100003";
		} else if (service.equals("양식")) {
			serviceCode = "CS100004";
		} else if (service.equals("분식")) {
			serviceCode = "CS100005";
		} else if (service.equals("패스트푸드")) {
			serviceCode = "CS100006";
		} else if (service.equals("치킨")) {
			serviceCode = "CS100007";
		} else if (service.equals("제과")) {
			serviceCode = "CS100008";
		} else if (service.equals("커피·음료")) {
			serviceCode = "CS100009";
		} else if (service.equals("호프·간이주점")) {
			serviceCode = "CS100010";
		} else {
			serviceCode = "0";
		}

		for (String code : codeList) {
			try {
				code = code + ".0";
				ResultBean tmp = new ResultBean();
				tmp = DataDAO.selectResult(code, serviceCode);
				if (tmp == null) {
				} else {
					per += tmp.getPercentage();
					sales += tmp.getSales();
					String classValue = tmp.getEstimatedClass();
					if (classes.containsKey(classValue)) {
						int val = classes.get(classValue);
						val += 1;
						classes.put(classValue, val);
					} else {
						classes.put(classValue, 1);
					}

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		per = per / len;
		int p = Math.round(per * 100);
		int sal = Math.round(sales / len);
		Set<String> keys = classes.keySet();
		int value = 0;
		String estClass = null;
		for (String k : keys) {
			int cnt = classes.get(k).intValue();
			if (value >= cnt) {

			} else {
				value = cnt;
				estClass = k;
			}
		}

		result.setDong(dong);
		result.setService(service);
		result.setSales(sal);
		result.setPercentage(p);
		result.setEstimatedClass(estClass);
		return result;
	}
}