package com.tax.springsms.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tax.springsms.models.Exam;

@Repository
public interface ExamRepository extends CrudRepository<Exam,Long> {

}
