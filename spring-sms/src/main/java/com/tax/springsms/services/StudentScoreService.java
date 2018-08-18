package com.tax.springsms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tax.springsms.models.StudentScore;
import com.tax.springsms.repositories.StudentScoreRepository;

@Service
public class StudentScoreService {
	
	@Autowired
	private StudentScoreRepository stuScoreRepo;
	
	public void save(StudentScore stuScore) {
		stuScoreRepo.save(stuScore);
	}
}
