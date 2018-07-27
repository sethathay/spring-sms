package com.tax.springsms.controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.tax.springsms.services.TeacherService;
import com.tax.springsms.services.StudentService;
import com.tax.springsms.services.SubjectService;

@Controller
public class MainController {
	
	@Autowired
	private TeacherService tService;
	@Autowired
	private StudentService stuService;
	@Autowired
	private SubjectService subService;
	
	
	@GetMapping("/")
	public String init(HttpServletRequest req) {
		//Render view index.jsp
		return "index";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(HttpServletRequest req) {
		req.setAttribute("countTeachers", tService.count());
		req.setAttribute("countStudents", stuService.count());
		req.setAttribute("countSubjects", subService.count());
		return "dashboard";
	}
	
}
