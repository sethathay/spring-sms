package com.tax.springsms.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tax.springsms.services.CourseService;

@Controller
public class ExamController {

	@Autowired
	private CourseService courseService;
	
	@GetMapping("/exampreparations")
	public String examPrepareations(HttpServletRequest req) {
		req.setAttribute("mode", "VIEW");
		req.setAttribute("courses", courseService.findAllInProgressAndFinish());
		return "examprogram";
	}
	
	@GetMapping("/newexamprograms")
	public String newExamPrograms(@RequestParam long id,HttpServletRequest req) {
		req.setAttribute("mode", "NEW");
		req.setAttribute("exam_course", courseService.findById(id));
		
		return "examprogram";
	}
}
