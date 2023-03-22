<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../module/header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../resources/css/user.css">

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

<script type="text/javascript">
      //Ajax사용하여 아이디 중복여부 체크
        function idCheck(){
            //alert("aaa");
      
          if($('#u_id').val()==''){
             alert("ID를 입력하세요");
          }else{
             
            $.ajax({
               type:'POST',
               url:'${ctxpath}/user/idCheck',
               data:"u_id="+$('#u_id').val(),
               dataType:'JSON',
               success:function(data){
                   //alert(data);
                  alert(data.check);//*****
                  
                  if(data.check==-1){
                     alert("사용 중인 ID입니다.");
                     $('#u_id').val('').focus();
                     
                  }else if(data.check==1){//사용가능한
                     //$('#idcheck').val('1');//id중복 체크가 되었을때 
                     alert("사용 가능 한 ID입니다.");
                     $('#u_pw').focus();
                  }
               }//success
             });
             
          }//else end
       
     }//confirmIdCheck() end
     function chkPW(){

   	  var u_pw = $("#u_pw").val();
   	  var num = u_pw.search(/[0-9]/g);
   	  var eng = u_pw.search(/[a-z]/ig);
   	  var spe = u_pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

   	  if(u_pw.length < 8 || u_pw.length > 20){

   	   alert("8자리 ~ 20자리 이내로 입력해주세요.");
   	   return false;
   	  }else if(u_pw.search(/\s/) != -1){
   	   alert("비밀번호는 공백 없이 입력해주세요.");
   	   return false;
   	  }else if(num < 0 || eng < 0 || spe < 0 ){
   	   alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
   	   return false;
   	  }else {
   	 	console.log("통과"); 
   	     return true;
   	  }

   	 } 
     
     function selectAll(selectAll)  {
   	  const checkboxes 
   	       = document.getElementsByName('agree');
   	  
   	  checkboxes.forEach((checkbox) => {
   	    checkbox.checked = selectAll.checked;
   	  })
   	}
     
      </script>

</head>
<body>

	<div class="container register">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-6 mx-auto">

				<h2 class="mb-3 register_title">회원가입</h2>
				<form method="post" action="${ctxpath}/user/register" onsubmit="return memberCheck()">
					<div class="row mb-3">
	               		<div class="col-md-4">
	                  		<label for="u_type1">회원유형</label>
	               		</div>
						<div class="col-md-8">
							<input type="radio" name="u_type" id="u_type1" value="c" class="col-md-1" checked>
							<label for="u_type1" class="col-md-3">일반</label>
							<input type="radio" name="u_type" id="u_type2" value="b" class="col-md-1">
							<label for="u_type2" class="col-md-3">사업자</label>
						</div>
            	  	</div>

					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="u_id" class="mb-2">아이디</label> <input type="text"
								name="u_id" id="u_id" class="form-control"
								placeholder="아이디를 입력해주세요.">
						</div>
						<div class="col-md-4 mb-3 mt-4">
							<input type="button" value="ID중복체크" class="btn register_btn" onClick="idCheck()">
						</div>
					</div>
					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="u_pw" class="mb-2">비밀번호</label> <input type="password"
								class="form-control" name="u_pw" id="u_pw"
								placeholder="비밀번호를 입력해주세요.">
	
							
						</div>
						<div class="col-md-4 mb-3 mt-4">
							<button type="button" onclick="chkPW()" class="btn register_btn">암호 확인</button>
						</div>
					</div>	

					<div class="mb-3">
						<label for="u_pw" class="mb-2">비밀번호 확인</label> <input
							type="password" class="form-control" name="u_pw2" id="u_pw2"
							placeholder="비밀번호 확인을 입력해주세요." onMouseDown="pwCheck()">

					</div>

					<div class="mb-3">
						<label for="u_name" class="mb-2">이름</label> <input type="text"
							class="form-control" name="u_name" id="u_name"
							placeholder="이름을 입력해주세요.">
					</div>

					<div class="row mb-3">
						<div class="mb-3 col-md-2">
							<label>성별</label>
						</div>
						<div class="row col-md-10">
							<div class="flex-between-center">
								<div class="form-check form-check-inline">
									<input class="form-check-input login_input" type="radio"
										name="u_sex" id="u_sex1" value="여자" checked> <label
										class="form-check-label" for="u_sex1">여자</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input login_input" type="radio"
										name="u_sex" id="u_sex2" value="남자"> <label
										class="form-check-label" for="u_sex2">남자</label>
								</div>
							</div>
						</div>
					</div>

					<div class="row mb-3">
						<div class="col-md-2 mb-3">
							<label>생년월일</label>
						</div>
						<div class="row col-md-10">
							<div class="col-md-4">
								<input type="text" placeholder="예)1994" name="u_age" id="u_age"
									class="form-control">
							</div>
							<div class="col-md-4">
								<select class="form-control" name="u_age" id="u_age">
									<option value="월">월</option>
									<option value="1월">1월</option>
									<option value="2월">2월</option>
									<option value="3월">3월</option>
									<option value="4월">4월</option>
									<option value="5월">5월</option>
									<option value="6월">6월</option>
									<option value="7월">7월</option>
									<option value="8월">8월</option>
									<option value="9월">9월</option>
									<option value="10월">10월</option>
									<option value="11월">11월</option>
									<option value="12월">12월</option>
								</select>
							</div>
							<div class="col-md-4">
								<input type="text" placeholder="일" name="u_age" id="u_age"
									class="form-control">
							</div>
						</div>
					</div>

					<div class="form-row align-items-center">
						<div class="col-md-2 mb-3">
							<label>이메일</label>
						</div>
						<div class="row col-md-10 mb-3">
							<div class="col-md-6">
								<input type="text" class="form-control mb-2" id="u_email"
									name="u_email">
							</div>
							<div class="col-md-6">
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<div class="input-group-text">@</div>
									</div>
									<select class="form-control" name="u_email" id="u_email">
										<option>선택하세요</option>
										<option value="@naver.com">naver.com</option>
										<option value="@nate.com">nate.com</option>
										<option value="@daum.net">daum.net</option>
										<option value="@google.com">google.com</option>
									</select>
								</div>
							</div>
						</div>
					</div>

					<div class="row mb-3">
						<label for="u_name" class="mb-2 col-md-2">전화번호</label>
						<div
							class="row align-items-center justify-content-between col-md-10">
							<input type="text" class="form-control col-md-3" name="u_tel"
								id="u_tel" placeholder="010" value="010"> - <input type="text"
								name="u_tel" class="form-control col-md-3" /> - <input
								type="text" name="u_tel" class="form-control col-md-3" />
						</div>
					</div>

					<div class="row">
						<label for="u_zipcode" class="mb-2 col-md-2">우편번호</label> <input
							type="text" name="u_zipcode" id="u_zipcode"
							class="form-control col-md-9" size="7" readonly="readonly">
					</div>

					<div class="row mb-3 mt-4">
						<div class="col-md-8">
							<input type="text" name="u_addr" id="u_addr"
							class="form-control" size="7" readonly="readonly">
						</div>
						<div class="col-md-4">
							<input type="button" value="주소검색" class="btn register_btn"
							onClick="openDaumPostcode()">
						</div>
					</div>

					<div class="row mb-3">
						<label for="u_addr2" class="mb-2 col-md-2">상세주소</label>
						<div
							class="row align-items-center justify-content-between col-md-10">
							<input type="text" class="form-control" name="u_addr2"
								id="u_addr2" placeholder="상세주소를 입력해주세요.">
						</div>
					</div>
					
  					<h4 class="terms_title">* 이용약관동의</h4>

  					<div class="mb-4">
	                  <input type="checkbox" name="agree" id="agree" class="col-md-1" checked onclick='selectAll(this)'>
	                  <label for="agree" class="col-mb-11">전체 동의 합니다</label>
		            </div> 

  					<div>
	               		<input type="checkbox" name="agree" id="agree" class="col-md-1" checked>
		                <label for="agree" class="col-mb-11">이용 약관 동의 (필수)</label>
		                <button type="button" class="btn terms_btn" data-toggle="modal" data-target="#exampleModalLong">
						약관 보기
	                    </button>
						<div class="modal fade" id="exampleModalLong" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLongTitle"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">이용 약관 (필수)</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">1 "이용자"란 "사이트"에 접속하여 "회사"가 제공하는 서비스를 받는 자를 말하며 이는 "회원"과 "비회원"으로 구분됩니다.
									2 "회원"이란 "사이트" 내에서 일정의 가입 절차를 거쳐 개인정보를 제공하고 등록을 마친 자로서 "사이트"를 통해 제공되는 모든 서비스를 이용할 수 있습니다.
									3 "비회원"이란 회원 가입 없이 "회사"가 제공하는 서비스를 제한적으로 이용하는 자를 말합니다.
									
									제3조(회원 가입)
									
									1 "회원"이 되고자 하는 자는 "회사"가 정한 가입 양식에 따라 개인 정보를 기입하고 "등록하기" 단추를 누르는 방법으로 회원 가입을 신청합니다.
									2 "회사"는 제1항과 같이 회원으로 가입할 것을 신청한 자가 다음 각 호에 해당하지 않는 한 신청한 자를 회원으로 등록합니다.
									 ① 가입신청자가 본 약관 제6조 제3항에 의하여 이전에 회원자격을 상실 한 적이 있는 경우.
									    다만 제6조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "회사"의 회원 재가입 승낙을 얻은 경우에는 예외로 합니다.
									 ② 등록 내용에 허위, 기재누락, 오기가 있는 경우
									 ③ 기타 회원으로 등록하는 것이 "회사"의 기술상 현저히 지장이 있다고 판단되는 경우
									3 회원가입 계약의 성립시기는 "회사"의 승낙이 가입 신청자에게 도달한 시점으로 합니다.
									4 "회원"은 제1항의 회원정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다.
									
									
									제4조(서비스의 제공 및 변경)
									
									1 "이용자"에게 아래와 같은 서비스를 제공합니다.
									 ① 문화행사신청 온라인 서비스
									 ② 견학신청 온라인 서비스
									 ③ 고객지원(Q&A) 서비스
									 ④ 기타 "회사"가 자체 개발하거나 다른 회사와의 협력 계약 등을 통해 "이용자"들에게 제공할 일체의 서비스
									2 제1항의 서비스는 "비회원"에게는 제한적으로 제공될 수 있으며 제한된 "서비스"의 경우 "회원"들은 log-in 후 이용 가능합니다.
									3 "회사"는 그 변경될 서비스의 내용 및 제공 일자를 제7조 제2항에서 정한 방법으로 "이용자"에게 통지하고, 제1항에 정한 서비스를 변경하여 제공할 수 있습니다.
									4 "회원"은 제1항의 회원 정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다.
									
									제5조(서비스의 중단)
									
									1 "회사"는 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있고, 새로운 서비스로의 교체, 기타 "회사"가 적절하다고 판단하는 사유에 기하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.
									2 제1항에 의한 서비스 중단의 경우에는 "회사"는 제7조 제2항에서 정한 방법으로 이용자에게 통지합니다. 다만, "회사"가 통제할 수 없는 사유로 인한 서비스의 중단(시스템 관리자의 고의, 과실이 없는 디스크 장애, 시스템 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다.
									
									
									제6조(이용자 탈퇴 및 자격 상실 등)
									
									1 "회원"은 "회사"에 언제든지 자신의 회원 등록을 말소해 줄 것(회원 탈퇴)을 요청할 수 있으며 "회사"는 위 요청을 받은 즉시 해당 "회원"의 등록 말소를 위한 절차를 밟습니다.
									2 "회원"이 다음 각 호의 사유에 해당하는 경우, "회사"는 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.
									 ① 가입 신청 시에 허위 내용을 등록한 경우
									 ② 다른 사람의 "서비스" 이용을 방해하거나 그 정보를 도용하는 등 전자 거래질서를 위협하는 경우
									 ③ "서비스"를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
									3 "회사"가 회원자격을 상실시키기로 결정한 경우에는 회원등록을 말소합니다. 이 경우 "회원"에게 회원등록 말소 전에 이를 통지하고, 소명할 기회를 부여합니다.
									4 회원 가입 후 "서비스"를 이용하는 도중, 연속하여 1년 동안 "서비스"를 이용하기 위해 log-in 한 기록이 없는 경우, "회사"는 회원자격을 상실시킬 수 있습니다.
									
									
									제7조(이용자에 대한 통지)
									
									1 "회사"가 특정 이용자에 대해 통지를 하는 경우 "이용자"가 회원 가입 시 제공한 메일주소로 할 수 있습니다.
									2 "회사"가 불특정 다수 이용자에 대해 통지를 하는 경우 "사이트" 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.
									
									제8조(이용자의 개인정보보호)
									
									"회사"는 관련 법령이 정하는 바에 따라서 이용자 등록정보를 포함한 "이용자"의 개인정보를 보호하기 위하여 노력합니다. "이용자"의 개인정보보호에 관해서는 관련 법령 및 "회사"가 정하는 "개인정보 취급방침"에 정한 바에 의합니다.
									
									제9조("회사"의 의무)
									
									1 "회사"는 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하기 위해서 노력합니다.
									2 "회사"는 "이용자"가 안전하게 인터넷 서비스를 이용할 수 있도록 "이용자"의 개인정보 보호를 위한 보안 시스템을 구축합니다.
									3 "회사"는 "이용자"가 원하지 않는 영리 목적의 광고성 전자우편을 발송하지 않습니다.
									
									제10조(이용자의 ID 및 비밀번호에 대한 의무)
									
									1 "회사"가 관계 법령, "개인정보 취급방침"에 의해서 그 책임을 지는 경우를 제외하고, 자신의 ID와 비밀번호에 관한 관리책임은 각 회원에게 있습니다.
									2 "회원"은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
									3 "회원"은 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "회사"에 통보하고 "회사"의 안내가 있는 경우에는 그에 따라야 합니다.
									
									제11조(이용자의 의무)
									
									1 이용자는 다음 각 호의 행위를 하여서는 안됩니다.
									 ① 회원가입신청 또는 변경시 허위내용을 등록하는 행위
									 ② "회사"에 게시된 정보를 변경하는 행위
									 ③ "회사" 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위
									 ④ 다른 회원의 ID를 도용하는 행위
									 ⑤ 정크메일(junk mail), 스팸메일(spam mail), 행운의 편지(chain letters), 피라미드 조직에 가입할 것을 권유하는 메일, 외설 또는 폭력적인 메시지·화상·음성 등이 담긴 메일을 보내거나 기타 공서양속에 반하는 정보를 공개 또는 게시하는 행위
									 ⑥ 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)를 전송 또는 게시하는 행위
									 ⑦ "회사"의 직원이나 "사이트" 서비스의 관리자를 가장하거나 사칭하여 또는 타인의 명의를 도용하여 글을 게시하거나 메일을 발송하는 행위
									 ⑧ 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나 전자우편으로 발송하는 행위
									 ⑨ 스토킹(stalking) 등 다른 이용자를 괴롭히는 행위
									 ⑩ 다른 이용자에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위
									 ⑪ 불특정 다수의 자를 대상으로 하여 광고 또는 선전을 게시하거나 스팸 메일을 전송하는 등의 방법으로 "사이트"의 서비스를 이용하여 영리 목적의 활동을 하는 행위
									 ⑫ "회사"가 제공하는 서비스에 정한 약관, 기타 서비스 이용에 관한 규정을 위반하는 행위
									2 제1항에 해당하는 행위를 한 "이용자"가 있을 경우 "회사"는 본 약관 제6조 제2, 3항에서 정한 바에 따라 "이용자"의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.
									3 "이용자"는 그 귀책사유로 인하여 "회사"나 다른 "이용자"가 입은 손해를 배상할 책임이 있습니다.
									
									
									제12조(공개게시물의 삭제)
									
									"이용자"의 공개게시물의 내용이 다음 각 호에 해당하는 경우 "회사"는 "이용자"에게 사전 통지 없이 해당 공개게시물을 삭제할 수 있고, 해당 "이용자"의 회원 자격을 제한, 정지 또는 상실시킬 수 있습니다.
									1 다른 이용자 또는 제3자를 비방하거나 중상모략으로 명예를 손상하는 내용
									2 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용
									3 범죄행위와 관련이 있다고 판단되는 내용
									4 다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용
									5 기타 관계 법령에 위배된다고 판단되는 내용
									
									
									제13조(게시물에 대한 책임과 정책)
									
									"이용자"가 게시판 내에 게시한 게시물의 저작권은 게시자 본인에게 있으며, 본 게시판에 올린 정보나 의견은 "회사"의 입장과는 무관합니다.
									게시판에 게시한 게시물로 파생되는 문제에 대해서는 전적으로 해당 게시물을 게시한 본인에게 책임이 있습니다.
									"회사"는 "이용자"가 게시판에 게시, 게재하거나 서비스를 통해 전송한 내용물에 대하여 책임이 없으며, 삭제 대상이 되는 게시물에 해당하는 경우에는 사전 통지 후 삭제할 수 있습니다.
									단 게시물이 불법적인 내용이 확실할 경우 통보 없이도 삭제가 가능합니다.
									"이용자"가 게시한 게시물이 타인의 저작권, 프로그램 저작권 등을 침해하더라도 이에 대한 민형사상의 책임을 부담하지 않으며, 만일 이를 이유로 "회사"가 타인으로부터 손해배상청구 등 이의 제기를 받은 경우 해당 "이용자"는 그로 인해 발생한 모든 손해를 부담하여야 합니다.
									1 "회사"는 "이용자"가 게시한 서비스 내의 모든 내용물이 게시판 운영원칙에 위배된다고 판단할 경우 해당 게시자에게 사전 또는 사후 통보 없이 삭제할 수 있으며, 더불어 해당 "이용자"에게는 그 경중에 따라 합당한 제재를 가할 수 있습니다.
									2 "회사"는 필요에 의해 제공되는 카테고리 및 게시판의 추가 생성과 삭제를 임의로 할 수 있으며, 또한 게시판에 저장된 자료에 대해 게재기간 또는 저장기간을 정할 수 있고, 이를 변경할 수 있습니다.
									3 "회사"는 필요에 따라 "이용자"가 게시한 게시물을 사전 통지 없이 편집, 이동할 수 있으며, "이용자"가 해지하거나 적법한 사유로 해지 된 경우 해당 "이용자"가 게시하였던 게시물을 삭제할 수 있습니다.
									
									제14조(게시물 삭제 기준/ 제재조치)
									
									'정보 통신 윤리 위원회 규칙'을 기본 원칙으로 하며 다음과 같은 내용의 게시물은 등록을 금합니다.
									1 현행법을 어기고 공공질서, 미풍양속을 저해하는 내용의 게시물
									 - 국가이념과 국가의 존립을 훼손하고 반국가적 행위의 수행을 목적으로 하는 내용
									 - 타인 또는 타 단체의 권리를 침해하거나 명예를 훼손하는 내용
									 - 사회적 혼란을 야기시키는 허위 사실인 내용
									 - 개인의 사생활을 침해하는 내용
									 - 인명을 경시하고 폭력성이 짙은 내용 및 범죄 혹은 비행행위를 찬미, 조장하는 내용
									 - 범죄행위의 구체적인 방법을 묘사하여 모방 범죄를 유발하게 하는 내용
									 - 보는 이에게 혐오감을 유발할 내용과 정보
									 - 성적인 욕구를 지나치게 자극하거나 혐오감을 주는 음란한 내용
									 - 불륜관계, 근친상간 등 패륜적, 반인류적 성행위를 자세하게 소개하거나 흥미 위주로 묘사한 내용
									 - 성폭력, 강간, 윤간 등 성범죄를 구체적, 사실적으로 묘사하거나 미화한 내용
									 - 성을 상품화하거나 특정 신체 부위를 지나치게 노출 및 언급한 내용
									 - 욕설 또는 언어폭력 등의 저속한 표현으로 타인의 인격을 모독하거나 불쾌감 또 혐오감을 불러일으키는 내용
									 - 특정 종교 간의 감정 대립을 조장하는 내용
									 - 미신 또는 비과학적인 생활 태도를 조장하는 내용
									2 적절하지 못한 내용을 담은 게시물
									 - 스팸성 글(저주성 글, 행운의 편지 등)
									 - 특정 개인 신상 정보 노출로 인해 피해가 예상되는 경우
									 - 근거 없는 내용을 게재함으로 인해 개인, 특히 공인의 사생활침해 및 명예 훼손의 소지가 있는 경우
									 - 게시물의 내용이 게시판의 성격에 위배되거나 동일한 게시물을 여러 게시판에 등록한 경우
									 - 지나치게 무성의, 무의미한 내용의 게시물
									 - 버그 현상으로 인해 화면상에서 그 내용을 확인할 수 없는 게시물
									 - 카테고리에 대한 주제와 무관하게 진행되는 논쟁으로 인해 게시판 이용에 혼란을 야기시키는 게시물
									 - 관리자에 의해 삭제된 게시물을 전체 인용하는 경우
									 - 매춘, 사이버 섹스, 노골적인 성적 대화 등 성적 유희 대상을 찾거나 매개하는 내용
									 - 음란 정보 또는 퇴폐업소가 있는 장소를 안내 또는 매개하는 내용
									 - 특정 이용자, 개인을 감정적으로 비난하고 분쟁을 유도하는 내용의 게시물
									 - 의료, 기구, 약품, 건강 보조 식품 등을 과장되게 소개하여 오용 또는 남용을 조장하는 내용을 담은 게시물
									 - 출처가 불분명한 인용문(일명 가져온 글) 및 게시자가 책임지지 못하는 정보 및 주장을 담은 게시물
									 - 정보통신설비의 오동작이나 정보 등의 파괴 및 혼란을 유발하는 컴퓨터 바이러스 감염자료를 등록 또는 유포하는 행위
									3 저작권에 위반되는 내용의 게시물
									 - 상용 프로그램의 등록과 게재, 배포를 안내하는 내용
									 - 정품 확인이 안 되는 소프트웨어, 각종 저작물의 유통을 담은 내용
									 - 타인의 권리에 속하는 저작권, 상표권, 의장권 등을 무단으로 침해하는 내용
									4 온라인 판매/구매/돈 벌기 관련 게재 금지 게시물
									 - 돈 벌기 사이트 관련 게시물
									 - 특정 사이트 및 제품에 대한 직접적인 홍보 및 간접 홍보의 내용
									 - 불법 게임, 소프트웨어, 음반, 영상의 복사 및 판매(백업CD 포함)의 내용
									 - 음란, 폭력물을 판매할 목적으로 선전하는 내용
									 - 미풍양속을 위반하고 사행심을 조장하는 영상 및 저작물
									4 기타
									 - 타인의 아이디를 도용해 부정하게 사용하는 경우
									 - "회사"의 정상적인 경영활동 및 서비스를 방해하고 회사 이익에 막대한 지장과 해악을 미친다고 판단되는 게시물
									 - "이용자"들에게 피해 및 손해를 입힐 우려가 있다고 판단되는 게시물
									이상의 내용에 저촉되는 게시물 등에 대해서는 사전 통지 없이 임의 삭제될 수 있으며 위반사항이 거듭되거나 위반으로 인한 피해가 극심하다고 판단되는 경우, "이용자"를 경고 또는 이용 중지 처리할 수 있습니다.
									
									제15조(저작권의 귀속 및 이용제한)
									
									1 "사이트"와 관련한 자산은 저작권, 상표권, 기술에 대한 정보, 텍스트, 그래픽, 오디오, 비디오, 다운로드, 링크, 그리고 소스 코드 (이하 웹사이트 서비스)이며, "회사"는"서비스" 대해 모든 권리를 가지고 있습니다. 모든 형태의 정보는 "이용자" 여러분들을 위한 것이며, 여러분들의 편의를 위해 제공되는 것입니다. 그러나, "회사"는 이러한 정보에 대한 상업적 사용권을 허락하는 것은 아님을 밝혀드립니다. "이용자"는 개인적인 용도가 아닌 어떠한 경우에도 이 "사이트" "서비스"를 사용할 수 없습니다.
									2 이용자는 "사이트"를 이용함으로써 얻은 정보를 "회사"의 사전승낙 없이 복제, 전송, 출판, 배포, 방송 기타 방법에 의하여 영리 목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.
									
									제16조(면책)
									
									1 "회사"는 "이용자"가 "서비스"를 이용함으로써 기대되는 수익을 얻지 못하거나 "서비스"를 통해 얻은 자료를 이용하여 발생한 손해에 대해서는 책임을 부담하지 않습니다.
									2 "사이트"의 정보나 자료들은 증권거래에 관련된 기구들의 요구 조건을 충족시키지 못함을 알려드립니다. 그러므로, 이러한 정보나 자료 등을 참조해 투자 결정을 내리지 마시기를 부탁드립니다. 이에 대해 "회사"는 명시적으로 이들 정보나 자료 등에 대해 상업, 금융 정보로서 정확성, 신뢰성에 대해 어떠한 보증도 할 수 없음을 알려드립니다.
									3 "회사"는 자체적인 기준에 의거해 다양한 링크를 제공하고 있습니다. 링크 된 웹사이트들은 모두 "이용자"들의 정보획득과 편의를 위해 제공하고 있으나 링크 사이트에 대한 어떤 법적 책임도 "회사"에는 있지 않으며 웹사이트의 신뢰성에 대한 보장을 "회사"가 하지는 않습니다. 각 링크 사이트는 "이용자" 여러분께서 판단하시어 효율적으로 이용하시기 바랍니다.
									4 "이용자"가 화면에 게재한 정보, 자료, 사실 등의 내용에 관한 신뢰도 또는 정확성에 대하여는 해당 "이용자"가 책임을 부담하며, "회사"는 내용의 부정확 또는 허위로 인해 "이용자" 또는 제3자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다.
									5 "회사"는 "서비스" 이용과 관련하여 "이용자"의 고의 또는 과실로 인하여 "이용자" 또는 제3자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다.
									
									제17조(약관의 개정)
									
									1 "회사"는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
									2 "회사"가 본 약관을 개정할 경우에는 적용 일자 및 개정 사유를 명시하여 현행약관과 함께 초기화면에 그 적용 일자 칠(7)일 이전부터 적용 일자 전일까지 공지합니다.
									3 "이용자"는 변경된 약관에 대해 거부할 권리가 있습니다. "이용자"는 변경된 약관이 공지된 후 십오(15)일 이내에 거부 의사를 표명할 수 있습니다. "이용자"가 거부하는 경우 "회사"는 당해 "이용자"와의 계약을 해지할 수 있습니다. 만약 "이용자"가 변경된 약관이 공지된 후 십오(15)일 이내에 거부 의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니다.
									
									제18조(재판관할)
									
									"회사"와 "이용자" 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할을 가지는 대한민국의 법원에 제기합니다.
									
									부 칙
									
									본 약관은 2010년 4월 1일부터 적용됩니다.
									2004년 10월 4일부터 시행되던 종전의 약관은 본 약관으로 대체합니다.
									
												2014-11-25</div>
									<div class="modal-footer">
										<button type="button" class="btn col-md-4" data-dismiss="modal">확인</button>
									</div>
								</div>
							</div>
						</div>
					</div>      
		                  
  					<div>
	               		<input type="checkbox" name="agree" id="agree" class="col-md-1" checked>
		                <label for="agree" class="col-mb-11">개인 정보 수집 ·이용 동의 (필수)</label>
		                <button type="button" class="btn terms_btn" data-toggle="modal" data-target="#exampleModalLong">
						 약관 보기
                        </button>
						<div class="modal fade" id="exampleModalLong" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLongTitle"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">개인 정보 수집 ·이용 동의 (필수)</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">□ 개인정보의 수집 및 이용 동의
								㈜포스코는 귀하께서 포스코 홈페이지(www.posco.co.kr)의 이용약관의 내용에 대해 「동의한다」버튼 또는 「동의하지 않는다」버튼을 클릭할 수 있는 절차를 마련하여, 「동의한다」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 간주합니다.
								※ 본 서비스(사이트)는 만 14세 미만의 아동에 대한 개인정보를 수집하고 있지 않으며, 홈페이지에 아동에게 유해한 정보를 게시하거나 제공하고 있지 않습니다.
								
								포스코 홈페이지는 회원가입 시 서비스 이용을 위해 필요한 최소한의 개인정보만을 수집합니다.
								처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의  동의를 받는 등 필요한 조치를 이행 할 예정입니다.
								
								회원가입
								귀하가 포스코 홈페이지의 서비스를 이용하기 위해서는 회원가입 시 (희망 ID, 비밀번호, 성명, 핸드폰번호, E-mail 주소, 생년월일, 아이핀DI(중복가입확인정보) )를 필수적으로 입력하셔야 합니다. 그러나, 선택항목(전화번호, 포스코와의 관계 등)은 이를 입력하지 않더라도 서비스 이용에는 제한이 없습니다.
								개인정보 항목별 구체적인 수집목적 및 이용목적은 다음과 같습니다.
								
								- 성명, 아이디, 비밀번호, 생년월일, 아이핀DI(중복가입확인정보) : 회원제 서비스 이용에 따른 본인 식별 절차에 이용
								- 이메일주소, 핸드폰번호, (선택)전화번호 : 고지사항 전달, 불만처리 등을 위한 원활한 의사소통 경로의 확보, 새로운 서비스 및 뉴스, 이벤트 정보 등의 안내
								- 핸드폰번호, (선택)전화번호 : 경품 배송에 대한 정확한 배송지의 확보
								- (선택)기타 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료
								
								□ 수집하는 개인정보 항목
								① 필수 개인정보 항목
								회원 아이디, 패스워드, 이름, 휴대폰번호, 이메일 주소, 생년월일, 아이핀DI(중복가입확인정보)
								② 선택 개인정보 항목
								전화번호, 포스코와의 관계
								
								□ 개인정보의 보유기간 및 이용기간
								포스코 홈페이지내 수집된 개인정보의 보유기간은 다음과 같습니다. 회원정보는 해지(탈퇴신청 등)시 즉시 파기되며, 1년간 로그인하지 않을 경우 휴면계정으로 전환하여 분리 보관되며 분리 보관된 개인정보는 3년 경과시 파기합니다.
								파기 시 포스코 홈페이지는 회원님의 개인정보를 재생이 불가능한 방법으로 즉시 파기하며(개인정보가 제3자에게 제공된 경우에는 제3자에게도 파기하도록 지시합니다.) 다만 다음 각호의 경우에는 각 호에 명시한 기간 동안 개인정보를 보유합니다.
								
								① 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 법령에서 규정한 보존기간 동안 거래내역과 최소한의 기본정보를 보유함
								
								② 보유기간을 회원님에게 미리 고지하고 그 보유기간이 경과하지 아니한 경우와 개별적으로 회원님의 동의를 받은 경우에는 약속한 보유기간동안 보유함
								
								□ 동의 거부 권리 및 동의 거부 시 불이익 내용
								귀하는 개인정보의 수집목적 및 이용목적에 대한 동의를 거부할 수 있으며, 동의 거부시 포스코 홈페이지에 회원가입이 되지 않으며, 포스코 홈페이지에서 제공하는 제한적인 서비스(문화행사 신청, 견학 신청, 문의하기)를 이용할 수 없습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn col-md-4" data-dismiss="modal">확인</button>
									</div>
								</div>
							</div>
						</div>
						
					</div>      

  					<div>
	               		<input type="checkbox" name="agree" id="agree" class="col-md-1" checked>
		                <label for="agree" class="col-mb-11">위치정보 이용 약관 동의 (선택)</label>
		                <button type="button" class="btn terms_btn" data-toggle="modal" data-target="#exampleModalLong">
						약관 보기
                        </button>
						<div class="modal fade" id="exampleModalLong" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLongTitle"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">위치정보 이용 약관 동의 (선택)</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">제 1 조 (목적)이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
										제 2 조 (약관 외 준칙)
										이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.
										
										제 3 조 (서비스 내용 및 요금)
										①회사는 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
										1.GeoTagging 서비스: 게시물 또는 이용자가 저장하는 콘텐츠에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다. 저장된 위치정보는 별도의 활용없이 보관되거나, 또는 장소를 기반으로 콘텐츠를 분류하거나 검색할 수 있는 기능이 제공될 수도 있습니다.
										2.위치정보를 활용한 검색결과 및 콘텐츠 제공 : 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과, 주변결과(맛집, 주변업체, 교통수단 등), 번역결과를 제시합니다.
										3.이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
										4.이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
										5.길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스, 주소 자동 입력 등 다양한 운전 및 생활 편의 서비스를 제공합니다.
										②제1항 위치기반서비스의 이용요금은 무료입니다.
										제 4 조 (개인위치정보주체의 권리)
										①개인위치정보주체는 개인위치정보 수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의 이용ㆍ제공 목적, 제공받는 자의 범위 및 위치기반서비스의 일부에 대하여 동의를 유보할 수 있습니다.
										②개인위치정보주체는 개인위치정보의 수집ㆍ이용ㆍ제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.
										③개인위치정보주체는 언제든지 개인위치정보의 수집ㆍ이용ㆍ제공의 일시적인 중지를 요구할 수 있습니다.
										이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있습니다
										④개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다.
										이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다.
										1.개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료
										2.개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용
										⑤회사는 개인위치정보주체가 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 파기합니다.
										단, 동의의 일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료에 한합니다.
										⑥개인위치정보주체는 제1항 내지 제4항의 권리행사를 위하여 이 약관 제13조의 연락처를 이용하여 회사에 요구할 수 있습니다.
										제 5 조 (법정대리인의 권리)
										①회사는 만14세 미만 아동으로부터 개인위치정보를 수집ㆍ이용 또는 제공하고자 하는 경우에는 만14세 미만 아동과 그 법정대리인의 동의를 받아야 합니다.
										②법정대리인은 만14세 미만 아동의 개인위치정보를 수집ㆍ이용ㆍ제공에 동의하는 경우 동의유보권, 동의철회권 및 일시중지권, 열람ㆍ고지요구권을
										행사할 수 있습니다.
										제 6 조 (위치정보 이용ㆍ제공사실 확인자료 보유근거 및 보유기간)
										회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 위치정보시스템에
										자동으로 기록하며, 6개월 이상 보관합니다.
										
										제 7 조 (서비스의 변경 및 중지)
										①회사는 위치기반서비스사업자의 정책변경 등과 같이 회사의 제반 사정 또는 법률상의 장애 등으로 서비스를 유지할 수 없는 경우, 서비스의 전부 또는 일부를 제한, 변경하거나 중지할 수 있습니다.
										②제1항에 의한 서비스 중단의 경우에는 회사는 사전에 인터넷 등에 공지하거나 개인위치정보주체에게 통지합니다.
										제 8 조 (개인위치정보 제3자 제공 시 즉시 통보)
										①회사는 개인위치정보주체의 동의 없이 당해 개인위치정보주체의 개인위치정보를 제3자에게 제공하지 아니하며, 제3자 제공 서비스를 제공하는 경우에는 제공받는 자 및 제공목적을 사전에 개인위치정보주체에게 고지하고 동의를 받습니다.
										②회사는 개인위치정보를 개인위치정보주체가 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신단말장치로 매회 개인위치정보주체에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다.
										③다만, 아래에 해당하는 경우에는 개인위치정보주체가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소 등으로 통보합니다.
										1.개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우
										2.개인위치정보주체가 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소 등으로 통보할 것을 미리 요청한 경우
										제 9 조 (8세 이하의 아동 등의 보호의무자의 권리)
										①회사는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동”등이라 함)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.
										1.8세 이하의 아동
										2.피성년후견인
										3.장애인복지법 제2조제2항제2호의 규정에 의한 정신적 장애를 가진 자로서 장애인고용촉진 및 직업재활법 제2조제2호의 규정에 의한 중증장애인에 해당하는 자(장애인복지법 제32조의 규정에 의하여 장애인등록을 한 자에 한정)
										②8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 합니다.
										③보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치정보주체 권리의 전부를 행사할 수 있습니다.
										제 10 조 (개인위치정보의 보유목적 및 이용기간)
										①회사는 위치기반서비스를 제공하기 위해 필요한 최소한의 기간 동안 개인위치정보를 보유 및 이용합니다.
										②회사는 대부분의 위치기반서비스에서 개인위치정보를 일회성 또는 임시로 이용 후 지체없이 파기합니다. 단, ‘GeoTagging’ 서비스와 같이 이용자가 게시물, 콘텐츠와 함께 개인위치정보를 네이버 서비스에 게시 또는 보관하는 경우, 해당 게시물, 콘텐츠의 보관기간 동안 개인위치정보가 함께 보관됩니다.
										제 11 조 (손해배상)
										개인위치정보주체는 회사의 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 26조의 규정을 위반한 행위로 손해를 입은 경우에 회사에 대하여 손해배상을 청구할 수 있습니다. 이 경우 회사는 고의 또는 과실이 없음을 입증하지 아니하면 책임을 면할 수 없습니다.
										
										제 12 조 (분쟁의 조정)
										①회사는 위치정보와 관련된 분쟁에 대하여 개인위치정보주체와 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 방송통신위원회에 재정을 신청할 수 있습니다.
										②회사 또는 개인위치정보주체는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보보호법에 따라 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.
										제 13 조 (사업자 정보 및 위치정보 관리책임자)
										①회사의 상호, 주소 및 연락처는 다음과 같습니다.
										상호: 네이버주식회사
										
										주소: 경기도 성남시 분당구 정자일로 95, NAVER 1784 (우)13561
										
										전화번호: 1588-3820
										
										②회사는 다음과 같이 위치정보 관리책임자를 지정하여 이용자들이 서비스 이용과정에서 발생한 민원사항 처리를 비롯하여 개인위치정보주체의 권리 보호를 위해 힘쓰고 있습니다.
										위치정보 관리책임자 : 이진규 CPO / DPO (개인정보 보호책임자 겸직)
										메일 : 문의하기
										
										부칙
										제 1 조 시행일
										2022년 4월 27일부터 시행되던 종전의 약관은 본 약관으로 대체하며, 본 약관은 2022년 5월 18일부터 적용됩니다.
										<div class="modal-footer">
										<button type="button" class="btn col-md-4" data-dismiss="modal">확인</button>
									</div>
								</div>
							</div>
						</div>    
	               	</div>
	               	
  					<div>
	               		<input type="checkbox" name="agree" id="agree" class="col-md-1" checked>
		                <label for="agree" class="col-mb-11">이벤트/프로모션 메일 수신 (선택)</label>
		            	<button type="button" class="btn terms_btn" data-toggle="modal" data-target="#exampleModalLong">
						약관 보기
                        </button>
						<div class="modal fade" id="exampleModalLong" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLongTitle"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">이벤트/프로모션 메일 수신 (선택)</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">본 동의는 ㈜마이지놈박스 서비스(이하 “서비스”라 한다)에서 수집한 아래와 같은 항목을 이용하여, 고객님에게 전자적 전송매체를 통해 마케팅 · 이벤트 등 프로모션 등의 목적으로 광고 또는 정보를 전송하는 것에 대한 광고성 정보 수신동의로서, 고객님은 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으며, 본 동의를 거부할 경우 받는 별도의 불이익은 없습니다.


										광고성 정보 전송에 대한 안내
										
										내용 및 목적	이용항목	이용기간
										이메일 및 SMS를 통해, ㈜마이지놈박스의 상품 또는 서비스에 대한 마케팅, 이벤트 등 프로모션 정보 전송	이메일 주소, 휴대전화번호	회원탈퇴/동의 철회시까지
										안내
										
										고객이 수집 및 이용에 동의한 개인정보를 활용하여, 전자적 전송매체를 통해, ㈜마이지놈박스의 상품 또는 서비스에 대한 마케팅, 이벤트 등 프로모션 정보를 전송할 수 있습니다.
										법령에 따른 개인정보의 수집/이용 및 개인정보 처리와 관련된 일반 사항은 서비스의 개인정보처리방침에 따릅니다.
										고객이 본 수신동의를 철회하고자 할 경우 서비스 홈페이지 https://www.mygenomebox.com을 통해 수신동의 철회 요청을 할 수 있습니다.
										
										<div class="modal-footer">
										<button type="button" class="btn col-md-4" data-dismiss="modal">확인</button>
									</div>
								</div>
							</div>
						</div>
	               	</div>
	               	
					<button class="btn register_submit" type="submit">가입 완료</button>
					
				</form>

			</div>
		</div>
	</div>

	<script>
          window.addEventListener('load', () => {
            const forms = document.getElementsByClassName('validation-form');
      
            Array.prototype.filter.call(forms, (form) => {
              form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                  event.preventDefault();
                  event.stopPropagation();
                }
      
                form.classList.add('was-validated');
              }, false);
            });
          }, false);
        </script>

</body>
</html>