package com.what.carezoo.dao;

import java.util.List;

import com.what.carezoo.model.HomeSitterComment;

public interface HomeSitterCommentDao {
	
	public int insert(HomeSitterComment hsc);
	public int update(HomeSitterComment hsc);
	public int delete(int hsc_num);
	public HomeSitterComment selectByHsc_num(int hsc_num);
	public List<HomeSitterComment> selectByHs_num(int hs_num);
	public List<HomeSitterComment> selectAll();
	public double hs_star(int hs_num);	

}
