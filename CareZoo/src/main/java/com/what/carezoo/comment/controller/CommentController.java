package com.what.carezoo.comment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@RequestMapping("/hscList")
	public String homeSitterComment() {
		return "comment/homeSitterCommentList";
	}
	
	
	@RequestMapping("/vscList")
	public String visitSitterComment() {
		return "comment/homeSitterCommentList";
	}
	
	
	@RequestMapping("/phcList")
	public String petHotelComment() {
		return "comment/homeSitterCommentList";
	}

}
