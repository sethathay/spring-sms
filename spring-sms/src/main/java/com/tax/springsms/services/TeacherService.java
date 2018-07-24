package com.tax.springsms.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tax.springsms.models.Teacher;
import com.tax.springsms.repositories.TeacherRepository;

@Service
public class TeacherService {
	
	@Autowired
	private TeacherRepository tRepo;
	
	
	public Collection<Teacher> findAllTeachers(){
		List<Teacher> teachers = new ArrayList<Teacher>();
		for(Teacher t: tRepo.findAll()) {
			teachers.add(t);
		}
		return teachers;
	}

}
