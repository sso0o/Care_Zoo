/**
 *  board.js
 */
//게시글 작성 유효성 검사(필수 입력요소 검사)
function homeSitterJoinCheck(formId){
	//form 요소 선택하기
	//만약에 유효성 검사가 제대로 끝나면 true, 아니면 false 반환
	var form = $("#"+formId);
//	form.find("선택자") : 특정요소의 하위요소중에  선택자에 해당하는 요소 선택
	var email = form.find("input[name='hs_email']").val().trim();	
//	var e_address = form.find("input[name='hs_e_address']").val().trim();
	if(email==''){  //문자열이 비어있는지 확인
		alert("이메일 아이디를 입력하세요.");
		return false;
	} 
	// 이메일 형식에 맞는 문자열인지 확인
//	var result = verifyEmail(e_address);
//	if(!result){
//		alert("이메일 형식에 맞지 않습니다.");
//		return false;
//	}
	if(form.find("input[name='hs_pass']").val().trim()==''){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(form.find("input[name='hs_name']").val().trim()==''){
		alert("이름을 입력하세요.");
		return false;
	}
	if(form.find("input[name='hs_address']").val().trim()==''){
		alert("주소를 입력하세요.");
		return false;
	}
	if(form.find("input[name='hs_d_address']").val().trim()==''){
		alert("상세주소를 입력하세요.");
		return false;
	}
	return true;
}
function verifyEmail(e_address){
	//정규표현식 검사 
	var emailExp = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*[.][a-zA-Z]{2,3}$/i;
//	var result = emailExp.test(e_address);
	var result = e_address.match(emailExp);
//	e_address.match(emailExp)
	if(result){
		return true;
	}else{
		return false;
	}
}
function getOriginFileName(fullName){
	if(fullName == null){
		return;
	}
	//UUID : XXXXX-XXXXX-XXXXX-XXXXX_filename
	// '_'이후 부터가 진짜 파일 이름
	var idx = fullName.indexOf("_")+1; //파일이름의 시작점 찾기
	return fullName.substr(idx);
}







