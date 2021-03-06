package com.tax.springsms.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import com.tax.springsms.models.Student;
import com.tax.springsms.models.StudentCourse;
import com.tax.springsms.services.CourseService;
import com.tax.springsms.services.StudentCourseService;
import com.tax.springsms.services.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService stuService;
	
	@Autowired
	private CourseService cusService;
	
	@Autowired
	private StudentCourseService scService;
	
	@GetMapping("/students")
	public String students(HttpServletRequest req) {
		req.setAttribute("mode", "VIEW");
		req.setAttribute("students", stuService.findAll());
		return "students";
	}
	@GetMapping("/newstudent")
	public String addStudent(HttpServletRequest req) {
		req.setAttribute("mode", "NEW");
		return "students";
	}
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class,null,new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	}
	@GetMapping("/updatestudent")
	public String updateStudent(@RequestParam long id,HttpServletRequest req) {
		req.setAttribute("mode", "MODIFY");
		req.setAttribute("student", stuService.findById(id));
		return "students";
	}
	@PostMapping("/savestudent")
	public void saveStudent(@ModelAttribute Student student,BindingResult bindingResult,HttpServletRequest req,HttpServletResponse resp) throws IOException {
		stuService.save(student);
		req.setAttribute("students", stuService.findAll());
		req.setAttribute("mode", "VIEW");
		resp.sendRedirect("/students");
	}
	
	@GetMapping("/deletestudent")
	public void deleteStudent(@RequestParam long id,HttpServletRequest req,HttpServletResponse resp) throws IOException {
		stuService.delete(id);
		req.setAttribute("students", stuService.findAll());
		resp.sendRedirect("/students");
	}
	
	@GetMapping("/newregister")
	public String newRegister(HttpServletRequest req) {
		req.setAttribute("mode", "NEW");
		req.setAttribute("studentList",stuService.findAll());
		req.setAttribute("courseList", cusService.findAll());
		return ("registerStudent");
	}
	@PostMapping("/savesRegister")
	public void saveRegister(@ModelAttribute Student student,BindingResult bindingResult,HttpServletRequest req,HttpServletResponse resp) throws IOException {
		stuService.save(student);
		resp.sendRedirect("/registerdetails?printed=0");
	}
	@GetMapping("/registerdetails")
	public String regStudentDetails(@RequestParam Long printed,HttpServletRequest req) {
		req.setAttribute("stuRegisters",scService.findById(printed));
		return "registerDetails";
	}
}
