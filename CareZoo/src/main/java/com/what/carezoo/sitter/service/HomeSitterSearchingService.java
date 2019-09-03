package com.what.carezoo.sitter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.what.carezoo.dao.HomeSitterListDao;
import com.what.carezoo.model.HomeSitterList;



@Service
public class HomeSitterSearchingService {
	@Autowired
	private HomeSitterListDao hslDao;
	public boolean modifyHsl(HomeSitterList hsl) {
		if(hslDao.insertHsl(hsl)>0) {
			return true;
		}
		return false;
	}
	public List<HomeSitterList> getbySearchingHsl(HomeSitterList hsl){		
		return hslDao.selectAllHsl(hsl);
	}
	public List<HomeSitterList> getByHslbyAddress(List<String> hsl_address){
		return hslDao.searchHslbyAddress(hsl_address);
	}
}
