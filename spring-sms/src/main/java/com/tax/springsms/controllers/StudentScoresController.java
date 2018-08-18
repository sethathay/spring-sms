package com.tax.springsms.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tax.springsms.models.Course;
import com.tax.springsms.models.StudentScore;
import com.tax.springsms.services.CourseService;
import com.tax.springsms.services.ExamService;
import com.tax.springsms.services.StudentCourseService;
import com.tax.springsms.services.StudentScoreService;

@Controller
public class StudentScoresController {
	
	@Autowired
	private CourseService courseService;

	@Autowired
	private StudentCourseService stuCourseService;
	
	@Autowired
	private StudentScoreService stuScoreService;
	
	@Autowired
	private ExamService examService;

	@GetMapping("studentscores")
	public String StudentScores(HttpServletRequest req) {
		req.setAttribute("mode", "VIEW");
		req.setAttribute("courses", courseService.findAllInProgressAndFinish());
		return "studentScores";
	}
	@GetMapping("newstudentscores")
	public String NewStudentscores(@RequestParam long id,HttpServletRequest req) {
		req.setAttribute("mode","NEW");
		req.setAttribute("stuCourses", stuCourseService.findStudentByCourse(id));
		req.setAttribute("examprogram", examService.findById(id));
		return "studentScores";
	}
	@PostMapping("savestudentscore")
	public void SaveStudentScore(@ModelAttribute StudentScore stuScore,long cosID,BindingResult bindingResult, 
			HttpServletRequest req,HttpServletResponse resp) throws IOException {
		stuScoreService.save(stuScore);
//		long id=Long.parseLong(cosID);
		resp.sendRedirect("/newstudentscores?id="+cosID);
	}
	@GetMapping("liststudentresult")
	public String StudentCourseResult(@RequestParam long id,HttpServletRequest req) {
		req.setAttribute("studentPoint", courseService.findById(id));
		req.setAttribute("mode", "LIST");
		return "studentScores";
	}
}
