<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../resources/css/eat.css">
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
   function openDaumPostcode(){
      new daum.Postcode({
         oncomplete:function(data){
            document.getElementById('s_zipcode').value=data.zonecode;
            document.getElementById('s_addr').value=data.address;
          }
      }).open();
   }//openDaumPostcode()---
   </script>
</head>
<body>

  <div class="container register">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-6 mx-auto">
            
        <h2 class="mb-3 register_title">가게 등록하기</h2>
              
        <form name="registerForm" action="registerPro" method="post" encType="multipart/form-data">
         
          <div class="row mb-2">
            <label for="s_name">가게명</label>
          </div>
          <div class="row mb-3">
            <input type="text" name="s_name" id="s_name" class="form-control" autocomplete="off">
            <input type="hidden" name="u_id" id="u_id" value="${user.u_id}">
          </div>
          
          <div class="row">       
            <label for="s_zipcode" class="mb-2">우편번호</label>
          </div>
          <div class="row">
          	<div class="col-md-9">
          	  <input type="text" name="s_zipcode" id="s_zipcode" class="form-control" size="7" readonly="readonly">
          	</div>
            <div class="col-md-3">
              <input type="button" value="주소검색" class="btn ml-4" onClick="openDaumPostcode()">
            </div>
          </div>
          
          <div class="row mb-3 mt-4">
             <input type="text" name="s_addr" id="s_addr" class="form-control col-md-12" size="7" readonly="readonly"> 
           </div>
        
          <div class="row mb-2">
            <label for="s_addr_detail">상세주소</label>
          </div>
          <div class="row mb-3">
            <input type="text" class="form-control" name="s_addr_detail" id="s_addr_detail" placeholder="상세주소를 입력해주세요." autocomplete="off">
          </div>
          
          <div class="row mb-2">
            <label for="s_tel">전화번호</label>
          </div>
          <div class="row mb-3">
            <input type="text" name="s_tel" id="s_tel" class="form-control" autocomplete="off">
          </div>
          
          <div class="row mb-2">
            <label for="s_type">음식종류</label>
          </div>
          <div class="row mb-3">
            <input type="text" name="s_type" id="s_type" class="form-control" autocomplete="off">
          </div>
          
          <div class="row mb-2">
            <label for="s_price_ref">가격대</label>
          </div>
          <div class="row mb-3">
            <input type="text" name="s_price_ref" id="s_price_ref" class="form-control" autocomplete="off">
          </div>
          
          <div class="row mb-2">
            <label for="s_type">웹사이트</label>
          </div>
          <div class="row mb-3">
            <input type="text" name="s_site" id="s_site" class="form-control" autocomplete="off">
          </div>
          
          <div class="row mb-2">
            <label for="s_menu">메뉴</label>
          </div>
          <div class="row mb-3">
            <input type="text" name="s_menu" id="s_menu" class="form-control" autocomplete="off">
          </div>
          
          <div class="row mb-2">
            <label for="s_type">이미지</label>
          </div>
          <div class="row mb-3">
            <input type="file" name="s_img" id="s_img">
          </div>
          
          <div class="btn_wrap">
          	<input type="submit" value="가게등록" class="btn store_btn">
          </div>
          
        </form>
        
      </div>
    </div>
  </div>
    
    
</body>
</html>