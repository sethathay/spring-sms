package com.tax.springsms.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tax.springsms.services.CourseService;
import com.tax.springsms.services.ExamService;

@Controller
public class ExamController {

	@Autowired
	private CourseService courseService;
	@Autowired
	private ExamService examService;
	
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
	@GetMapping("/listexamprograms")
	public String listExampPrograms(@RequestParam long id,HttpServletRequest req) {
		req.setAttribute("mode", "LIST");
		req.setAttribute("examprograms", courseService.findById(id));
		return "examprogram";
	}
	@GetMapping("/deleteexam")
	public void deleteExam(@RequestParam long id,@RequestParam long cosID,HttpServletRequest req,HttpServletResponse resp) throws IOException {
		examService.delete(id);
		resp.sendRedirect("/listexamprograms?id="+cosID);
	}

}
