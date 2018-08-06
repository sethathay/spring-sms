package com.tax.springsms.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tax.springsms.services.CourseService;

@Controller
public class TeacherAttendanceController {
	
	@Autowired
	private CourseService courseService;
	
	@GetMapping("/teachers-att")
	public String teacherAttendances(HttpServletRequest req) {
		req.setAttribute("mode", "VIEW");
		req.setAttribute("courses", courseService.findAllInProgressAndFinish());
		return "teachers-att";
	}
	
	@GetMapping("/newteacheratt")
	public String newTeacherAttendance(@RequestParam long id, HttpServletRequest req) {
		req.setAttribute("mode", "NEW");
		req.setAttribute("course", courseService.findById(id));
		return "teachers-att";
	}
	
	@GetMapping("/listteacheratt")
	public String listTeacherAttendance(@RequestParam(required=true) long id, @RequestParam(required=false) int month,
			@RequestParam(required=false) int year, HttpServletRequest req) {
		req.setAttribute("mode", "LIST");
		if(req.getParameterMap().containsKey("month")){
			req.setAttribute("month", month);
		}
		if(req.getParameterMap().containsKey("year")){
			req.setAttribute("year", year);
		}
		req.setAttribute("course", courseService.findById(id));
		return "teachers-att";
	}

}
