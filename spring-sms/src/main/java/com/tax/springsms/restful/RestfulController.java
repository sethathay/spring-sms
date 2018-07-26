package com.tax.springsms.restful;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tax.springsms.models.Teacher;
import com.tax.springsms.services.TeacherService;

@RestController
public class RestfulController {

	@Autowired
	private TeacherService tService;
	
	@GetMapping("/api/teachers")
	public Collection<Teacher> getAllTeachers(){
		return tService.findAll();
	}
	
	@GetMapping("/api/delete")
	public void deleteTeacher(@RequestParam long id) {
		tService.delete(id);
		
	}

}
