<%@page import="model.vo.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>결제하기</title>

<!-- Custom styles for this template -->
<link href="resources/css/payment.css" rel="stylesheet">
<!-- 지우지 마세요!! -->
</head>

<body>

	<%-- <%@ include file = "views/common/header_my.jsp" %> --%>
	<%@ include file="views/common/header.jsp"%>

	<%
		// 장바구니 객체 - 주문내역
		ArrayList<ShopOrder> soList = null;
		if (m != null) {
			soList = (ArrayList<ShopOrder>) session.getAttribute("soList");
		} else {
			soList = (ArrayList<ShopOrder>) session.getAttribute("noList");
		}
		System.out.println("payment.jsp : " + soList);

		//Member m = (Member)session.getAttribute("member"); 
		//System.out.println("payment"+m);
	%>
	<!-- Page Content -->
	<div class="container">
		<br> <br>
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">결제하기</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index_login.html">Home</a>
			</li>
			<li class="breadcrumb-item active">결제하기</li>
		</ol>
		<br>
		<div class="row">
			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<!-- Blog Post -->
				<form action="">
					<div class="pay">
						<h4 class="pay_header">배달정보</h4>
						<div class="delivery_content">
							<input type="radio" name="radioTxt" id="radioChk" value="addAddr"
								style="margin-left: 50px;">&nbsp;&nbsp;새로 입력<br> <br>
							<div class="pay_h_txt">
								<label>주소</label>
							</div>
							<%
								if (m != null) {
							%>
							<input class="input-erase" type="text" size="70" name="addr"
								value="<%=m.getUSER_ADDRESS()%>" style="float: left;"><br>
							<br>

							<%
								} else {
							%>
							<input class="input-erase" type="text" size="70" name="addr"
								value="" style="float: left;"><br> <br>
							<%
								}
							%>


							<!-- <input type="text" size="75" name="addr" value="서울특별시 강남구 역삼동 823-25 KH정보교육원 강남지원1관" readonly="readonly" disabled="disabled" style="float: left;"> -->
							<!-- <div class="pay_h_txt">
                                <label></label>
                            </div> -->

							<!-- <input type="text" size="75" name="addr_detail" placeholder="(필수) 상세주소 입력" required="required"> -->
							<%
								if (m != null) {
							%>
							<div class="pay_h_txt">
								<label>핸드폰</label>
							</div>
							<input type="text" size="70" required="required" name="phone"
								value="<%=m.getUSER_PHONE()%>">
							<!-- 핸드폰 번호만 입력되도록, 안심번호 클릭 -->
						</div>
						<br>
						<%
							} else {
						%>
						<div class="pay_h_txt">
							<label>핸드폰</label>
						</div>
						<input type="text" size="70" required="required" name="phone"
							value="">
						<!-- 핸드폰 번호만 입력되도록, 안심번호 클릭 -->
					</div>
					<br>
					<%
						}
					%>
					<h4 class="pay_header">주문시 요청사항</h4>
					<div class="order_request">
						<textarea name="textrequest" id="oInfo" rows="4" cols="75"
							placeholder="주문시 요청 사항이 있으시면 남겨주세요." value=""></textarea>
						<!-- textarea 글자수 카운팅 -->

					</div>

					<br>
					<h4 class="pay_header">결제수단 선택</h4>
					<div class="pay_select_list_wrapper">
						<br>
						<!-- <label>현장결제 음식받고 직접 결제</label> -->
						<ul class="p_select_list">
							<div class="mb-4" id="accordion" role="tablist"
								aria-multiselectable="true">
								<div class="card_box">
									<div class="card-header" id="kakao" onclick="choosePay(this);"
										style="cursor: pointer; border-radius: 34px;">
										<h5 class="mb-0">
											<img src="resources/images/kakaopay.png" alt="account"
												style="width: 40px; height: 40px;"> <a
												style="color: #a6a6a6; text-decoration: none"
												onmouseover="this.style.color='#000000'"
												onmouseout="this.style.color='#a6a6a6'">&nbsp;카카오페이 </a>
										</h5>
									</div>


									<%-- <%@ include file="views/kakaopay.jsp"%> --%>

									<!-- <div id="collapseOne" class="collapse" role="tabpanel"
                              aria-labelledby="headingOne" style="height: 210px;">
                              <div class="card-body">
                                 
                              <br>
                           </div>
                        </div> -->

									<br>
									<div class="mb-4" id="accordion">
										<div class="card-header" id="cash" onclick="choosePay(this);"
											style="cursor: pointer; border-radius: 34px;">
											<h5 class="mb-0">
												<img src="resources/images/won.png" alt="account"
													style="width: 40px; height: 40px;"> <a
													style="color: #a6a6a6; text-decoration: none"
													onmouseover="this.style.color='#000000'"
													onmouseout="this.style.color='#a6a6a6'">&nbsp;현금</a>
											</h5>
										</div>
									</div>
								</div>
						</ul>
					</div>
					<br>
					<!-- /. paytype_content -->
			</div>
		</div>


		<input type="hidden" id="pay1" name="pay" value="">
		<!-- Sidebar Widgets Column -->
		<div class="col-md-4" style="height: 300px;">
			<!-- Search Widget -->
			<div class="card mb-4">
				<h5 class="card-header">주문내역</h5>



				<div class="card-body" style="height: 250px;">
					<div class="input-group">


						<label><%=soList.get(0).getShopName()%></label><br>
					</div>
					<%
						for (int i = 0; i < soList.size(); i++) {
					%>
					<div class="input-group2">
						<label><%=soList.get(i).getMenuName()%> x <%=soList.get(i).getOrderCount()%>개
							<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
							<%=soList.get(i).getOrderSum()%></label><br>
						<%
							}
						%>

						<label>배달료 <!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
							<%=soList.get(0).getDvPrice()%></label><br> <br>

					</div>

				</div>

				<%
					int sum = 0;
					for (int i = 0; i < soList.size(); i++) {
						sum += soList.get(i).getOrderSum();
					}
					sum += soList.get(0).getDvPrice();
				%>
				<div class="input-group3">
					<label>총 결제금액
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<%=sum%>원
					</label>
				</div>

			</div>

			<br>
			<div class="order-button">


				<!-- <button class="btn btn-secondary" type="button"
                  onclick="location.href='oInsert.go'" style="width: 350px;">주문하기</button> -->


				<button class="btn btn-secondary" type="submit" id="next"
					style="width: 350px;">주문하기</button>
				<!-- onclick="location.href='views/kakaopay.jsp'" style="width: 350px; margin-left: -20px">주문하기</button> -->
				<!--                   onclick="location.href='oInsert.go'" style="width: 350px;">주문하기</button> -->
			</div>
		</div>
	</div>
	</div>
	</form>
	<!-- /.container -->

	<script>
		function choosePay(obj) {

			console.log(obj);

			var pay = "";
			var p = $(obj).attr('id');
			console.log(p);
			if (p == "kakao") {
				console.log("kakao다");
				$("#pay1").attr('value', 'kakao');
				pay = "kakao";
				$("form").attr('action', 'kServlet.go');
			} else {
				console.log("else로 온당");
				$("#pay1").attr('value', 'cash');
				pay = "cash";
				$("form").attr('action', 'oUpdate.go');
			}

			console.log(pay);
		}

		$('#radioChk').click(function() {

			$('#radioChk').add(this).mousedown(function() {
				$(this).data('Checked', this.checked);

				var el = document.getElementsByClassName('input-erase');
				/* for(var i=0; i<el.length; i++){
				   el[i].value = '';
				}  */
				el[0].value = "";
			});

			$('#radioChk').add(this).click(function() {
				if ($(this).data('Checked'))
					this.checked = false;
			});
		});

		$(function() {
			$("#oInfo").attr('value', $("#oInfo").innerText);
		})
	</script>




	<%@ include file="views/common/footer.jsp"%>

</body>

</html>