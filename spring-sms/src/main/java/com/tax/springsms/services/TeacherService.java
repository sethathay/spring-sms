package com.tax.springsms.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

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
	public Teacher findOne(long id) {
		
		Optional<Teacher> teachers = tRepo.findById(id);
		return teachers.isPresent()? teachers.get() : null;
	
	}
	
	public void delete(long id) {
		tRepo.deleteById(id);
	}

}
