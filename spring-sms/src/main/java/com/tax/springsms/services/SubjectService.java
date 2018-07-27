package com.tax.springsms.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tax.springsms.models.Subject;
import com.tax.springsms.repositories.SubjectRepository;

@Service
public class SubjectService {
	
	@Autowired
	private SubjectRepository subjectRepo;
	
	
	public Collection<Subject> findAll(){
		List<Subject> teachers = new ArrayList<Subject>();
		for(Subject stud: subjectRepo.findAll()) {
			teachers.add(stud);
		}
		return teachers;
	}
	
	//Optional for Java 8
	public Subject findById(long id) {
		Optional<Subject> tempT = subjectRepo.findById(id);
		return tempT.isPresent() ? tempT.get(): null;
	}
	
	public long count() {
		return subjectRepo.count();
	}
	

	public void delete(long id) {
		subjectRepo.deleteById(id);
	}

}
