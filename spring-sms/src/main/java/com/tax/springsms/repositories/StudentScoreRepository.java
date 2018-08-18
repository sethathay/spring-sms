package com.tax.springsms.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.tax.springsms.models.StudentScore;

@Repository
public interface StudentScoreRepository extends CrudRepository<StudentScore, Long> {

}
