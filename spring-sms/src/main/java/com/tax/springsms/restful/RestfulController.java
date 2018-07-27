package com.tax.springsms.restful;


import java.util.Collection;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tax.springsms.models.Subject;
import com.tax.springsms.models.Teacher;
import com.tax.springsms.services.TeacherService;
import com.tax.springsms.services.SubjectService;

@RestController
public class RestfulController {

	@Autowired
	private TeacherService tService;
	@Autowired
	private SubjectService subService;
	
	@GetMapping("/api/teachers")
	public Collection<Teacher> getAllTeachers(){
		return tService.findAll();
	}
	
	@GetMapping("/api/subjects")
	public Collection<Subject> getAllSubjects(){
//		return subService.findById(1).getTeachers();
		return subService.findAll();
	}
	
	@GetMapping("/api/delete")
	public void deleteTeacher(@RequestParam long id) {
		tService.delete(id);
		
	}

}
