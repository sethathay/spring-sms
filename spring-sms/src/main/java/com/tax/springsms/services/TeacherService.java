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
	
	
	public Collection<Teacher> findAll(){
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
	
	//Optional for Java 8
	public Teacher findById(long id) {
		Optional<Teacher> tempT = tRepo.findById(id);
		return tempT.isPresent() ? tempT.get(): null;
	}
	
	public long count() {
		return tRepo.count();
	}
	

	public void delete(long id) {
		tRepo.deleteById(id);
	}
	
	public void save(Teacher teachers) {
		tRepo.save(teachers);
	}

}
