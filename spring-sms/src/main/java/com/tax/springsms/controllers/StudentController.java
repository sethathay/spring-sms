package com.tax.springsms.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.tax.springsms.services.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService stuService;
	
	@GetMapping("/students")
	public String students(HttpServletRequest req) {
		req.setAttribute("mode", "VIEW");
		req.setAttribute("students", stuService.findAll());
		return "students";
	}

}
