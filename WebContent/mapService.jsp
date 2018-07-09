<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shortcut icon" href="./images/favicon.ico">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>상권이으리</title>

<!-- CSS includes -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway"
   rel="stylesheet">
<link href="fonts/font-awesome/css/font-awesome.min.css"
   rel="stylesheet">
<link id="themecss" rel="stylesheet" type="text/css"
   href="https://www.shieldui.com/shared/components/latest/css/light-glow/all.min.css" />
<link href="css/services.css" rel="stylesheet">
<link href="css/layout.css" rel="stylesheet">
<!-- <link href="css/style.css" rel="stylesheet"> -->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
         <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
</head>

<style>
.map_wrap, .map_wrap * {
   margin: 0;
   padding: 0;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   font-size: 12px;
}

.map_wrap {
   position: relative;
   width: 719px;
   height: 630px;
}

#category {
   position: absolute;
   top: 10px;
   left: 10px;
   border-radius: 5px;
   border: 1px solid #909090;
   box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
   background: #fff;
   overflow: hidden;
   z-index: 2;
}

#category li {
   float: left;
   list-style: none;
   width: 50px; px;
   border-right: 1px solid #acacac;
   padding: 6px 0;
   text-align: center;
   cursor: pointer;
}

#category li.on {
   background: #eee;
}

#category li:hover {
   background: #ffe6e6;
   border-left: 1px solid #acacac;
   margin-left: -1px;
}

#category li:last-child {
   margin-right: 0;
   border-right: 0;
}

#category li span {
   display: block;
   margin: 0 auto 3px;
   width: 27px;
   height: 28px;
}

#category li .category_bg {
   background:
      url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
      no-repeat;
}

#category li .bank {
   background-position: -10px 0;
}

#category li .mart {
   background-position: -10px -36px;
}

#category li .pharmacy {
   background-position: -10px -72px;
}

#category li .oil {
   background-position: -10px -108px;
}

#category li .cafe {
   background-position: -10px -144px;
}

#category li .store {
   background-position: -10px -180px;
}

#category li.on .category_bg {
   background-position-x: -46px;
}

.placeinfo_wrap {
   position: absolute;
   bottom: 28px;
   left: -150px;
   width: 300px;
}

.placeinfo {
   position: relative;
   width: 100%;
   border-radius: 6px;
   border: 1px solid #ccc;
   border-bottom: 2px solid #ddd;
   padding-bottom: 10px;
   background: #fff;
}

.placeinfo:nth-of-type(n) {
   border: 0;
   box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
   content: '';
   position: relative;
   margin-left: -12px;
   left: 50%;
   width: 22px;
   height: 12px;
   background:
      url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
   color: #fff;
   text-decoration: none;
}

.placeinfo a, .placeinfo span {
   display: block;
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

.placeinfo span {
   margin: 5px 5px 0 5px;
   cursor: default;
   font-size: 13px;
}

.placeinfo .title {
   font-weight: bold;
   font-size: 14px;
   border-radius: 6px 6px 0 0;
   margin: -1px -1px 0 -1px;
   padding: 10px;
   color: #fff;
   background: #d95050;
   background: #d95050
      url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
      no-repeat right 14px center;
}

.placeinfo .tel {
   color: #0f7833;
}

.placeinfo .jibun {
   color: #999;
   font-size: 11px;
   margin-top: 0;
}

div.check {
   text-align: center;
}

#error {
   color: #333333;
   cursor: context-menu;
   display: none;
}
</style>

</head>
<body>

   <!-- Navbar -->
   <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
         <!-- Brand and toggle get grouped for better mobile display -->
         <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
               data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
               aria-expanded="false">
               <span class="sr-only">Toggle navigation</span> <span
                  class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
            <a href="#" title="Investment Business Bootstrap Theme"> <img
               class="logo" src="images/logo7.png"
               alt="Investment Business Bootstrap Theme" style="margin-top: 0;" />
            </a>
         </div>
         <!-- Collect the nav links, forms, and other content for toggling -->
         <div class="collapse navbar-collapse"
            id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
               <li><a href="index.html">HOME</a></li>
               <li><a href="about.html">TEAM</a></li>
               <li class="active"><a href="services.html"
                  class="smooth-scroll">SERVICES</a></li>
               <li><a href="contact.html">CONTACT</a></li>
            </ul>
         </div>
         <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
   </nav>

   <!-- service 페이지 상권분석 부분 -->
   <form action="data" name="dong">
      <div class="sub-content-wrap ng-scope" data-ng-init="changeAddr();"
         style="opacity: 1;">
         <div class="page-header">
            <h2>상권분석</h2>
         </div>
         <div class="map-wrap">
            <div class="side-select-area">
               <h3>
                  <strong>[1단계]</strong> 지역선택
               </h3>
               <div class="space-search">
                  <!-- 주소 입력 -->
                  <div class="tab-pane" id="address3">
                     <label class="control radio"> <input type="radio"
                        class="add-contrast ng-pristine ng-valid"
                        data-ng-model="searchAddrType" id="searchAddrTypeDong"
                        value="dong" alt="행정동" data-role="collar" checked="true"
                        name="004"> <span class="control-indicator"></span>지번
                     </label> <label class="control radio"> <input type="radio"
                        class="add-contrast ng-pristine ng-valid"
                        data-ng-model="searchAddrType" id="searchAddrTypeRoad"
                        value="road" alt="도로명" data-role="collar" name="004"> <span
                        class="control-indicator"></span>도로명
                     </label>
                     <div class="input-group">
                        <!-- 주소입력박스 -->
                        <label for="AddressDepth2" class="sr-only"></label> <input
                           type="text" id="input" data-ng-model="input"
                           class="form-control ng-pristine ng-valid" placeholder="주소, 상권">
                        <span class="input-group-btn"> <a class="btn btn-search"
                           onclick="mapSearch()" data-ng-click="inputAddrSearch(1)"
                           title="주소,상호,상권 검색 버튼"> <img src="images/search1.png"
                              alt="검색">
                        </a>
                        </span>
                     </div>
                     <!-- /주소입력박스 -->
                  </div>
               </div>
               <hr>
               <h3 id="selectUpjong">
                  <strong>[2단계]</strong> 동으로 검색
               </h3>
               <!-- 동으로 검색 박스 -->

               <div class="side-select">
                  <select id="select1" name="g" onchange="cityChange()"
                     class="btn btn-select btn-block" style="width: 216px">
                     <!-- style="width: 250px; height: 35px" -->
                     <option label="자치구를 선택하여 주십시오"></option>
                     <option>강남구</option>
                     <option>강동구</option>
                     <option>강북구</option>
                     <option>강서구</option>
                     <option>관악구</option>
                     <option>광진구</option>
                     <option>구로구</option>
                     <option>금천구</option>
                     <option>노원구</option>
                     <option>도봉구</option>
                     <option>동대문구</option>
                     <option>동작구</option>
                     <option>마포구</option>
                     <option>서대문구</option>
                     <option>서초구</option>
                     <option>성동구</option>
                     <option>성북구</option>
                     <option>송파구</option>
                     <option>양천구</option>
                     <option>영등포구</option>
                     <option>용산구</option>
                     <option>은평구</option>
                     <option>종로구</option>
                     <option>중구</option>
                     <option>중랑구</option>
                  </select> <select id="select2" name="d" class="btn btn-select btn-block"
                     style="width: 216px">
                  </select>
                  <h4 id="selectUpjong"></h4>
                  <input type="button" value="검색" onclick="mapSearch2()">
               </div>
               <hr>
               <h3>
                  <strong>[3단계]</strong> 업종선택
               </h3>
               <!-- 업종 선택 박스 -->
               <div class="side-select">
                  <select id="select3" name="service" onchange="foodChange()"
                     class="btn btn-select btn-block" style="width: 216px">
                     <option label="업종을 선택하여 주십시오"></option>
                     <option>한식</option>
                     <option>중식</option>
                     <option>일식</option>
                     <option>양식</option>
                     <option>분식</option>
                     <option>패스트푸드</option>
                     <option>치킨</option>
                     <option>제과</option>
                     <option>커피·음료</option>
                     <option>호프·간이주점</option>

                  </select>
               </div>

               <hr>
               <div class="side-select-btm">
                  <a href="javascript:void(0)" data-ng-click="eraseData()"
                     class="btn btn-secondary btm-btn btn-lg" title="초기화 버튼">초기화</a>&nbsp;
                  <input type="submit" class="btn btn-primary btm-btn btn-lg fr"
                     value="분석">
                  <div class="check">
                     <h2 id="error" style="display: ${sessionScope.areaCheck}">지역을
                        선택하세요.</h2>
                  
                  </div>
               </div>

               <!-- side-select-btm -->
            </div>
            <!-- side-select-area -->
            <div id="contentWrapper" class="map-right-area">

               <!-- roadViewWrapper -->
               <div class="map_wrap">
                  <div id="map"
                     style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

                  <ul id="category">
                     <li id="BK9" data-order="0"><span class="category_bg bank"></span>
                        은행</li>
                     <li id="MT1" data-order="1"><span class="category_bg mart"></span>
                        마트</li>
                     <li id="PM9" data-order="2"><span
                        class="category_bg pharmacy"></span> 약국</li>
                     <li id="OL7" data-order="3"><span class="category_bg oil"></span>
                        주유소</li>
                     <li id="CE7" data-order="4"><span class="category_bg cafe"></span>
                        카페</li>
                     <li id="CS2" data-order="5"><span class="category_bg store"></span>
                        편의점</li>
                  </ul>
               </div>
               <div id="map"></div>
               <!-- map_warp(daum map) -->
            </div>
            <!-- contentWrapper -->
         </div>
         <!-- /.map-wap -->
      </div>
   </form>

   <!-- sub-content-wrap -->


   <!-- ######################################## -->

</font>

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55d81c6e682f667cceb61a2a681598bf&libraries=services"></script>
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new daum.maps.LatLng(37.559053, 126.986759), // 지도의 중심좌표
         level : 9, // 지도의 확대 레벨
      };

      //지도를 생성합니다
      var map = new daum.maps.Map(mapContainer, mapOption), customOverlay = new daum.maps.CustomOverlay(
            {}), infowindow = new daum.maps.InfoWindow({
         removable : true
      });

      //=============================================================================================================
      //=============================================================================================================

      //일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
      var mapTypeControl = new daum.maps.MapTypeControl();

      // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
      // daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
      map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

      // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
      var zoomControl = new daum.maps.ZoomControl();
      map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

      //=============================================================================================================
      //=============================================================================================================

      function mapSearch() {

         var myAddress = document.getElementById("input").value;

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
             /*               var infowindow = new daum.maps.InfoWindow(
                                 {
                                    content : '<div style="width:150px;text-align:center;padding:6px 0;">여기요 여기</div>'
                                 });
                           infowindow.open(map, marker);
 */
                           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                           map.setCenter(coords);
                           var level = map.getLevel(); 
                           map.setLevel(level - 3);
                        }
			
                     });
         sendData(myAddress);
   
      }
      function sendData(data) {

         xhttp2 = new XMLHttpRequest();
         xhttp2.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
            }
         };
         xhttp2.open("POST", "data", true);
         xhttp2.setRequestHeader("Content-type",
               "application/x-www-form-urlencoded");
         xhttp2.send("d=" + data);

      }
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
                              + '<strong>상권 명 :'
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

      //마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
      var placeOverlay = new daum.maps.CustomOverlay({
         zIndex : 1
      }), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
      markers = [], // 마커를 담을 배열입니다
      currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

      // 장소 검색 객체를 생성합니다
      var ps = new daum.maps.services.Places(map);

      //지도에 idle 이벤트를 등록합니다
      daum.maps.event.addListener(map, 'idle', searchPlaces);

      // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
      contentNode.className = 'placeinfo_wrap';

      // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
      // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
      addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
      addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

      // 커스텀 오버레이 컨텐츠를 설정합니다
      placeOverlay.setContent(contentNode);

      // 각 카테고리에 클릭 이벤트를 등록합니다
      addCategoryClickEvent();

      // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
      function addEventHandle(target, type, callback) {
         if (target.addEventListener) {
            target.addEventListener(type, callback);
         } else {
            target.attachEvent('on' + type, callback);
         }
      }

      // 카테고리 검색을 요청하는 함수입니다
      function searchPlaces() {
         if (!currCategory) {
            return;
         }

         // 커스텀 오버레이를 숨깁니다 
         placeOverlay.setMap(null);

         // 지도에 표시되고 있는 마커를 제거합니다
         removeMarker();

         ps.categorySearch(currCategory, placesSearchCB, {
            useMapBounds : true
         });
      }

      // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
      function placesSearchCB(data, status, pagination) {
         if (status === daum.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
            displayPlaces(data);
         } else if (status === daum.maps.services.Status.ZERO_RESULT) {
            // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

         } else if (status === daum.maps.services.Status.ERROR) {
            // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

         }
      }

      // 지도에 마커를 표출하는 함수입니다
      function displayPlaces(places) {

         // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
         // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
         var order = document.getElementById(currCategory).getAttribute(
               'data-order');

         for (var i = 0; i < places.length; i++) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new daum.maps.LatLng(places[i].y,
                  places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
               daum.maps.event.addListener(marker, 'click', function() {
                  displayPlaceInfo(place);
               });
            })(marker, places[i]);
         }
      }

      // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
      function addMarker(position, order) {
         var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
         imageSize = new daum.maps.Size(27, 28), // 마커 이미지의 크기
         imgOptions = {
            spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset : new daum.maps.Point(11, 28)
         // 마커 좌표에 일치시킬 이미지 내에서의 좌표
         }, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
               imgOptions), marker = new daum.maps.Marker({
            position : position, // 마커의 위치
            image : markerImage
         });

         marker.setMap(map); // 지도 위에 마커를 표출합니다
         markers.push(marker); // 배열에 생성된 마커를 추가합니다

         return marker;
      }

      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
      function removeMarker() {
         for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
         }
         markers = [];
      }

      // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
      function displayPlaceInfo(place) {
         var content = '<div class="placeinfo">'
               + '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
               + place.place_name + '</a>';

         if (place.road_address_name) {
            content += '    <span title="' + place.road_address_name + '">'
                  + place.road_address_name
                  + '</span>'
                  + '  <span class="jibun" title="' + place.address_name + '">(지번 : '
                  + place.address_name + ')</span>';
         } else {
            content += '    <span title="' + place.address_name + '">'
                  + place.address_name + '</span>';
         }

         content += '    <span class="tel">' + place.phone + '</span>'
               + '</div>' + '<div class="after"></div>';

         contentNode.innerHTML = content;
         placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
         placeOverlay.setMap(map);
      }

      // 각 카테고리에 클릭 이벤트를 등록합니다
      function addCategoryClickEvent() {
         var category = document.getElementById('category'), children = category.children;

         for (var i = 0; i < children.length; i++) {
            children[i].onclick = onClickCategory;
         }
      }

      // 카테고리를 클릭했을 때 호출되는 함수입니다
      function onClickCategory() {
         var id = this.id, className = this.className;

         placeOverlay.setMap(null);

         if (className === 'on') {
            currCategory = '';
            changeCategoryClass();
            removeMarker();
         } else {
            currCategory = id;
            changeCategoryClass(this);
            searchPlaces();
         }
      }

      // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
      function changeCategoryClass(el) {
         var category = document.getElementById('category'), children = category.children, i;

         for (i = 0; i < children.length; i++) {
            children[i].className = '';
         }

         if (el) {
            el.className = 'on';
         }
      }

      //=============================================================================================================
      //=============================================================================================================

      function cityChange() {

         var 강남 = [ "개포동", "논현동", "대치동", "도곡동", "삼성동", "압구정동", "역삼동", "일원동",
               "청담동" ];
         var 강동 = [ "강일동", "고덕동", "길동", "둔촌동", "명일동", "상일동", "성내동", "암사동",
               "천호동" ];
         var 강북 = [ "미아동", "번동", "삼양동", "송중동", "송천동", "수유동" ];
         var 강서 = [ "가양동", "공항동", "등촌동", "발산동", "방화동", "염창동", "우장산동", "화곡동" ];
         var 관악 = [ "낙성대동", "난곡동", "남현동", "대학동", "미성동", "보라매동", "서림동",
               "신림동", "신사동", "신원동", "은천동", "인헌동", "조원동", "조원동", "중앙동",
               "청룡동", "행운동" ];
         var 광진 = [ "광장동", "구의동", "군자동", "능동", "자양동", "중곡동", "화양동" ];
         var 구로 = [ "가리봉동", "개봉동", "고척동", "구로동", "수궁동", "신도림동", "오류동" ];
         var 금천 = [ "가산동", "독산동", "시흥동" ];
         var 노원 = [ "공릉동", "상계동", "월계동", "중계동" ];
         var 도봉 = [ "도봉동", "방학동", "쌍문동", "창동" ];
         var 동대문 = [ "답십리동", "용신동", "이문동", "장안동", "전농동", "제기동", "청량리동",
               "회기동", "휘경동" ];
         var 동작구 = [ "노량진동", "대방동", "사당동", "상도동", "신대방동", "흑석동" ];
         var 마포구 = [ "공덕동", "대흥동", "도화동", "망원동", "상암동", "서교동", "성산동", "신수동",
               "아현동", "연남동", "염리동", "합정동" ];
         var 서대문 = [ "남가좌동", "북가좌동", "신촌동", "연희동", "천연동", "홍은동", "홍제동" ];
         var 서초 = [ "반포동", "방배동", "서초동", "양재동", "잠원동" ];
         var 성동 = [ "금호동", "마장동", "사근동", "성수동", "옥수동", "왕십리동", "용답동", "행당동" ];
         var 성북 = [ "길음동", "동선동", "보문동", "삼선동", "석관동", "성북동", "안암동", "월곡동",
               "장위동", "정릉동", "종암동" ];
         var 송파 = [ "가락동", "거여동", "마천동", "문정동", "방이동", "삼전동", "석촌동", "송파동",
               "오금동", "잠실동", "장지동", "풍납동" ];
         var 양천 = [ "목동", "신월동", "신정동" ];
         var 영등포 = [ "당산동", "대림동", "문래동", "신길동", "양평동", "영등포동" ];
         var 용산 = [ "남영동", "용문동", "원효로동", "이촌동", "이태원동", "청파동", "한강로동",
               "한남동", "후암동" ];
         var 은평 = [ "갈현동", "대조동", "불광동", "수색동", "신사동", "응암동", "증산동" ];
         var 종로 = [ "가회동", "사직동", "삼청동", "숭인동", "이화동", "종로5.6가동", "창신동",
               "청운효자동", "평창동" ];
         var 중 = [ "다산동", "동화동", "명동", "신당동", "약수동", "중림동", "청구동", "황학동",
               "회현동" ];
         var 중랑 = [ "망우본동", "면목동", "묵동", "상봉동", "신내동", "중화동" ];

         var selectCity = $("#select1").val();

         var changeCity;

         if (selectCity == "강남구") {
            changeCity = 강남;
         } else if (selectCity == "강동구") {
            changeCity = 강동;
         } else if (selectCity == "강북구") {
            changeCity = 강북;
         } else if (selectCity == "강서구") {
            changeCity = 강서;
         } else if (selectCity == "관악구") {
            changeCity = 관악;
         } else if (selectCity == "광진구") {
            changeCity = 광진;
         } else if (selectCity == "구로구") {
            changeCity = 구로;
         } else if (selectCity == "금천구") {
            changeCity = 금천;
         } else if (selectCity == "노원구") {
            changeCity = 노원;
         } else if (selectCity == "도봉구") {
            changeCity = 도봉;
         } else if (selectCity == "동대문구") {
            changeCity = 동대문;
         } else if (selectCity == "동작구") {
            changeCity = 동작구;
         } else if (selectCity == "마포구") {
            changeCity = 마포구;
         } else if (selectCity == "서대문구") {
            changeCity = 서대문;
         } else if (selectCity == "서초구") {
            changeCity = 서초;
         } else if (selectCity == "성동구") {
            changeCity = 성동;
            mapSearch3();
            golmok();
            getData(false);
         } else if (selectCity == "성북구") {
            changeCity = 성북;
         } else if (selectCity == "송파구") {
            changeCity = 송파;
         } else if (selectCity == "양천구") {
            changeCity = 양천;
         } else if (selectCity == "영등포구") {
            changeCity = 영등포;
         } else if (selectCity == "용산구") {
            changeCity = 용산;
         } else if (selectCity == "은평구") {
            changeCity = 은평;
         } else if (selectCity == "종로구") {
            changeCity = 종로;
         } else if (selectCity == "중구") {
            changeCity = 중;
         } else if (selectCity == "중랑구") {
            changeCity = 중랑;
         }

         $('#select2').empty();

         for (var count = 0; count < changeCity.length; count++) {
            var option = $("<option>" + changeCity[count] + "</option>");
            $('#select2').append(option);
         }

         //stopRefresh();

      }

      /* var checkFrm = function() {
       //console.log(document.frm.s.options.length); -옵션의 갯수 나옴
       //console.log(document.frm.s.options.selectedIndex); 
       //-선택된 옵션의 위치값
       var index1 = document.dong.g.options.selectedIndex;
       var index2 = document.dong.d.options.selectedIndex;
       console.log(document.dong.g.options[index1].text);
       console.log(document.dong.d.options[index2].text);
       };
       */
      function mapSearch2() {

         var index1 = document.dong.g.options.selectedIndex;
         var index2 = document.dong.d.options.selectedIndex;
         var myAddress = document.dong.g.options[index1].text + " "
               + document.dong.d.options[index2].text

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
                           var infowindow = new daum.maps.InfoWindow(
                                 {
                                    content : '<div style="width:150px;text-align:center;padding:6px 0;"></div>'
                                 });
                           //infowindow.open(map, marker);

                           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                           map.setCenter(coords);
            
                           var level = map.getLevel(); 
                           map.setLevel(level - 3);
                            // 지도를 1레벨 내립니다 (지도가 확대됩니다)
                            
                        }
                     });
      
      }

      function mapSearch3() {

         var coords = new daum.maps.LatLng(37.558085, 127.042761);

         // 결과값으로 받은 위치를 마커로 표시합니다
         var marker = new daum.maps.Marker({
            map2 : map,
            position : coords
         });

         // 인포윈도우로 장소에 대한 설명을 표시합니다
         var infowindow = new daum.maps.InfoWindow(
               {
                  content : '<div style="width:150px;text-align:center;padding:6px 0;"></div>'
               });
         infowindow.open(map, marker);

         // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
         map.setCenter(coords);
      }

      function golmok() {

         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            center : new daum.maps.LatLng(37.556259, 127.045495), // 지도의 중심좌표
            level : 6, // 지도의 확대 레벨
         };

         var map2 = new daum.maps.Map(mapContainer, mapOption), customOverlay = new daum.maps.CustomOverlay(
               {}), infowindow = new daum.maps.InfoWindow({
            removable : true
         });

         function getData2() {
            var arrayDong = [];
            $.getJSON('golmok.json', function(data) {
               $.each(data, function(i, area) {
                  arrayDong.push(area);
               });
               var areas = getPath2(arrayDong)
               for (var i = 0, len = areas.length; i < len; i++) {
                  displayArea(areas[i]);
               }
            });

         }

         function getPath2(data) {
            var area = []
            for (var i = 0; i < data.length; i++) {
               var dong = {}
               name = data[i]["name"];
               path = data[i]["path"];
               var posList = []
               for (var j = 0; j < path.length; j++) {
                  pos = new daum.maps.LatLng(path[j][0], path[j][1])
                  posList.push(pos)
               }
               dong["name"] = name
               dong["path"] = posList
               area.push(dong)
            }

            return area
         }

         getData2();

         function displayArea(area) {

            // 지도에 표시할 다각형을 생성합니다
            var polygon = new daum.maps.Polygon({
               map : map2,
               path : area.path, // 그려질 다각형의 좌표 배열입니다
               strokeWeight : 2, // 선의 두께입니다
               strokeColor : '#f74e16', // 선의 색깔입니다
               strokeOpacity : 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
               strokeStyle : 'solid', // 선의 스타일입니다
               fillColor : '#f2744b', // 채우기 색깔입니다
               fillOpacity : 0.5
            // 채우기 불투명도 입니다
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
                                 + '<strong>상권 명 :'
                                 + area.name
                                 + '</strong>'
                           infowindow.setContent(content);
                           infowindow.setPosition(mouseEvent.latLng);
                           infowindow.setMap(map);
                        });
         }
      }

      //=============================================================================================================
      //=============================================================================================================

      function foodChange() {

         var korea = [ "분식", "백반", "국수" ];
         var china = [ "짜장면", "딤섬", "양꼬치" ];
         var japan = [ "스시", "라멘", "돈부리" ];

         var selectFood = $("#select3").val();

         var changeFood;

         if (selectFood == "한 식") {
            changeFood = korea;
         } else if (selectFood == "중 식") {
            changeFood = china;
         } else if (selectFood == "일 식") {
            changeFood = japan;
         }

         $('#select4').empty();

         for (var count = 0; count < changeFood.length; count++) {
            var option = $("<option>" + changeFood[count] + "</option>");
            $('#select4').append(option);
         }

      }
   </script>
</body>
</html>