<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	<!-- jstl 숫자,금액,날짜 format -->
<!DOCTYPE html>
<html lang="en">

<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>원두 | COFFEESAZO</title>
	    <!-- 부트스트랩 불러오기 -->
	    <link rel=“stylesheet” href=“view/css/bootstrap.min.css” type=“text/css”>
	    <!--favicon-->
	    <link rel="shortcut icon" href="https://p7.hiclipart.com/preview/988/211/651/white-coffee-tea-cafe-computer-icons-cup-of-coffee-icon.jpg">
	    <link rel="stylesheet" href="view/css/whole_bean.css" type="text/css">
	   
</head>

<body>
  

  								<!-- 상품 페이지 메인 -->

	<main>
	     
	     
	     <p><h1 class="sub_title">원두</h1></p>
	                                 
							 <!-- 풍부한산미 상품리스트 -->
						   
		    <div class="bean_product_list"> 
		      <div class="inner_space">
	             <h3 class="tag_title">#풍부한산미</h3>
	             <div class="sub_under_dec"></div>
	             <div class="row_space">	  <!-- 위치고정 큰틀 -->
             
			 <a name="tag_body"></a>  <!--  메인 '#묵직한바디감'연결 -->

            
	   			<c:forEach items="${beanList}" var="product" begin="0" end="2" >
	                <div class="col_space"> 
	                   <div class="item_list">
	                       <a href="CoffeeDetail?List=${product.productName}"> <!--  상세페이지 연결  -->
	                           <img src="view/img/${product.productImage}" alt="">
	                           <div class="bean_name">'${product.productName}'</div> 
	                           <p><div class="product_price"><fmt:formatNumber 
	                          		   value="${product.productPrice}" 
	                          		   pattern="###,###,###원"/></div></p>
	                       </a>
	                   </div>
	               	 </div>
	            </c:forEach>
	            
         
              </div>
      		</div>
  		  </div>
  			
  			
  						 	<!-- 묵직한바디감 상품리스트 -->
	
	    <div class="bean_product_list">  
	    
	        <a name="tag_latin"></a> <!--  메인 '#중남미원두'연결 --> 
	        
	      	  <div class="inner_space">
	            <h3 class="tag_title">#묵직한바디감</h3>
	            <div class="sub_under_dec"></div>
	            <div class="row_space">
	            
	   			  <c:forEach items="${beanList}" var="product" begin="3" end="5" >
	                <div class="col_space"> 
	                   <div class="item_list">
	                       <a href="CoffeeDetail?List=${product.productName}">
	                           <img src="view/img/${product.productImage}" alt="">
	                           <div class="bean_name"> '${product.productName}'</div> 
	                           <p><div class="product_price"><fmt:formatNumber 
	                          		   value="${product.productPrice}" 
	                          		   pattern="###,###,###원"/></div></p>
	                       </a>
	                   </div>
	                </div>
	              </c:forEach>
	
	           </div>
	     	   </div>
	  		</div>
	   
	  						 <!-- 중남미원두 상품리스트 -->
	 					 	
	   
	    <div class="bean_product_list"> 
	        
	       	 <div class="inner_space">
	            <h3 class="tag_title">#중남미원두</h3>
	            <div class="sub_under_dec"></div>
	            <div class="row_space">
	            
	   			 <c:forEach items="${beanList}" var="product" begin="6" end="8" >
	                <div class="col_space"> 
	                   <div class="item_list">
	                       <a href="CoffeeDetail?List=${product.productName}">
	                           <img src="view/img/${product.productImage}" alt="">
	                           <div class="bean_name"> '${product.productName}'</div> 
	                           <p><div class="product_price"><fmt:formatNumber 
	                          		   value="${product.productPrice}" 
	                          		   pattern="###,###,###원"/></div></p>
	                       </a>
	                   </div>
	                </div>
	               </c:forEach>
		                
		        </div>
		      	</div>
		  	 </div>
		   
		   	 					<!-- 아프리카원두 상품리스트 -->  
		   
	    <div class="bean_product_list"> 
	    
	       <a name="tag_africa"></a>  <!--  메인 '#아프리카원두'연결 --> 
	  								     
	       
	     	   <div class="inner_space">
	            <h3 class="tag_title">#아프리카원두</h3>
	            <div class="sub_under_dec"></div>
	            <div class="row_space">
	            
	   			 <c:forEach items="${beanList}" var="product" begin="9" end="11" >
	                <div class="col_space"> 
	                   <div class="item_list">
	                       <a href="CoffeeDetail?List=${product.productName}">
	                           <img src="view/img/${product.productImage}" alt="">
	                           <div class="bean_name"> '${product.productName}'</div> 
	                           <p><div class="product_price"><fmt:formatNumber 
	                          		   value="${product.productPrice}" 
	                          		   pattern="###,###,###원"/></div></p>
	                       </a>
	                   </div>
	                 </div>
	               </c:forEach>
	                
	           </div>
	      	   </div>
	  	   </div>

	</main>
   <!-- 부트스트랩 자바스크립트 추가 -->
   <script src="./js/bootstrap.min.js"></script>
</body>

</html>