package com.ict.statistics.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ict.statistics.model.service.PostService;
import com.ict.statistics.model.vo.PostVO;

@Controller
public class PostController {
	@Autowired
	private PostService postService;

	@RequestMapping("/top10")
	public ResponseEntity<List<PostVO>> getTop10Posts(@RequestParam(required = false) String category
) {
		List<PostVO> posts;

		switch (category) {
		case "all":
			posts = postService.getAllTop10();
			break;
		case "qna":
			posts = postService.getQATop10();
			break;
		case "review":
			posts = postService.getReviewTop10();
			break;
		case "report":
			posts = postService.getReportTop10();
			break;
		default:
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity<>(posts, HttpStatus.OK);
	}
}