package com.tax.springsms.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tax.springsms.models.Student;
import com.tax.springsms.repositories.StudentRepository;

@Service
public class StudentService {
	
	@Autowired
	private StudentRepository studentRepo;
	
	
	public Collection<Student> findAll(){
		List<Student> teachers = new ArrayList<Student>();
		for(Student stud: studentRepo.findAll()) {
			teachers.add(stud);
		}
		return teachers;
	}
	
	//Optional for Java 8
	public Student findById(long id) {
		Optional<Student> tempT = studentRepo.findById(id);
		return tempT.isPresent() ? tempT.get(): null;
	}
	
	public long count() {
		return studentRepo.count();
	}
	

	public void delete(long id) {
		studentRepo.deleteById(id);
	}

}
