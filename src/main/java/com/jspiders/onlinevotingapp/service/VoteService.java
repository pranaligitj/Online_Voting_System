package com.jspiders.onlinevotingapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspiders.onlinevotingapp.pojo.CandidatePOJO;
import com.jspiders.onlinevotingapp.pojo.VotePOJO;
import com.jspiders.onlinevotingapp.repository.VoteRepository;
import com.jspiders.onlinevotingapp.repository.CandidateRepository;

@Service
public class VoteService {

	@Autowired
	private VoteRepository repository;
	
	@Autowired
	private CandidateRepository candidateRpository;
	
	
	public VotePOJO login(int userId) {
		VotePOJO pojo = repository.findById(userId);
		return pojo;
	}
	

	public VotePOJO register(VotePOJO user) {
		VotePOJO pojo = repository.save(user);
		return pojo;
	}


	public boolean checkId(int userId) {
		boolean pojo = repository.existsById(userId);
		return pojo;
	}


	public boolean login(String username, String password) {
		boolean pojo = repository.existsByUsername(username);
		return pojo;
	}


	public boolean checkUsername(String username) {
		boolean pojo = repository.existsByUsername(username);
		return pojo;
	}


	public List<VotePOJO> saveCandidate(List<VotePOJO> userData) {
		List<VotePOJO> pojos  = repository.saveAll(userData);
		return pojos;
	}


	public List<CandidatePOJO> findCandidates() {
		List<CandidatePOJO> candidates = candidateRpository.findAll();
		return candidates;
	}
	
}
