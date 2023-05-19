package com.jspiders.onlinevotingapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jspiders.onlinevotingapp.pojo.CandidatePOJO;

@Repository
public interface CandidateRepository extends JpaRepository<CandidatePOJO, Integer>{

	CandidatePOJO findByCandidateName(String candidateName);
}
