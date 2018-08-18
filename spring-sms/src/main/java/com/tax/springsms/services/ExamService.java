package com.tax.springsms.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tax.springsms.models.Exam;
import com.tax.springsms.repositories.ExamRepository;

@Service
public class ExamService {
	@Autowired
	private ExamRepository examRepo;
	
	public void delete(long id) {
		examRepo.deleteById(id);
	}
	public Exam findById(long examID) {
		Optional<Exam> tempT = examRepo.findById(examID);
		return tempT.isPresent() ? tempT.get(): null;
	}
	public void save(Exam examObj) {
		examRepo.save(examObj);
	}
}
