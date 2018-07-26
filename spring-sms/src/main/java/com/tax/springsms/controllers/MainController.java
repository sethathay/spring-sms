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
		//Render view index.jsp
		return "index";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(HttpServletRequest req) {
		req.setAttribute("countTeachers", tService.count());
		return "dashboard";
	}
	
	@GetMapping("/teachers")
	public String teachers(HttpServletRequest req) {
		req.setAttribute("mode", "VIEW");
		req.setAttribute("teachers", tService.findAll());
		return "teachers";
	}
	
	@GetMapping("/updateTeacher")
	public String updateTeachers(@RequestParam long id, HttpServletRequest req) {
		req.setAttribute("mode", "MODIFY");
		req.setAttribute("teacher", tService.findById(id));
		return "teachers";
	}
	
	//@GetMapping("/newTeacher")
	
	@GetMapping("/delete")
	public String deleteTeacher(@RequestParam long id,HttpServletRequest req) {
		tService.delete(id);
		req.setAttribute("teachers", tService.findAll());
		return "teachers";
	}

}
