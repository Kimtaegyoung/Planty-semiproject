package com.planty.jsp.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.planty.jsp.review.model.dto.ReviewDTO;
import com.planty.jsp.review.model.service.ReviewService;


@WebServlet("/review/list")
public class ReviewList extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService ReviewService = new ReviewService();
		
		List<ReviewDTO> reviewList = ReviewService.selectReviewList();
		
		for(ReviewDTO review : reviewList) {
			System.out.println(review);
		}
		
		String path = "";
		if(reviewList != null) {
			path = "/WEB-INF/views/review/reviewList.jsp";
			request.setAttribute("reviewList", reviewList);
		} else {
			path = "/WEB-INF/views/common/failed.jsp";
			request.setAttribute("message", "리뷰 조회 실패!");
		}
		
		request.getRequestDispatcher(path).forward(request, response);
	}


}
