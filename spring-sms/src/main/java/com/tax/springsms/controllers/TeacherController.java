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

import com.tax.springsms.models.Teacher;
import com.tax.springsms.services.TeacherService;

@Controller
public class TeacherController {
	
	@Autowired
	private TeacherService tService;
	
	@GetMapping("/teachers")
	public String teachers(HttpServletRequest req) {
		req.setAttribute("mode", "VIEW");
		req.setAttribute("teachers", tService.findAll());
		return "teachers";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class,null,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
	
	@PostMapping("/saveteacher")
	public void saveTeacher(@ModelAttribute Teacher teacher,BindingResult bindingResult,HttpServletRequest req,HttpServletResponse resp) throws IOException {
		tService.save(teacher);
		req.setAttribute("teachers", tService.findAll());
		req.setAttribute("mode", "VIEW");
		resp.sendRedirect("/teachers");
	}
	
	@GetMapping("/updateteacher")
	public String updateTeachers(@RequestParam long id, HttpServletRequest req) {
		req.setAttribute("mode", "MODIFY");
		req.setAttribute("teacher", tService.findById(id));
		return "teachers";
	}
	
	@GetMapping("/deleteteacher")
	public String deleteTeacher(@RequestParam long id,HttpServletRequest req) {
		tService.delete(id);
		req.setAttribute("teachers", tService.findAll());
		return "teachers";
	}
	
	@GetMapping("/newteacher")
	public String addTeacher(HttpServletRequest req) {
		req.setAttribute("mode", "NEW");
		return "teachers";
	}

}
