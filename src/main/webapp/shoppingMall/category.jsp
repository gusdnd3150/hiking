<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    import ="java.util.*,project.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />   
<jsp:include page="/common/header.jsp" />
  
    <!-- Bootstrap core CSS -->
  <link href="/resources/shop/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/resources/shop/css/shop-homepage.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript -->
  <script src="/resources/shop/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/shop/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
<style>

.card-img-top{
width=800;
height=350;
}

/* Add a black background color to the top navigation */
.topnav {
  background-color: #333;
  overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

</style>  

<body>
<script src="https://kit.fontawesome.com/e8913b960a.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

  $(document).ready(function(){
	  
       $('#getSession').on("click",function(){
    	   /* var quantity = $("#sst").val(); */
           $.ajax({
                type:"post",
                async:true,
                url:"/B_P003_D001/getSession",
                success:function(data,textStatus){
                  alert(data.userNum);
                  location.href="/B_P003_D001/cartList"; 
  
                },
                error:function(data,textStatus){
                }
              });
       }); 
  });

</script>

<div  class="topnav container" align="center">
  <a class="active" href="/B_P002_D001/shopMainCate?listType=10">Home</a> <!--  10은 전체목록 -->
  <a href="/B_P002_D001/shopMainCate?listType=2">등산 가방</a>  
  <a href="/B_P002_D001/shopMainCate?listType=3">아웃도어</a>
  <a href="/B_P002_D001/shopMainCate?listType=4">등산스틱</a>
  <a href="/B_P002_D001/shopMainCate?listType=5">등산화</a>
  <a href="/B_P002_D001/shopMainCate?listType=6">등산장갑</a>
  <a href="/B_P002_D001/shopMainCate?listType=1">양말</a>
  <a href="/B_P002_D001/shopMainCate?listType=7">보호대</a>
  <a href="/E_P003_D001/addUsedForm">중고물품 등록</a>
  <a class="fas fa-shopping-cart" id="getSession"></a>
</div>


  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- /.col-lg-5 -->
      <div class="col-lg-9">
                <br>
                <div id ="search" align="center">
                 <form action ="/B_P002_D001/searchResult" method="post">
                 <table style="text-align:center">
                <tr>
                 <td><select id="searchtype" name="searchtype">
                   <option value="name">제목</option>    
                   <option value="content">내용</option>
                   </select>
                   </td>
                <td><input type="search" name= "searchContent" placeholder="검색어를 입력해 주세요" ></td>
                <td><input type="submit" value="검색"> </td>
                <tr>
               </table>
               </form>
               </div>

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div id ="selector"class="carousel-item active">
              <img class="d-block img-fluid" src="/resources/img/main3.png" alt="First slide" >
            </div>
            <div id ="selector" class="carousel-item">
              <img class="d-block img-fluid" src="/resources/img/main4.png" alt="Second slide" >
            </div>
            <div id ="selector" class="carousel-item">
              <img class="d-block img-fluid" src="/resources/img/main3.png" alt="Third slide">
              <!-- <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide"> -->
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

         <div class="row">
        <c:choose>
              <c:when test="${empty viewAll}">
                 <h>등록된 상품이 없습니다</h>
              </c:when>
              <c:when test="${not empty viewAll}">
                    <c:forEach var="data" items="${viewAll }" >
                    <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
                <%-- <a href="#"><img class="card-img-top" src="data:image/jpg;base64, ${encodinglist}"  alt="" width="800" height="500"></a> --%>
                 <a href="/B_P003_D001/productDetail?prodNum=${data.PRODNUM}"><img class="card-img-top" src="/resources/img/${data.IMAGE }"  alt="" width="300" height="300"></a>
              <div class="card-body">                            
                <h4 class="card-title"> 
                  <a href="/B_P003_D001/productDetail?prodNum=${data.PRODNUM}">${data.NAME }</a>
                  <c:if test="${data.TYPE ==1 }"><p style="color:blue">[Used]</p></c:if>
                  <c:if test="${data.TYPE ==2 }"><p style="color:red">[New]</p></c:if>
                </h4>
                <h5>${data.PRICE }원  </h5>
                <p class="card-text">${data.CONTENT }</p>
              </div>
              <div class="card-footer">
           
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
                    </c:forEach>
             </c:when>
          </c:choose>

        </div>
        <!-- /.row -->

        
<!-- 페이징 자리 -->
	<div style="display: block; text-align: center;">
	<c:if test="${paging.startPage != 1 }">
			<a href="/B_P002_D001/shopMainCate?listType=${paging.listType}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/B_P002_D001/shopMainCate?listType=${paging.listType}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/B_P002_D001/shopMainCate?listType=${paging.listType}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			<p> ${paging.listType}</p>
		</c:if>
	</div>
      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

    
</body>
<jsp:include page="/common/footer.jsp" />
</html>
