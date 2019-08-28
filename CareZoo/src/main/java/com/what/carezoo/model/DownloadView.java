package com.what.carezoo.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView{
	//common
	//AbstractView 추상클래스
	private File file;
	
	public DownloadView(File file) {
		this.file = file;
		
		//응답타입을 다운로드로 변경
		//response
		setContentType("application/download;utf-8");
	}
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//View 만들기~~~~
		//응답객체에 파일을 담아서 전달.	
		response.setContentLengthLong(file.length());
		
		//다운로드시 표시할 이름을 설정.
		String fullName = file.getName();
		//파일 이름에서 uuid 제거
		int idx = fullName.indexOf("_")+1;
		String fileName = fullName.substring(idx);
		
		//파일이름 한글설정:  
		//브라우저마다 한글이름 설정하는 방식이 다르다.
		//브라우저가 internet explorer인지 확인 후, ie일 경우와 아닐 경우에 인코딩을 다르게 처리
		String userAgent = request.getHeader("User-Agent");
		//MSIE라는 문자열을 포함하는지 확인
		fileName = URLEncoder.encode(fileName,"utf-8");

		
		
		//UUID를 제거한 파일이름을 응답에 실어주기.
		response.setHeader("Content-Disposition", 
				"attachment; filename=\""+fileName+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		//binary:이진법
		
		//응답객체가 가지는 스트림을 이용해서 응답
		OutputStream out = response.getOutputStream();
		//OutputStream: 우리 프로그램에서 내 보내겠다.
		FileInputStream in = null;
		try {
		in = new FileInputStream(file);
		FileCopyUtils.copy(in,out);
		}catch(Exception e){
				e.printStackTrace();
		}finally {
			if(in!=null)
				in.close();
		}
		out.flush();
	}
}
