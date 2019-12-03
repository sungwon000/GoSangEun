<%@page import="java.util.ArrayList"%>
<%@page import="model.vo.ShopOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ShopOrder> soList = (ArrayList<ShopOrder>)session.getAttribute("soList");

%>   
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>주문완료</title>


    <!-- Custom styles for this template -->
    <link href="resources/css/payment.css" rel="stylesheet"><!-- 지우지 마세요!! -->

</head>

<body>

    <%@ include file = "views/common/header.jsp" %>

    <!-- Page Content -->
    <div class="container">
        <br><br><br><br>
        <!-- Page Heading/Breadcrumbs -->
        <h1 class="mt-4 mb-3">주문완료</h1>

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="index_login.html">Home</a>
            </li>
            <li class="breadcrumb-item active">주문완료</li>
        </ol>
        <br>

        <!-- <p>고객님의 주문이 정상적으로 완료되었습니다.</p> -->
        <p><br><h2 style="text-align: center;">고객님의 주문이 정상적으로 완료되었습니다.</h2><br></p>
       

        <div class="card mb-4">
            <div class="card-body" style = "margin-left : 30%;">
                <h4 class="card-title">
                    <!-- <img src="SYMBOL.PNG" alt="SYMBOL" style="width: 15px; height: 15px;">주문 번호 : 9087564321345645 </h4> -->
                    	<!-- 주문 번호 : 9087564321345645 </h4><br> -->
						주문 번호 : <%= soList.get(0).getOrderId() %> </h4><br>

                <!-- <p class="card-text">Lorem </p> -->

                <div class="receipt_order_info">
                    <table class="receipt_table">
                        <!-- <tr class="receipt_title"> -->
                        <tr class="receipt_bold_1">
                            <!-- <td class="item"><h3>Item</h3></td>
                    <td class="item"><h3>Qty</h3></td>
                    <td class="item"><h3>Sub Total</h3></td> -->
                            <td class="item">상품명</td>
                            <td class="item">수량</td>
                            <td class="item">금액</td>
                        </tr>
                        
                        <% 
                        	for(int i=0; i<soList.size(); i++){
                        %>
                        <tr class="line">
                            <td class="txt_align_left2">
                                <p class="itemtext"><%= soList.get(i).getMenuName() %></p>
                            </td>
                            <td class="txt_qty">
                                <p class="itemtext"><%= soList.get(i).getOrderCount() %></p>
                            </td>
                            <td class="txt_total">
                                <p class="itemtext"><%= soList.get(i).getOrderSum() %></p>
                            </td>
                        </tr>
                        
                        <% } %>

                        <tr class="line">
	                      <%-- <input type="hidden" name="orderId" value="<%= sod.getOrderId() %>">
	                      <input type="hidden" name="shopId" value="<%= sod.getShopId() %>">
	                      <input type="hidden" name="userId" value="<%= sod.getUserId() %>"> --%>
                            <%-- <td class="txt_align_left2">
                                <p class="itemtext"><%= soList.getMenuName() %></p>
                                <!-- <p class="itemtext">킹프론 씨푸드M</p> -->
                            </td>
                            <td class="txt_qty">
                                <p class="itemtext"><%= soList.getOrderCount() %></p>
                                <!-- <p class="itemtext">1</p> -->
                            </td>
                            <td class="txt_total">
                                <p class="itemtext"><%= soList.getOrderSum() %></p>
                                <!-- <p class="itemtext">27,500</p> -->
                            </td>
                        </tr> --%>

                        <tr class="receipt_bold_2">
                            <td class="item_red"></td>
                            <td class="item_red">합계</td>
                            <!-- <td class="item_red">29,000</td> -->
                            <td class="item_red"><%=  %></td> 
                        </tr>

                        <tr>
                            <td colspan="3">
                                <p class="receipt_info_txt_h">** 신용승인정보[고객용] **</p>
                            </td>
                            <!-- <td><span>** 신용승인정보[고객용] **</span></td> -->
                            <!-- <td><label align="right">** 신용승인정보[고객용] **</label></td> -->
                        </tr>
                        <tr>
                            <td>
                                <p class="receipt_info_txt">[삼성카드사] </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p class="receipt_info_txt">카드 번호</p>
                            </td>
                            <td colspan="2">9012********14832</td>
                        </tr>
                        <tr>
                            <td>
                                <p class="receipt_info_txt">청구액</p>
                            </td>
                            <td>29,000원</td>
                        </tr>
                        <tr>
                            <td>
                                <p class="receipt_info_txt">승인번호</p>
                            </td>
                            <td>7625136687</td>
                        </tr>
                        <tr class="line">
                            <!-- <td></td> -->
                        </tr>

                        <!-- colspan=2 -->
                    </table>
                    <!-- /.table -->
                </div>

            </div>
        </div>

        <a href="index_login.html" class="btn btn-primary" style="align-content: center;margin-left : 40%;">메인으로 </a>
        <p></p>
    </div>
    <!-- /.container -->
   
    <%@ include file = "views/common/footer.jsp" %>

</body>
</html>