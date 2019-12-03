<%@page import="model.vo.Shop"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
   String category = (String)request.getParameter("category");
   System.out.println(category);
   ArrayList<Shop> sList = (ArrayList<Shop>)request.getAttribute("shopList");
   System.out.println("jsp : " + sList);
   
%>
<!DOCTYPE html>
<html lang="en">
<!-- 수진쓰 페이지 -->

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>식당 리스트</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="../resources/js/jquery-3.4.1.min.js"></script>

</head>

<body onload="defaultCheck();">

	<%@ include file="views/common/header.jsp"%>

	<!-- Page Content -->
	<div class="container">
		<br> <br>
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">식당 리스트</h1>
		<ol class="breadcrumb">
			<li id="choice" style="margin-left: 50%; font-size: 25px;">한&nbsp;식</li>
		</ol>
		<!-- /.Page Heading/Breadcrumbs -->

		<div style="display: flex;">
			<div class="col-lg-2" style="text-align: center;">
				<a href="category.go?category=한식" class="list-group-item" >한식</a>
				<a href="category.go?category=중식" class="list-group-item" >중식</a>
				<a href="category.go?category=족발" class="list-group-item" >족발</a>
				<a href="category.go?category=치킨" class="list-group-item" >치킨</a>
				<a href="category.go?category=피자" class="list-group-item" >피자</a>
				<a href="category.go?category=즐찾" class="list-group-item" >즐겨찾기</a>
			</div>

			<div class="row view"
				style="width: 780px;; height: 600px; overflow: hidden; border-color: white;">
				<div class="row pre-scrollable myScroll"
					id = "myScroll" style="width: 830px;; max-height: 600px; border-color: white; margin-right: -30px;">




					<%-- <script>
                        $(function() {
                            var input = "";
                            <% 
                               System.out.println(sList.size());
                               for (int i = 0; i < sList.size(); i++) { 
                                  %>
                                  
                               <%
                               if(sList.get(i).getShopId() >= 100) {
                               %>
                                   input = '<div class="col-lg-11" style="border-radius: 5px; border: 0.5px solid gainsboro ; margin-left : 5%; margin-bottom: 23px;">' +
                                       '<div style="display: flex;">' +
                                       '<div style="margin-top: 25px; margin-left: 25px;">' +
                                       '<a href="#"><img class="img-fluid rounded" src="http://placehold.it/750x300" alt="" style="width : 150px; height : 150px;"></a>' +
                                       '</div>' +
                                       '<div style="margin-left: 30px;margin-top: 18px; width : 550px ; height : 100px;">' +
                                       '<h2 class="card-title shopName">' + "<%= sList.get(i).getShopName() %>" +
                                       '</h2>' +
                                       '<br>' +
                                       '<p class="card-text shopText">' + "<%= sList.get(i).getShopInfo() %> " +'</p>' +
                                       '<p class="card-text shopInfo">평점  : ' +"<%= sList.get(i).getPoint() %>" + '  최소 배달 금액  : ' + <%=sList.get(i).getMinPrice() %> +'원  소요시간: ' + "<%= sList.get(i).getDvTime() %>"+ '분' +'</p>' +
                                       '</div>' +
                                       '</div>' +
                                       '<div style="margin-top: 25px; margin-left: 3% ; float:right; margin-right : 20px; margin-bottom: 20px; ">' +
                                       '<a href="Menu.s?shopId=' + <%= sList.get(i).getShopId()%> + '" class="btn btn-primary more" ">&nbsp;&nbsp;&nbsp; More &rarr;&nbsp;&nbsp;</a>' +
                                       '</div>' +
                                       '</div>' ;
                                   $(".myScroll").append(input);
                               <% } 
                               else { %>
                                  input = '<div class="col-lg-11" style="border-radius: 5px; border: 0.5px solid gainsboro ; margin-left : 5%; margin-bottom: 23px;">' +
                                    '<div style="display: flex;">' +
                                    '<div style="margin-top: 25px; margin-left: 25px;">' +
                                    '<a href="#"><img class="img-fluid rounded shopImg"  src=' + "<%= sList.get(i).getShopLogo()%>" + ' style="width : 150px; height : 150px;"></a>' +
                                    '</div>' +
                                    '<div style="margin-left: 30px;margin-top: 18px; width : 550px ; height : 100px;">' +
                                    '<h2 class="card-title shopName">' + "<%= sList.get(i).getShopName() %>" +
                                    '</h2>' +
                                    '<br>' +
                                    '<p class="card-text shopText">' + "<%= sList.get(i).getShopInfo() %> " +'</p>' +
                                    '<p class="card-text shopInfo">평점  : ' +"<%= sList.get(i).getPoint() %>" + '  최소 배달 금액  : ' + <%=sList.get(i).getMinPrice() %> +'원  소요시간: ' + "<%= sList.get(i).getDvTime() %>"+ '분' +'</p>' +
                                    '</div>' +
                                    '</div>' +
                                    '<div style="margin-top: 25px; margin-left: 3% ; float:right; margin-right : 20px; margin-bottom: 20px; ">' +
                                    '<a href="Menu.s?shopId=' + <%= sList.get(i).getShopId()%> + '" class="btn btn-primary more" ">&nbsp;&nbsp;&nbsp; More &rarr;&nbsp;&nbsp;</a>' +
                                    '</div>' +
                                    '</div>' ;
                                     console.log("<%= sList.get(i).getShopLogo()%>");
                                     $(".myScroll").append(input); 
                        <% } %>
                            <% } %>
                        });
                    </script>
 --%>




				</div>
			</div>

			<div class="col-lg-2">

				<div
					style="border-radius: 5px; border: 0.5px solid gainsboro; margin-left: 9%;">
					<h6 class="card-header" style="text-align: center">정렬 기준</h6>
					<ul class="list-unstyled mb-0" style="text-align: center;">
						<li style="margin-top: 20px;"><a href="sort.go?sort=point&category=<%=category %>">별점</a></li>
						<br>
						<li><a href="sort.go?sort=min&category=<%=category %>" >최소 배달 금액</a></li>
						<br>
						<li style="margin-bottom: 20px;"><a href="sort.go?sort=time&category=<%=category %>" >배달 시간</a></li>
					</ul>
				</div>
			</div>

			<script>
			
				var sortCate = "";
				var idIndex = 0;
                function defaultCheck() {
                   
                   var index = -1;
                   
                
                    var others = document.getElementsByClassName("list-group-item");
                   <% switch(category){
                       
                      case "한식" : %> index = 0;
                      				  sortCate = "KO" ; <%
                                break;
                       case "중식" : %> index = 1;
                       				  sortCate = "CH" ;<%
                                break;
                       case "족발" : %> index = 2; 
                       				  sortCate = "ZOK" ;<%
                                break;
                       case "치킨" : %> index = 3; 
                       				  sortCate = "CK" ;<%
                                break;
                       case "피자" : %> index = 4; 
                       				  sortCate = "PZ" ;<%
                                break;
                       case "즐찾" : %> index = 5;
                       				  sortCate = "MY" ;<%
                                break;                       
                    
                       }
                    
                    %>
                    others[index].style.background = "crimson";
                    others[index].style.color = "snow";
                    var cate = others[index].innerText.split("");
                   console.log(others[index].innerText);
                   var choice = document.getElementById("choice");
                    var change = "";
                    
                    for (var i = 0; i < cate.length; i++) {
                        if (others[index].innerText == "즐겨찾기") {
                            choice.style.marginLeft = "42%";
                        } else {
                            choice.style.marginLeft = "50%";
                        }
                        change += cate[i] + "&nbsp;&nbsp;&nbsp;&nbsp;";
                    }
                    choice.innerHTML = change;
                    
                    var input = "";
                    var src = "";
                    var empty = "resources/images/shop/empty_star.png";
                    var full = "resources/images/shop/full_star.png";
                    <% 
                    	ArrayList myList = new ArrayList();
                    	String[] myArr = null;
                       if(m != null){
                    	System.out.println("일단은 들어옴" + m.getMyShop());
                    	if(m.getMyShop() != null){
	                         myArr = m.getMyShop().split(",");
	                    	
		                    for(int i = 0 ; i < myArr.length ; i++) {
		        				if(!myArr[i].equals("")) {
		        					myList.add(Integer.parseInt(myArr[i]));
		        				}
		        			}
		        					
		        		   System.out.println("jsp myList : " + myList);
                    	}
                       }
                       System.out.println(sList.size());
                       
                       for (int i = 0; i < sList.size(); i++) { 
                          %>
                          
                       <%
                       if(myList.contains(sList.get(i).getShopId())){
                    	   System.out.println(sList.get(i).getShopId() + "는 즐겨찾기가 맞습니다");
                       %>	   src =  full; <% 
                       }
                       else{
                    	   System.out.println(sList.get(i).getShopId() + "는 즐겨찾기가 아니에요");
                       %> 	   src = empty; <%
                       }
                       if(sList.get(i).getShopId() >= 100) {
                    	   
                       %>
                            input = '<div class="col-lg-11" style="border-radius: 5px; border: 0.5px solid gainsboro ; margin-left : 5%; margin-bottom: 23px;">' +
                                '<div style="display: flex;">' +
                                '<div style="margin-top: 25px; margin-left: 25px;">' +
                                '<a href="#"><img class="img-fluid rounded" src="resources/images/dummy.png" alt="" style="width : 150px; height : 150px;"></a>' +
                                '</div>' +
                                '<div style="margin-left: 30px;margin-top: 18px; width : 550px ; height : 100px; ">' +
                                '<h2 class="card-title shopName" >' + "<%= sList.get(i).getShopName() %>" + '&nbsp;&nbsp;'+
                                 
                                '<a href="#" onclick = "insertMyshop(this);">' +  
                                '<img src="' + src +'" style="width: 30px; height: 30px; border-radius: 8px;"> ' +
                                '<input type="hidden" class = "shopI" id="shopId'+ <%= (i+1)%> +'" value="'+ <%= sList.get(i).getShopId()%>  +'">'+
            					'</a> ' +
            					'</h2>' +
                                '<br>' +
                                '<p class="card-text shopText">' + "<%= sList.get(i).getShopInfo() %> " +'</p>' +
                                '<p class="card-text shopInfo">평점  : ' +"<%= sList.get(i).getPoint() %>" + '  최소 배달 금액  : ' + <%=sList.get(i).getMinPrice() %> +'원  소요시간: ' + "<%= sList.get(i).getDvTime() %>"+ '분' +'</p>' +
                                '</div>' +
                                '</div>' +
                                
                                '<div style="margin-top: 25px; margin-left: 3% ; float:right; margin-right : 20px; margin-bottom: 20px; ">' +
                                '<a href="Menu.s?shopId=' + <%= sList.get(i).getShopId()%> + '" class="btn btn-primary more" ">&nbsp;&nbsp;&nbsp; More &rarr;&nbsp;&nbsp;</a>' +
                                
                                '</div>' +
                                
                                '</div>' ;
                            $(".myScroll").append(input);
                       <% } 
                       else { %>
                           input = '<div class="col-lg-11" style="border-radius: 5px; border: 0.5px solid gainsboro ; margin-left : 5%; margin-bottom: 23px;">' +
                            '<div style="display: flex;">' +
                            '<div style="margin-top: 25px; margin-left: 25px;">' +
                            '<a href="#"><img class="img-fluid rounded shopImg"  src=' + "<%= sList.get(i).getShopLogo()%>" + ' style="width : 150px; height : 150px;"></a>' +
                            '</div>' +
                            '<div style="margin-left: 30px;margin-top: 18px; width : 550px ; height : 100px;">' +
                            '<h2 class="card-title shopName" >' + "<%= sList.get(i).getShopName() %>" + '&nbsp;&nbsp;'+
                            '<a href="#" onclick = "insertMyshop(this);">' +    
                            '<img src="' + src +'" style="width: 30px; height: 30px; border-radius: 8px;"> ' +
                            '<input type="hidden"  class = "shopI" id="shopId' + <%= (i+1)%> + '" value="'+<%= sList.get(i).getShopId()%> +'">'+
        					'</a> ' +
                            '</h2>' +
                            '<br>' +
                            '<p class="card-text shopText">' + "<%= sList.get(i).getShopInfo() %> " +'</p>' +
                            '<p class="card-text shopInfo">평점  : ' +"<%= sList.get(i).getPoint() %>" + '  최소 배달 금액  : ' + <%=sList.get(i).getMinPrice() %> +'원  소요시간: ' + "<%= sList.get(i).getDvTime() %>"+ '분' +'</p>' +
                            '</div>' +
                            '</div>' +
                            '<div style="margin-top: 25px; margin-left: 3% ; float:right; margin-right : 20px; margin-bottom: 20px; ">' +
                            '<a href="Menu.s?shopId=' + <%= sList.get(i).getShopId()%> + '" class="btn btn-primary more" ">&nbsp;&nbsp;&nbsp; More &rarr;&nbsp;&nbsp;</a>' +
                            '</div>' +
                            '</div>' ;
                             console.log("<%=sList.get(i).getShopLogo()%>");
                              $(".myScroll").append(input); 
                  <%}%>
                    <%}%>
                    
                    
                    
                }

                
                function insertMyshop(obj){
                	console.log(obj);
                	console.log("lastchild : " + $(obj).children().last().attr('value'));
                	console.log("건너뛰나?");
                
                	$.ajax({
                 	   url : "/GoSangEun/myInsert.go" ,
                 	   type : "get" ,
                 	   data : {
                 		 	shopId : $(obj).children().last().attr('value')
                 	   } ,
                 	   dataType : "TEXT",
                 	   success : function(data){
                 		   console.log(data);
                 		  window.location.reload();
                 		   
                 	   } , 
                 	   error : function(error ,errorcode){
                 		   console.log("통신실패!!");
                 		   console.log(error);
                 		  console.log(error , errorcode);
                 	   }
                 	   
                	});
                	
                	
                }

            </script>


		</div>
		<br>

	</div>

	<%@ include file="views/common/footer.jsp"%>

</body>

</html>