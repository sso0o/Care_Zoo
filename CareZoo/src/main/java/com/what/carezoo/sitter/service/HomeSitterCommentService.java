package com.what.carezoo.sitter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.HomeSitterCommentDao;
import com.what.carezoo.model.HomeSitterComment;

@Service
public class HomeSitterCommentService {
	@Autowired
	private HomeSitterCommentDao hscDao;
	
	public List<HomeSitterComment> getHomesitterComment(int hs_num) {	
		System.out.println("홈시터당 코멘트 목록 : "+hscDao.selectByHs_num(hs_num));
		return hscDao.selectByHs_num(hs_num);
	}
}
