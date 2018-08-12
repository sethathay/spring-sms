package com.tax.springsms.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tax.springsms.services.CourseService;
import com.tax.springsms.services.StudentCourseService;

@Controller
public class StudentAttendanceController {
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private StudentCourseService stuCourseService;
	
	
	@GetMapping("/students-att")
	public String studentAttendances(HttpServletRequest req) {
		req.setAttribute("mode", "VIEW");
		req.setAttribute("courses", courseService.findAllInProgressAndFinish());
		return "students-att";
	}
	@GetMapping("/newstudentsatt")
	public String newStudentAttendances(@RequestParam long cosID,HttpServletRequest req) {
		req.setAttribute("mode", "NEW");
		req.setAttribute("stuCourses", stuCourseService.findStudentByCourse(cosID));

		return "students-att";
	}
	@RequestMapping(path = "/liststudentatt", method = RequestMethod.GET)
	public String listStudentAttendance(@RequestParam(required=true) long id,@RequestParam long subID,HttpServletRequest req) {
		req.setAttribute("mode", "LIST");
		req.setAttribute("subjectID", subID);
		req.setAttribute("course", courseService.findById(id));
		return "students-att";
	}
}
