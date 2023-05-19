package com.jspiders.onlinevotingapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jspiders.onlinevotingapp.pojo.VotePOJO;

@Repository
public interface VoteRepository extends JpaRepository<VotePOJO, Integer> {

	VotePOJO findById(int userId);

	boolean existsById(int userId);
	
	boolean existsByUsername(String username);

//	CandidatePOJO findByUserId(int userId);
}
