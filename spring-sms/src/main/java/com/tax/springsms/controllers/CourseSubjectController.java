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
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.tax.springsms.models.CourseSubject;
import com.tax.springsms.services.CourseSubjectService;

@Controller
public class CourseSubjectController {
	
	@Autowired
	private CourseSubjectService csService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class,null,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
	
	@PostMapping("/saveattendance")
	public void saveAttendance(@ModelAttribute CourseSubject cs, BindingResult bindingResult, 
			HttpServletRequest req,HttpServletResponse resp) throws IOException {
		csService.save(cs);
		req.setAttribute("mode", "VIEW");
		resp.sendRedirect("/teachers-att");
	}

}
