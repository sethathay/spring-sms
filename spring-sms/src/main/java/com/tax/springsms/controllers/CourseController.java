package com.tax.springsms.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tax.springsms.models.Course;
import com.tax.springsms.models.CourseSubject;
import com.tax.springsms.services.CourseService;
import com.tax.springsms.services.SubjectService;

@Controller
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private SubjectService subjectService;
	
	@GetMapping("/courses")
	public String teachers(HttpServletRequest req) {
		req.setAttribute("mode", "VIEW");
		req.setAttribute("courses", courseService.findAll());
		return "courses";
	}
	
	@PostMapping("/savecourse")
	public void saveSubject(@ModelAttribute Course courses, BindingResult bindingResult, 
			HttpServletRequest req,HttpServletResponse resp) throws IOException {
		courseService.save(courses);
		req.setAttribute("courses", courseService.findAll());
		req.setAttribute("mode", "VIEW");
		resp.sendRedirect("/courses");
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class,null,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
	
	@GetMapping("/updatecourse")
	public String updateCourse(@RequestParam long id, HttpServletRequest req) {
		req.setAttribute("mode", "MODIFY");
		req.setAttribute("subjectList", subjectService.findAll());
		req.setAttribute("course", courseService.findById(id));
		return "courses";
	}
	
	@GetMapping("/newcourse")
	public String addCourse(HttpServletRequest req) {
		req.setAttribute("subjectList", subjectService.findAll());
		req.setAttribute("mode", "NEW");
		return "courses";
	}

}
