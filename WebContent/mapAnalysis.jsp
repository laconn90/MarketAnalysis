<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Small Business - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/small-business.css" rel="stylesheet">
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

</head>

<body>

   <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
         <a class="navbar-brand" href="mapService.jsp">골목상권 분석</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item active"><a class="nav-link" href="index.html">Home
                     <span class="sr-only">(current)</span>
               </a></li>
               <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
               <li class="nav-item"><a class="nav-link" href="mapService.jsp">Services</a>
               </li>
               <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
               </li>
            </ul>
         </div>
      </div>
   </nav>

<font style="font-family:HY울릉도M">

   <!-- Page Content -->
   <div class="container">

      <!-- Heading Row -->
      <div class="row my-4">
         <div class="col-lg-8">
            <div class="img-fluid rounded" id="map"
               style="width: 900px; height: 400px;"></div>
         </div>
         <!-- /.col-lg-8 -->
         <div class="col-lg-4">
            <h1>
               <font color="#fc9520">${sessionScope.gu}</font><font
                  color="#1f72ef"> ${sessionScope.dong}</font><br> 상권 종합 분석
            </h1>
            <p>
               해당상권의<br> <font color="#1f72ef">${sessionScope.service}</font>업종<br>
               전국 외식업 골목상권 기준 상위<font color="#1f72ef"> ${sessionScope.result.percentage}%</font><br>
               상권 안전도 : ${sessionScope.result.estimatedClass}<br>
   
               

            </p>
            <a class="btn btn-primary btn-lg" href="report.jsp">상권 통계 분석 더보기</a>
         </div>
         <!-- /.col-md-4 -->
      </div>
      <!-- /.row -->

      <!-- Call to Action Well -->
      <div class="card text-white bg-secondary my-4 text-center">
         <div class="card-body">
            <p class="text-white m-0">종합분석 외에도 지표별 다양한 상세분석을 볼 수 있습니다</p>
         </div>
      </div>

      <div class="col-md-4 mb-4">
         <div class="card h-100" style="width: 1080px;">
            <div class="card-body" style="height: 550px;">
               <h2 class="card-title"><font color="#FF8000">레이더 차트</font></h2>
               <p class="card-text">
               <div id="myDiv">
                  <!-- Plotly chart will be drawn inside this DIV -->
               </div>
            </div>
         </div>
      </div>

      <!-- Content Row -->
      <div class="row">
         <div class="col-md-4 mb-4">
            <div class="card h-100">
               <div class="card-body">
                  <h2 class="card-title"><font color="#FF8000">예상 매출 </font>:<br> ${sessionScope.sales}원</h2>
                  <p class="card-text"><font color="#4c4a49">
                     <p>-   서울시 외식업종들을 대상으로 100,000여개의 데이터를 가지고 유동인구, 지출 주변시설, 상권배후지 등의 요인으로 매출액을 예상합니다.</p>
<p>-   <font color="#FF0000">SVR, Ridge, GBR</font> <br>등을 이용한 선형회귀 모델을 사용하였습니다.</p>
<p>-   매출액의 예측치는 <font color="#1f72ef">84.4%</font>의 정확도를 보이고 있습니다.
                  </p>
                  </font>
               </div>
               <div class="card-footer">
                  <a href="report.jsp" class="btn btn-primary">정보 더 보기</a>
               </div>
            </div>
         </div>
         <!-- /.col-md-4 -->
         <div class="col-md-4 mb-4">
            <div class="card h-100">
               <div class="card-body">
                  <h2 class="card-title"><font color="#FF8000">예상 등급</font></h2>
                  <p class="card-text"><font color="#4c4a49">
                     <p>-   해당 상권의 예상등급은 <font color="#1f72ef">${sessionScope.result.estimatedClass}</font>입니다.</p>
    <p>-   <font color="#FF0000">GBC , KNN, Random Forest</font> <br>세가지 분류 모델을 앙상블 러닝방식을 통해 <font color="#1f72ef">87.8%</font>의 정확도로 예측합니다.</p>
     <p>-   군집 분석을 통해서 해당 상권 업종의 안전도를 <font color="#FF8000"> 좋음 / 양호/ 불안 / 위험</font>으로 나누어 창업 안전도를 제시합니다.   
          </font>
               </div>
            </div>
         </div>
         <!-- /.col-md-4 -->
         <div class="col-md-4 mb-4">
            <div class="card h-100">
               <div class="card-body">
                  <h2 class="card-title"><font color="#FF8000">업종 분석</font></h2>
                  <p class="card-text"><font color="#4c4a49">
                  <p>-      해당 상권의 매출은 전국 외식업 골목상권 전체 중 상위 <font color="#1f72ef">${sessionScope.result.percentage}%</font>입니다.</p>
                  <p>-      상권 내 해당 업종은 동종으로 ${sessionScope.area14.stores}개가 있습니다.</p>
                  <p>-      해당 월 기준, 예상 매출액은 <font color="#1f72ef">${sessionScope.sales}</font>원이 예상됩니다.</p>
                  <p>-      해당 상권의 ${sessionScope.service } 업종의 안전도는 <font color="#1f72ef">${sessionScope.result.estimatedClass}</font>  예상됩니다.</p>
               </font>
               </div>
            </div>
         </div>
         <!-- /.col-md-4 -->

      </div>
      <!-- /.row -->

   </div>
   <!-- /.container -->



   <!-- Footer -->
   <footer class="py-5 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white">Copyright &copy; Your
            Website 2017</p>
      </div>
      <!-- /.container -->
   </footer>
</font>
   <!-- Bootstrap core JavaScript -->
   <script src="vendor/jquery/jquery.min.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55d81c6e682f667cceb61a2a681598bf&libraries=services"></script>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new daum.maps.LatLng(37.555280, 127.043614), // 지도의 중심좌표
         draggable : false, //지도 이동, 확대 막음
         level : 6
      // 지도의 확대 레벨
      };

      //지도를 생성합니다
      var map = new daum.maps.Map(mapContainer, mapOption), customOverlay = new daum.maps.CustomOverlay(
            {}), infowindow = new daum.maps.InfoWindow({
         removable : true
      });

      //=============================================================================================================
      //=============================================================================================================

      //마커가 표시될 위치입니다 
      var markerPosition = new daum.maps.LatLng(37.555280, 127.043614);

      // 마커를 생성합니다
      var marker = new daum.maps.Marker({
         position : markerPosition
      });

      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

      //일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
      var mapTypeControl = new daum.maps.MapTypeControl();

      //=============================================================================================================
      //=============================================================================================================

      function getData() {
         var arrayDong = [];
         $.getJSON('alley.json', function(data) {
            $.each(data, function(i, area) {
               arrayDong.push(area);
            });
            var areas = getPath(arrayDong)
            for (var i = 0, len = areas.length; i < len; i++) {
               displayArea(areas[i]);
            }
         });

      }

      function getPath(data) {
         var area = []
         for (var i = 0; i < data.length; i++) {
            var dong = {}
            name = data[i]["name"];
            path = data[i]["path"];
            var posList = []
            for (var j = 0; j < path.length; j++) {
               pos = new daum.maps.LatLng(path[j][1], path[j][0])
               posList.push(pos)
            }
            dong["name"] = name
            dong["path"] = posList
            area.push(dong)
         }

         return area
      }

      getData();

      //다각형을 생상하고 이벤트를 등록하는 함수입니다!
      function displayArea(area) {

         // 지도에 표시할 다각형을 생성합니다
         var polygon = new daum.maps.Polygon({
            map : map,
            path : area.path, // 그려질 다각형의 좌표 배열입니다
            strokeWeight : 2, // 선의 두께입니다
            strokeColor : '#ffae23', // 선의 색깔입니다
            strokeOpacity : 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid', // 선의 스타일입니다
         /*  fillColor: '#EFFFED', // 채우기 색깔입니다
          fillOpacity: 0.3 // 채우기 불투명도 입니다 */
         });

         //#A2FF99
         // 다각형에 마우스오버 이벤트가 발생했을 때 변경할 채우기 옵션입니다
         var mouseoverOption = {
            fillColor : '#e5da10', // 채우기 색깔입니다
            fillOpacity : 0.5
         // 채우기 불투명도 입니다        
         };

         // 다각형에 마우스아웃 이벤트가 발생했을 때 변경할 채우기 옵션입니다
         var mouseoutOption = {
            fillColor : '#EFFFED', // 채우기 색깔입니다 
            fillOpacity : 0.3
         // 채우기 불투명도 입니다        
         };

         // 다각형에 마우스오버 이벤트를 등록합니다
         daum.maps.event.addListener(polygon, 'mouseover', function() {

            // 다각형의 채우기 옵션을 변경합니다
            polygon.setOptions(mouseoverOption);

         });

         daum.maps.event.addListener(polygon, 'mouseout', function() {

            // 다각형의 채우기 옵션을 변경합니다
            polygon.setOptions(mouseoutOption);

         });

         //다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
         daum.maps.event
               .addListener(
                     polygon,
                     'click',
                     function(mouseEvent) {
                        var content = '<div class="info">'
                              + '   <div class="title">'
                              + '<strong>상권 명 : '
                              + area.name
                              + '</strong>'
                              + '</div>';

                        infowindow.setContent(content);
                        infowindow.setPosition(mouseEvent.latLng);
                        infowindow.setMap(map);
                     });
      }
      //=============================================================================================================
      //=============================================================================================================
      mapSearch()

      function mapSearch() {
         var dd = '${sessionScope.dong}'
         console.log(dd);
         var myAddress = dd

         // 주소-좌표 변환 객체를 생성합니다
         var geocoder = new daum.maps.services.Geocoder();

         // 주소로 좌표를 검색합니다
         geocoder
               .addressSearch(
                     myAddress,
                     function(result, status) {

                        // 정상적으로 검색이 완료됐으면 
                        if (status === daum.maps.services.Status.OK) {

                           var coords = new daum.maps.LatLng(
                                 result[0].y, result[0].x);

                           // 결과값으로 받은 위치를 마커로 표시합니다
                           var marker = new daum.maps.Marker({
                              map : map,
                              position : coords
                           });

                           // 인포윈도우로 장소에 대한 설명을 표시합니다
                         /*   var infowindow = new daum.maps.InfoWindow(
                                 {
                                    content : '<div style="width:150px;text-align:center;padding:6px 0;"></div>'
                                 });
                           infowindow.open(map, marker); */

                           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                           map.setCenter(coords);
                        }
                     });

      }
      //=======================================================================
      //=======================================================================

var nearP = '${sessionScope.area14.totalNearPeople}'
if (nearP >= 5740){
   nearP = 50
} else if (nearP >= 4363){
   nearP = 40
} else if (nearP >= 3513){
   nearP = 30
} else if (nearP >= 2773){
   nearP = 20
} else {
   nearP = 10
}

var outC = '${sessionScope.area14.avgOutcome}'
   if (outC >= 828964119){
      outC = 50
   } else if (outC >= 568004731){
      outC = 40
   } else if (outC >= 384523451){
      outC = 30
   } else if (outC >= 234867963){
      outC = 20
   } else {
      outC = 10
   }
   
var totalP = '${sessionScope.area14.totalPeople}'
   if (totalP >= 7253){
      totalP = 50
   } else if (totalP >= 5035){
      totalP = 40
   } else if (totalP >= 3706){
      totalP = 30
   } else if (totalP >= 2671){
      totalP = 20
   } else {
      totalP = 10
   }

var totalF = '${sessionScope.area14.totalFacility}'
   if (totalF >= 20729){
      totalF = 50
   } else if (totalF >= 13219){
      totalF = 40
   } else if (totalF >= 9149){
      totalF = 30
   } else if (totalF >= 5257){
      totalF = 20
   } else {
      totalF = 10
   }
   
var nearF = '${sessionScope.area14.totalNearFacility}'
   if (nearF >= 163){
      nearF = 50
   } else if (nearF >= 134){
      nearF = 40
   } else if (nearF >= 115){
      nearF = 30
   } else if (nearF >= 95){
      nearF = 20
   } else {
      nearF = 10
   }   

         
      data = [ {
         type : 'scatterpolar',
         r : [nearP, outC, totalP, totalF, nearF, nearP],
         theta : [ '배후지유동인구', '구매력', '유동인구', '주변시설', '배후지시설', '배후지유동인구' ],
         fill : 'toself'
      } ]

      layout = {
         polar : {
            radialaxis : {
               visible : true,
               range : [ 0, 50 ]
            }
         },
         showlegend : false
      }

      Plotly.plot("myDiv", data, layout)
      
   </script>


</body>

</html>