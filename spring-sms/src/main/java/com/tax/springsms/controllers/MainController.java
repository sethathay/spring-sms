package com.tax.springsms.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tax.springsms.services.TeacherService;

@Controller
public class MainController {
	
	@Autowired
	private TeacherService tService;
	
	@GetMapping("/")
	public String init(HttpServletRequest req) {
		//req.setAttribute("teachers", tService.findAllTeachers());
		//Render view index.jsp
		return "index";
	}
	
	@GetMapping("/dashboard")
	public String dashboard() {
		return "dashboard";
	}
	
	@GetMapping("/teachers")
	public String teachers(HttpServletRequest req) {
		req.setAttribute("teachers", tService.findAllTeachers());
		return "teachers";
	}
	@GetMapping("/delete")
	public String deleteTeacher(@RequestParam long id,HttpServletRequest req) {
		tService.delete(id);
		req.setAttribute("teachers", tService.findAllTeachers());
		return "teachers";
	}

}
