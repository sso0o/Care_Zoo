package com.what.carezoo.comment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class CommentController {
	
	@RequestMapping("/hsRList")
	public String homeSitterReview() {
		return "review/homeSitterReviewList";
	}
	
	
	@RequestMapping("/vsRList")
	public String visitSitterReview() {
		return "review/homeSitterReviewList";
	}
	
	
	@RequestMapping("/phRList")
	public String petHotelReview() {
		return "review/homeSitterReviewList";
	}

}
