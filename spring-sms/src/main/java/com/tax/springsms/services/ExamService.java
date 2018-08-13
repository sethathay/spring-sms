package com.tax.springsms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tax.springsms.repositories.ExamRepository;

@Service
public class ExamService {
	@Autowired
	private ExamRepository examRepo;
	
	public void delete(long id) {
		examRepo.deleteById(id);
	}
}
