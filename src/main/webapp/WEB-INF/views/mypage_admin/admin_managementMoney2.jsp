<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- 필요한 태그 라이브러리는 추가하셔서 사용하시면 됩니다. -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"
	scope="application" />
<c:set var="CONTEXT_PATH_ADMIN"
	value="${pageContext.request.contextPath}/mypage/admin"
	scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources"
	scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/static.jsp"%>
<!-- 경로를 확인해 주세요 -->
<title>관리자페이지</title>
<!-- 페이지 이름을 적어주세요 -->
<link rel="stylesheet"
	href="${RESOURCES_PATH}/src/css/admin/admin_main_managementMoney.css">
<script src="${RESOURCES_PATH}/src/js/admin_main.js" defer></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"
	defer></script>
<!-- 해당 페이지에서만 사용되는 자바스크립트 파일 추가해주세요 -->
</head>
<body>
	<div class="iruri__wrapper">
		<%@ include file="../include/headerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->
	</div>

	<div class="wrap">
		<div class="userInfoBox">
			<h2>관리자명</h2>
			<p>
				관리자명<br> iruri123@iruri.com
			</p>
		</div>
		<div id="admin_managementMenu">
			<ul>
				<li><a href="${CONTEXT_PATH_ADMIN}/main"> 회원관리<br> <span></span>
				</a></li>
				<li><a href="${CONTEXT_PATH_ADMIN}/trainer/list"> 트레이너관리<br>
						<span></span>
				</a></li>
				<li><a href="${CONTEXT_PATH_ADMIN}/paylist"> <span
						class="admin_active">수익관리</span><br> <span class="under_line"></span>
				</a></li>
			</ul>
		</div>

		<!---------------------- 수익관리 하위 메뉴 -------------------------->
		<div id="admin_memberTabMenu">
			<input type="radio" id="tap1" name="taps"
				onclick="userPart('member')" value="1" checked> <label
				for="tap1">전체수익</label> <input type="radio" id="tap2" name="taps"
				onclick="userPart('trainer')" value="2"> <label for="tap2">트레이너별
				수익</label>
		</div>

		<!------------------------ 트레이너 검색 --------------------------->
		<div id="trainerNameSearch" style="display:none">
			<div class="admin_sales_trainerChoice" style="margin-bottom: 30px;">
				<form>
					<input type="text" name="trainerSearch">
					<button type="button" id="trainerSearch_button"></button>
					<ul class="a"><li>트레이너를 검색하세요</li></ul>;
				</form>
			</div>
		</div>
		<!---------------------- 전체수익 탭 -------------------------->
		<div id="admin_sales_All" class="admin_sales_All">
			<div class="admin_sales_dayAndMonth">
				<div class="admin_today_sales">
					<h3>오늘의 매출</h3>
					<p>
						2,000,000<span>원</span>
					</p>
				</div>
				<div class="admin_monthly_sales">
					<h3>월별매출</h3>
					<div>그래프</div>
				</div>
			</div>

			<div class="admin_sales_inquiry">
				<form action="">
					<table>
						<tr class="inquiry_types">
							<td>
								<h3>조회구분</h3>
							</td>
							<td><input type="radio" name="inquiry_type" id="rd1"
								value="all" checked> <label for="rd1"><span></span>전체내역</label>
								<input type="radio" name="inquiry_type" id="rd2" value="input">
								<label for="rd2"><span></span>입금내역</label> <input type="radio"
								name="inquiry_type" id="rd3" value="output"> <label
								for="rd3"><span></span>출금내역</label></td>
						</tr>
						<tr class="inquiry_period">
							<td>
								<h3>조회기간</h3>
							</td>
							<td>
								<form>
									<select id="inquiry_startdate_year"
										class="inquiry_startdate_year" name="sy"
										onchange="javascript:start_lastday()"></select> <span>년</span>
									<select id="inquiry_startdate_month"
										class="inquiry_startdate_month" name="sm"
										onchange="javascript:start_lastday()">
									</select> <span>월</span> <select id="inquiry_startdate_day"
										class="inquiry_startdate_day" name="sd">
									</select> <span>일</span>

									<p>~</p>

									<select id="inquiry_enddate_year" class="inquiry_enddate_year"
										onchange="javascript:end_lastday()" name="ey">
									</select> <span>년</span> <select id="inquiry_enddate_month"
										class="inquiry_enddate_month" name="em"
										onchange="javascript:end_lastday()">
									</select> <span>월</span> <select id="inquiry_enddate_day"
										class="inquiry_enddate_day" name="ed">

									</select> <span>일</span>
									<button id="inquiry_period_button" type="button">검색</button>
								</form>

							</td>
						</tr>
						<tr>
							<td></td>
							<td class="inquiry_quick_button">
								<button type="button" onclick="simpleInquire('lately')">최근
									30건</button>
								<button type="button" onclick="simpleInquire('today')">오늘</button>
								<button type="button" onclick="simpleInquire('before15Days')">15일</button>
								<button type="button" onclick="simpleInquire('before1Month')">1개월</button>
								<button type="button" onclick="simpleInquire('before3Month')">3개월</button>
								<button type="button" onclick="simpleInquire('before6Month')">6개월</button>
								<button type="button" onclick="simpleInquire('before1Year')">1년</button>
							</td>
						</tr>
					</table>
				</form>
			</div>

			<div class="admin_sales_table">
				<table class="admin_table __all">

					<!-- ajax 수익 리스트 -->

				</table>

				<div class="page_nation">

					<!-- ajax 페이징 구현 -->

				</div>
			</div>
		</div>

		<script type="text/javascript">
		$(document).ready(function() {
			console.log("시작!");
			getlist(1, 0, 'all', 0, 0);
		})
		
		
			function userPart(part) {
			
			console.log("userPart()..");
				
				$('input[name=trainerChoice]').removeAttr('checked');
				
				
				$("#rd1").attr('checked', 'checked');
				$("#rd2").removeAttr('checked');
				$("#rd3").removeAttr('checked');
				
				const inquireType = $('input[name=inquiry_type]:checked').val();
				console.log("inquire: " + inquireType);

				$('select[name=sy]').val("");
				$('select[name=sm]').val("");
				$('select[name=sd]').val("");
				$('select[name=ey]').val("");
				$('select[name=em]').val("");
				$('select[name=ed]').val("");
				
				if (part == 'trainer') {
					var userPart = 'trainer';
					console.log('trainer');
					$("#trainerNameSearch").css("display", "block");
					trainerSearch('iruriAdmin15978213');
				} else {
					var userId = 0;
					console.log('member');
					$("#trainerNameSearch").css("display", "none");
					getlist(1, 0, 'all', 0, 0);
				}
			}

			function trainerSearch(word) {
				
				const keyword = word;
				
				console.log("trainerSearch()..");
				console.log(keyword);
				$.ajax({
					url : '${CONTEXT_PATH_ADMIN}/ajax/trainerSearch',
					type : 'GET',
					cache : false,
					dataType : 'json',
					data : {
						'keyword' : keyword,
					},
					success : function(result) {
						console.log("성공");
						var list = result['list'];
		                var htmls = "";
						
		                htmls += '<div class="admin_sales_trainerChoice" style="margin-bottom: 30px;">'
		                	+ '<form><input type="text" name="trainerSearch"><button type="button" id="trainerSearch_button"></button></form>';
		               
		                	
		                if(list.length < 1){
		                	htmls += '<ul class="a"><li>트레이너를 검색하세요</li></ul>';
		                } else {
		                	htmls += '<ul class="admin_sales_trainerResultY">';
		                	
		                	$(list).each(function(){
		                		htmls += '<input type="radio" style="appearance: none; cursor: point;" name="trainerChoice" id="trainerChoice_' + this.iuserVo.userId + '">'
		                			+ '<label style="width: 33%;" for="trainerChoice_' + this.iuserVo.userId + '">'
		                			+ '<li><span><img src="${RESOURCES_PATH}/src/img/icon/icon_page_arrow_right.png"></span>'
		                			+ '<span class="trainerChoice_id">'
		                			+ this.iuserVo.userId
		                			+ '</span> <span class="trainerChoice_name">'
		                			+ this.iuserVo.userName
		                			+ '</span>';
		                			
		                		if(this.authVo.authContent == 'ROLE_LEAVE'){
		                			htmls += '<span style="font-size: 12px; color: #999999;">(탈퇴회원';
		                			if(this.iuserVo.userBlackList == true) {
		                				htmls += ' / 블랙리스트';
		                			}
		                			htmls += ')</span>';
	                			}
		                		
		                		
	                			htmls += '</li></label>';
		                		
		                	});
		                	
		                	htmls += '</ul>';
		                }
		                
		                htmls +='</div>';
		                
		                $("#trainerNameSearch").html(htmls);
		                getlist(1, 987654321, 'all', 0, 0);
					}
					    
				});
				
			}
			
			function valueCheck() {

				let currentUserId = $('input[name=trainerChoice]:checked').val();
				if(currentUserId == null) {
					var userId = 987654321;
				}
				const tapsValue = $('input[name=taps]:checked').val();
				console.log("inputname :" + tapsValue);
				if (tapsValue == 1) {
					var userId = 0;
				}
				console.log("userId :" + userId);

				const inquireType = $('input[name=inquiry_type]:checked').val();
				console.log("inquire: " + inquireType);

				if (inquireType != null) {
					var inquire = inquireType;
				} else {
					var inquire = 'all';
				}

				const sy = $('select[name=sy]').val();
				console.log("sy: " + sy);
				const sm = $('select[name=sm]').val();
				console.log("sm: " + sm);
				const sd = $('select[name=sd]').val();
				console.log("sd: " + sd);
				const ey = $('select[name=ey]').val();
				console.log("ey:" + ey);
				const em = $('select[name=em]').val();
				console.log("em: " + em);
				const ed = $('select[name=ed]').val();
				console.log("ed: " + ed);

				if ((sy != null && sy != "") && (sm != null && sm != "")
						&& (sd != null && sd != "") && (ey != null && ey != "")
						&& (em != null && em != "") && (ed != null && ed != "")) {

					let today = new Date();
					let todayStr = String(today.getFullYear())
							+ dateCheck((today.getMonth() + 1))
							+ dateCheck(today.getDate());
					let periodStartDate = sy + dateCheck(sm) + dateCheck(sd);
					let periodEndDate = ey + dateCheck(em) + dateCheck(ed);

					console.log("today: " + todayStr);
					console.log("periodStartDate: " + periodStartDate);
					console.log("periodEndDate: " + periodEndDate);

					if ((periodStartDate < todayStr && periodEndDate <= periodEndDate)
							&& (periodStartDate < periodEndDate)) {

						getlist(1, userId, inquire, periodStartDate,
								periodEndDate);

					} else {
						alert("기간을 다시 입력하세요.");
					}
				} else if ((sy == null || sy == "") && (sm == null || sm == "")
						&& (sd == null || sd == "") && (ey == null || ey == "")
						&& (em == null || em == "") && (ed == null || ed == "")) {
					getlist(1, userId, inquire, 0, 0);
				} else {
					alert("기간을 다시 입력하세요.");
				}

			}

			function dateCheck(number) {
				number = Number(number).toString();
				if (Number(number) < 10 && number.length == 1)
					number = "0" + number;
				return number;
			}

			function getlist(page, userId, inquire, periodStartDate, periodEndDate) {

				$.ajax({
							url : '${CONTEXT_PATH_ADMIN}/ajax/paylist',
							type : 'GET',
							cache : false,
							dataType : 'json',
							data : {
								'pageNum' : page,
								'userId' : userId,
								'inquire' : inquire,
								'periodStartDate' : periodStartDate,
								'periodEndDate' : periodEndDate,
							},
							success : function(result) {
								console.log("성공");

								var list = result['list'];
								var pagination = result['pageMaker'];
								var htmls = "";
								var htmls2 = "";

								htmls += '<tr><th>날짜</th><th>내용</th><th>이름</th><th>입금</th><th>출금</th><th>잔금</th></tr>';

								if (list.length < 1) {
									htmls += '<tr>';
									htmls += '<td colspan="6" class="table_No_date" style="padding: 100px; text-align: center;">'
											+ '입금/출금 내역이 없습니다.' + '</td>';
									htmls += '</tr>';

								} else {

									$(list)
											.each(
													function() {
														htmls += '<tr>'
																+ '<td class="table_No_date">'
																+ moment(
																		this.moneyVo.moneyDate)
																		.format(
																				'YYYY.MM.DD')
																+ '</td>'
																+ '<td class="table_indigo_text">'
																+ this.iclassVo.classTitle
																+ '</td>'
																+ '<td class="table_indigo_text">'
																+ this.iuserVo.userNickname
																+ '</td>'
																+ '<td class="table_blue_text">'
																+ priceToString(this.moneyVo.moneyInput)
																+ '</td>'
																+ '<td class="table_red_text">'
																+ priceToString(this.moneyVo.moneyOutput)
																+ '</td>'
																+ '<td class="table_blue_text">'
																+ priceToString(this.totalMoney)
																+ '</td>'
																+ '</tr>';

													});

									console.log(page + ',' + userId + ','
											+ inquire + ',' + periodStartDate
											+ ',' + periodEndDate);

									/* ------------------ 페이징 부분 --------------------- */
									if (pagination['prev']) {
										htmls2 += '<a class="arrow prev" href="#admin_memberTabMenu" onclick="javascript:getlist(\''
												+ (pagination['startPage'] - 1)
												+ '\',\''
												+ userId
												+ '\',\''
												+ inquire
												+ '\',\''
												+ periodStartDate
												+ '\',\''
												+ periodEndDate + '\');"></a>';
									}

									// 번호를 표시하는 부분
									for (var idx = pagination['startPage']; idx <= pagination['endPage']; idx++) {
										if (page != idx) {
											htmls2 += '<a class="pageNumLink" href="#admin_memberTabMenu" onclick="javascript:getlist(\''
													+ idx
													+ '\',\''
													+ userId
													+ '\',\''
													+ inquire
													+ '\',\''
													+ periodStartDate
													+ '\',\''
													+ periodEndDate
													+ '\');">' + idx + "</a>";
										} else {
											htmls2 += '<a class="pageNumLink active" href="#admin_memberTabMenu" onclick="javascript:getlist(\''
													+ idx
													+ '\',\''
													+ userId
													+ '\',\''
													+ inquire
													+ '\',\''
													+ periodStartDate
													+ '\',\''
													+ periodEndDate
													+ '\');">' + idx + "</a>";
										}
									}

									if (pagination['next']) {
										htmls2 += '<a class="arrow next" href="#admin_memberTabMenu" onclick="javascript:getlist(\''
												+ (pagination['endPage'] + 1)
												+ '\',\''
												+ userId
												+ '\',\''
												+ inquire
												+ '\',\''
												+ periodStartDate
												+ '\',\''
												+ periodEndDate + '\');"></a>';

									}
								} // if(list.length < 1) else 끝

								$(".admin_table").html(htmls);
								$(".page_nation").html(htmls2);

							}
						});

			}

			function simpleInquire(type) {

				const tapsValue = $('input[name=taps]:checked').val();
				console.log("inputname :" + tapsValue);
				if (tapsValue == 1) {
					var userId = 0;
				}
				console.log("userId :" + userId);

				const inquireType = $('input[name=inquiry_type]:checked').val();
				console.log("inquire: " + inquireType);
				console.log("type: " + type);

				$('select[name=sy]').val('');
				$('select[name=sm]').val('');
				$('select[name=sd]').val('');
				$('select[name=ey]').val('');
				$('select[name=em]').val('');
				$('select[name=ed]').val('');

				let today = new Date();

				let year = today.getFullYear();
				let month = today.getMonth() + 1;
				let day = today.getDate();

				if (type == 'lately') {
					console.log(inquireType);
					getlist(1, userId, inquireType, '30', 0);

				} else if (type == "today") {
					let periodStartDate = String(today.getFullYear())
							+ dateCheck((today.getMonth() + 1))
							+ dateCheck(today.getDate());
					let periodEndDate = String(today.getFullYear())
							+ dateCheck((today.getMonth() + 1))
							+ dateCheck(today.getDate());
					getlist(1, userId, inquireType, periodStartDate,
							periodEndDate);

				} else if (type == "before15Days") {
					let periodStartDate = String(today.getFullYear())
							+ dateCheck(today.getMonth() + 1)
							+ dateCheck(today.getDate() - 15);
					let periodEndDate = String(today.getFullYear())
							+ dateCheck((today.getMonth() + 1))
							+ dateCheck(today.getDate());
					getlist(1, userId, inquireType, periodStartDate,
							periodEndDate);

				} else if (type == "before1Month") {
					let periodStartDate = String(today.getFullYear())
							+ dateCheck(today.getMonth())
							+ dateCheck(today.getDate());
					let periodEndDate = String(today.getFullYear())
							+ dateCheck((today.getMonth() + 1))
							+ dateCheck(today.getDate());
					getlist(1, userId, inquireType, periodStartDate,
							periodEndDate);

				} else if (type == "before3Month") {
					let periodStartDate = String(today.getFullYear())
							+ dateCheck(today.getMonth() - 2)
							+ dateCheck(today.getDate());
					let periodEndDate = String(today.getFullYear())
							+ dateCheck((today.getMonth() + 1))
							+ dateCheck(today.getDate());
					getlist(1, userId, inquireType, periodStartDate,
							periodEndDate);

				} else if (type == "before6Month") {
					let periodStartDate = String(today.getFullYear())
							+ dateCheck(today.getMonth() - 5)
							+ dateCheck(today.getDate());
					let periodEndDate = String(today.getFullYear())
							+ dateCheck((today.getMonth() + 1))
							+ dateCheck(today.getDate());
					getlist(1, userId, inquireType, periodStartDate,
							periodEndDate);

				} else if (type == "before1Year") {
					let periodStartDate = String(today.getFullYear() - 1)
							+ dateCheck(today.getMonth() + 1)
							+ dateCheck(today.getDate());
					let periodEndDate = String(today.getFullYear())
							+ dateCheck((today.getMonth() + 1))
							+ dateCheck(today.getDate());
					getlist(1, userId, inquireType, periodStartDate,
							periodEndDate);
				}

			}

			document.getElementById("rd1").addEventListener("click",
					function() {
						valueCheck();
					}, false);
			document.getElementById("rd2").addEventListener("click",
					function() {
						valueCheck();
					}, false);
			document.getElementById("rd3").addEventListener("click",
					function() {
						valueCheck();
					}, false);
			document.getElementById("inquiry_period_button").addEventListener(
					"click", function() {
						valueCheck();
					}, false);

			document.getElementById("trainerSearch_button").addEventListener(
					"click", function() {
						console.log("trainerSearch_button..");
						const word = $("input[name=trainerSearch]").val();
						trainerSearch(word);
					}, false);
			
			/* document.querySelector("input[name=trainerChoice]").addEventListener(
					"click", function() {
						valueCheck();
					}, false); */
			
		</script>


		<script>
		
			var today = new Date();
			var start_year = today.getFullYear() - 5; // 시작할 년도 
			var today_year = today.getFullYear();

			// 시작일 선택
			var index = 1;
			for (var y = today_year; y >= start_year; y--) { //start_year ~ 현재 년도 
				document.getElementById('inquiry_startdate_year').options[index] = new Option(
						y, y);
				index++;
			}
			var index = 1;
			for (var m = 1; m <= 12; m++) {
				document.getElementById('inquiry_startdate_month').options[index] = new Option(
						m, m);
				index++;
			}

			function start_lastday() { //년과 월에 따라 마지막 일 구하기 
				var Year = document.getElementById('inquiry_startdate_year').value;
				var Month = document.getElementById('inquiry_startdate_month').value;
				var lastday = 0;
				var dayindex_len = document
						.getElementById('inquiry_startdate_day').length;

				if (Month == 1 || Month == 3 || Month == 5 || Month == 7
						|| Month == 8 || Month == 10 || Month == 12) {
					lastday = 31;
				} else if (Month == 4 || Month == 6 || Month == 9) {
					lastday = 30;
				} else if (Month == 2) {
					if ((Year - 2016) % 4 == 0) {
						lastday = 29;
					} else {
						lastday = 28;
					}
				} else {
					lastday = 0;
				}

				index = 1;
				if (lastday < dayindex_len) {
					for (var d = 1; d <= dayindex_len; d++) {
						document.getElementById('inquiry_startdate_day').options[index] = null;
						index++;
					}
				}

				index = 1;
				for (var d = 1; d <= lastday; d++) {
					document.getElementById('inquiry_startdate_day').options[index] = new Option(
							d, d);
					index++;
				}
			}

			// 끝 날짜
			index = 1;
			for (var y = today_year; y >= start_year; y--) { //start_year ~ 현재 년도 
				document.getElementById('inquiry_enddate_year').options[index] = new Option(
						y, y);
				index++;
			}
			index = 1;
			for (var m = 1; m <= 12; m++) {
				document.getElementById('inquiry_enddate_month').options[index] = new Option(
						m, m);
				index++;
			}
			end_lastday();

			function end_lastday() { //년과 월에 따라 마지막 일 구하기 
				var Year = document.getElementById('inquiry_enddate_year').value;
				var Month = document.getElementById('inquiry_enddate_month').value;
				var lastday = 0;
				var dayindex_len = document
						.getElementById('inquiry_enddate_day').length;

				if (Month == 1 || Month == 3 || Month == 5 || Month == 7
						|| Month == 8 || Month == 10 || Month == 12) {
					lastday = 31;
				} else if (Month == 4 || Month == 6 || Month == 9) {
					lastday = 30;
				} else if (Month == 2) {
					if ((Year - 2012) % 4 == 0) {
						lastday = 29;
					} else {
						lastday = 28;
					}
				}

				index = 1;
				if (lastday < dayindex_len) {
					for (var d = 1; d <= dayindex_len; d++) {
						document.getElementById('inquiry_enddate_day').options[index] = null;
						index++;
					}
				}

				index = 1;
				for (var d = 1; d <= lastday; d++) {
					document.getElementById('inquiry_enddate_day').options[index] = new Option(
							d, d);
					index++;
				}
			}
		</script>

	</div>


	<div class="iruri__wrapper">
		<%@ include file="../include/footerTemplate.jsp"%><!-- 경로를 확인해 주세요 -->

	</div>
</body>
</html>