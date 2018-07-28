package com.tax.springsms.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tax.springsms.models.Subject;
import com.tax.springsms.services.SubjectService;
import com.tax.springsms.services.TeacherService;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private TeacherService tService;
	
	@GetMapping("/subjects")
	public String subjects(HttpServletRequest req) {
		req.setAttribute("mode", "VIEW");
		req.setAttribute("subjects", subjectService.findAll());
		return "subjects";
	}
	
	@PostMapping("/savesubject")
	public void saveSubject(@ModelAttribute Subject sub,BindingResult bindingResult, 
			HttpServletRequest req,HttpServletResponse resp) throws IOException {
		subjectService.save(sub);
		req.setAttribute("subjects", subjectService.findAll());
		req.setAttribute("mode", "VIEW");
		resp.sendRedirect("/subjects");
	}
	
	@GetMapping("/updatesubject")
	public String updateSubject(@RequestParam long id, HttpServletRequest req) {
		req.setAttribute("mode", "MODIFY");
		req.setAttribute("teacherList", tService.findAll());
		req.setAttribute("subject", subjectService.findById(id));
		return "subjects";
	}
	
	@GetMapping("/deletesubject")
	public String deleteSubject(@RequestParam long id,HttpServletRequest req) {
		subjectService.delete(id);
		req.setAttribute("subjects", subjectService.findAll());
		return "subjects";
	}
	
	@GetMapping("/newsubject")
	public String addSubject(HttpServletRequest req) {
		req.setAttribute("teacherList", tService.findAll());
		req.setAttribute("mode", "NEW");
		return "subjects";
	}

}
