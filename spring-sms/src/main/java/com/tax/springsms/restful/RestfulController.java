package com.tax.springsms.restful;


import java.util.Collection;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tax.springsms.models.Course;
import com.tax.springsms.models.Student;
import com.tax.springsms.models.Subject;
import com.tax.springsms.models.Teacher;
import com.tax.springsms.services.TeacherService;
import com.tax.springsms.services.CourseService;
import com.tax.springsms.services.StudentService;
import com.tax.springsms.services.SubjectService;

@RestController
public class RestfulController {

	@Autowired
	private TeacherService tService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private SubjectService subService;
	
	@Autowired
	private StudentService stuService;
	
	@GetMapping("/api/teachers")
	public Collection<Teacher> getAllTeachers(){
		return tService.findAll();
	}
	
	@GetMapping("/api/courses")
	public Collection<Course> getAllCourses(){
//		return subService.findById(1).getTeachers();
		return courseService.findAll();
	}
	
	@GetMapping("/api/subject/teacher")
	public Collection<Teacher> teacherOfASubject(@RequestParam long id) {
		return subService.findById(id).getTeachers();
	}
	
	@GetMapping("/api/students")
	public Collection<Student> getAllStudents() {
		return stuService.findAll();
	}

}
