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

import com.tax.springsms.models.CourseSubject;
import com.tax.springsms.models.Exam;
import com.tax.springsms.services.CourseService;
import com.tax.springsms.services.ExamService;

@Controller
public class ExamController {

	@Autowired
	private CourseService courseService;
	@Autowired
	private ExamService examService;
	
	@GetMapping("/exampreparations")
	public String examPrepareations(HttpServletRequest req) {
		req.setAttribute("mode", "VIEW");
		req.setAttribute("courses", courseService.findAllInProgressAndFinish());
		return "examprogram";
	}
	
	@GetMapping("/newexamprograms")
	public String newExamPrograms(@RequestParam long id,HttpServletRequest req) {
		req.setAttribute("mode", "NEW");
		req.setAttribute("exam_course", courseService.findById(id));
		
		return "examprogram";
	}
	@GetMapping("/listexamprograms")
	public String listExampPrograms(@RequestParam long id,HttpServletRequest req) {
		req.setAttribute("mode", "LIST");
		req.setAttribute("examprograms", courseService.findById(id));
		return "examprogram";
	}
	@GetMapping("/deleteexam")
	public void deleteExam(@RequestParam long id,@RequestParam long cosID,HttpServletRequest req,HttpServletResponse resp) throws IOException {
		examService.delete(id);
		resp.sendRedirect("/listexamprograms?id="+cosID);
	}
	@GetMapping("/updateexam")
	public String UpdateExampPrograms(@RequestParam long id,@RequestParam long examID,HttpServletRequest req) {
		req.setAttribute("mode", "MODIFY");
		req.setAttribute("exam_course", courseService.findById(id));
		req.setAttribute("exam",examService.findById(examID));
		return "examprogram";
	}
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class,null,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
	@PostMapping("/saveupdateexam")
	public void saveUpdateExam(@ModelAttribute CourseSubject cs, BindingResult bindingResult, 
			HttpServletRequest req,HttpServletResponse resp) throws IOException {
		examService.save(cs.getExam().get(0));
		req.setAttribute("mode", "LIST");
		resp.sendRedirect("/exampreparations");
	}

}
