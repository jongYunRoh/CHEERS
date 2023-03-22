<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header2.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertForm.jsp</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/user.css">
		<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<script type="text/javascript" src="../resources/js/script.js"></script>
		
		<script>
		   function openDaumPostcode(){
		      new daum.Postcode({
		         oncomplete:function(data){
		            document.getElementById('u_zipcode').value=data.zonecode;
		            document.getElementById('u_addr').value=data.address;
		          }
		      }).open();
		   }//openDaumPostcode()---
		   </script>
		<style type="text/css">
		h2 {
			text-align: center;
		}
		
		table {
			margin: auto;
			line-height: 30px;
			padding: 3px;
			background-color: ivory;
			border: 1px solid black;
		}
		.container {
			max-width: 800px;
			width: 100%;
		}
		
		</style>
		
		<script type="text/javascript">
			function deleteMember(){
				document.delForm.action="${ctxpath}/user/delete.do";
				document.delForm.submit();
			}
		</script>
	</head>
	
	<body>
		<div class="container register">
			<h2 class="mb-3 register_title">개인 정보 수정</h2>	
		
			<form method="post" action="${ctxpath}/user/modify" onsubmit="return memberCheck()">
				<div class="row col-md-12 mb-3">
					<label for="u_id" class="mb-2 col-md-2">아이디</label> 
					<input type="text" name="u_id" id="u_id" value="${user.u_id }" class="form-control col-md-10">
				</div>
				<div class="row mb-3 col-md-12">
					<label for="u_name" class="mb-2 col-md-2">이름</label> 
					<input type="text"
						class="form-control col-md-10" name="u_name" id="u_name"
						value="${user.u_name }">
				</div>
				
				<div class="row mb-3 col-md-12">
					<label class="col-md-2">이메일</label>
				
					<div class="row col-md-10">
						<input type="text" class="col-md-6 form-control" id="u_email"
							name="u_email" value="${user.u_email }">
					</div>
				</div>
				<div class="row col-md-12 mb-3">
					<label for="u_name" class="mb-2 col-md-2">전화번호</label>
					<div class="row align-items-center justify-content-between col-md-10">
						<input type="text" name="u_tel" value="${user.u_tel }" class="form-control col-md-3" />
					</div>
				</div>
				
				<div class="row col-md-12">
					<label for="u_zipcode" class="mb-2 col-md-2">우편번호</label> <input
						type="text" name="u_zipcode" id="u_zipcode" value="${user.u_zipcode}"
						class="form-control col-md-9" size="7" readonly="readonly">
				</div>

				<div class="row mb-3 mt-4 col-md-12">
					<div class="col-md-8">
						<input type="text" name="u_addr" id="u_addr" value="${user.u_addr}"
						class="form-control" size="7" readonly="readonly">
					</div>
					<div class="col-md-4">
						<input type="button" value="주소검색" class="btn register_btn"
						onClick="openDaumPostcode()">
					</div>
				</div>

				<div class="row mb-3 col-md-12">
					<label for="u_addr2" class="mb-2 col-md-2">상세주소</label>
					<div
						class="row align-items-center justify-content-between col-md-10">
						<input type="text" class="form-control" name="u_addr2" value="${user.u_addr2}"
							id="u_addr2">
					</div>
				</div>
				
				<div class="modify btn_wrap">
					<button id="modifyBtn" class="btn" type="submit">내정보수정</button>
					<button id="deleteBtn" class="btn" type="button" onClick="javascript:deletMember()">탈퇴</button>
					<button id="mainBtn" type="button" class="btn" onClick="location='${ctxpath }/member/main.do'">메인</button>
				</div>
					
			</form>
		</div>
	</body>
	
</html>