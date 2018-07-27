package com.tax.springsms.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tax.springsms.models.Subject;

@Repository
public interface SubjectRepository extends CrudRepository<Subject, Long> {
	
}
