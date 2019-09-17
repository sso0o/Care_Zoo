package com.what.carezoo.comment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class CommentController {
	
	@RequestMapping("/reviewMain")
	public String reviewMain() {
		return "review/reviewMain";
	}

}
