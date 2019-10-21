package com.what.carezoo.member.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.what.carezoo.dao.MemberDao;
import com.what.carezoo.model.Customer;

@Service
public class MemberService {
	
	private static final String UPLOAD_PATH = "c:\\temp";
	
	
	//회원관련 기능 작성
	@Autowired
	private MemberDao memberDao;
	
	
//	private SqlSessionTemplate userSqlsession;
	
	//로그인
	public boolean login(String c_email,String c_pass) {
		Customer member = memberDao.selectOneByEmail(c_email);
		if(member!=null) {
			String originPass = member.getC_pass();
			if(c_pass.equals(originPass)) {
				//아이디존재, 비밀번호 일치
				return true;
			}
		}
		return false;
	}
	//비밀번호 중복 확인
	public boolean pass(String c_pass,String c_pass_chk) {
		if(c_pass.equals(c_pass_chk)) {
			return true;
		}
		return false;
	}
	
	public Customer getMemberByEmail(String email) {
		return memberDao.selectOneByEmail(email);
	}
	
	public Customer getMemberByC_num(int c_num) {
		return memberDao.selectOneByNum(c_num);
	}
	//c_email컬럼 합치는 메서드
	public String email(String c_email,String c_e_address) {
		c_email = c_email+"@"+c_e_address;
		return c_email;
	}
	//가입
	public boolean joinMember(Customer customer) {
		int rst = memberDao.insertCustomer(customer);
		if(rst>0) {
			return true;
		}
		return false;
	}
	//kakao 가입
	public boolean joinMember2(Customer customer) {
		int rst = memberDao.insertCustomer2(customer);
		if(rst>0) {
			return true;
		}
		return false;
	}
	
	public List<Customer> selectAll(){
		return memberDao.selectAll();
	}
	//아이디 체크
	public int userIdCheck(String c_email) {
		return memberDao.userIdCheck(c_email);
	}
	
	//정보 수정
	public boolean modifyUser(Customer customer, MultipartFile file) {
		System.out.println("여기로 넘어오닝?");
		if(memberDao.updateCustomer(customer)>0) {
			System.out.println("여긴??");
			if(file == null) {
				return true;				
			} else {
				String fullName = writeFile(file);
				System.out.println("fullname : "+fullName);
				Map<String, Object> fileParam = new HashMap<String, Object>();
				fileParam.put("c_num", customer.getC_num());
				fileParam.put("c_filename", fullName);
				if(getImage(customer.getC_num()) != null) {
					if(memberDao.updateFile(fileParam)>0) {
						return true;
					} else return false;
				} else {
					if(memberDao.insertFile(fileParam) > 0) {
						return true;
					}
				}
			}
		}
		return false;
	}
	
	
	public List<Map<String, Object>> getMainSitterReview() {
		return memberDao.getMainSitterReview();
	}
	
	public List<Map<String, Object>> getMainPethotelReview(){
		return memberDao.getMainPethotelReview();
	}
	
	
	
	
	
	
	
	private String writeFile(MultipartFile file) {
		String fullName = null;
		// 1.UUID 만들고, 파일이름에 붙여서 저장할 파일명 생성
		UUID uuid = UUID.randomUUID();
		fullName = uuid.toString() + "_" + file.getOriginalFilename();
		// 2. 파일저장(지정한 경로에 파일을 만들고, 받아온 파일의 내용을 복사)
		File target = new File(UPLOAD_PATH, fullName); // 비어있는 파일 하나 만들어진 것
		try {
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			System.out.println("파일 복사 예외 발생!!");
			e.printStackTrace();
			return null;
		}
		// 3. 만든 파일 이름 반환
		return fullName;
	}
	
	public String  getImage(int num) {
		return memberDao.selectFile(num);
	}
	

	//이메일 찾기
	public String findC_email(String c_name,String c_contact){
		return memberDao.findC_email(c_name, c_contact);
	}
	public int findC_emailCount(String c_name,String c_contact) {
		return memberDao.findC_emailCount(c_name, c_contact);
	}
	
	//삭제
	public boolean deleteCustomer(int c_num) {
		if(memberDao.deleteCustomer(c_num)>0) {
			return true;
		}return false;
	}
	
	
	//예약현황에서 이벤트 눌렀을때 모달정보 가져오기
	public Map<String, Object> getModalHS(int num) {
		return memberDao.getModalHS(num);
	}
	public Map<String, Object> getModalVS(int num) {
		return memberDao.getModalVS(num);
	}
	public Map<String, Object> getModalPH(int num){
		return memberDao.getModalPH(num);
	}
	
	//예약 취소
	public boolean cancelHSR(int num) {
		if(memberDao.cancelHSR(num)>0) {
			return true;
		}
		return false;
		
	}
	
	public boolean cancelVSR7(int num) {
		if(memberDao.cancelVSR7(num) > 0) {
			return true;
		}
		return false;
	}
	public boolean cancelVSR(int c_num, int vsr_count) {
		if(memberDao.cancelVSR(c_num, vsr_count) > 0) {
			return true;
		}
		return false;
	}
	
	public boolean cancelPHR(int num) {
		if(memberDao.cancelPHR(num) >0) {
			return true;
		}
		return false;
	}
	
	//결제정보 가져오기
	public Map<String, Object> getPayInfoHSR(int num) {
		return memberDao.getPayInfoHSR(num);
	}
	public Map<String, Object> getPayInfoVSR(int num) {
		return memberDao.getPayInfoVSR(num);
	}
	
	//updateStatus
	public boolean updateStatusHSR(int num, String uid) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("num",num);
		param.put("uid",uid);
		if(memberDao.updateStatusHSR(param)>0) {
			return true;
		}
		return false;
	}
	public boolean updateStatusVSR(int num, String uid) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("num",num);
		param.put("uid",uid);
		if(memberDao.updateStatusVSR(param)>0) {
			return true;
		}
		return false;
	}
	
	
	public int findC_id(String c_id) {
		return memberDao.findC_id(c_id);
	}

}
