package com.jspiders.onlinevotingapp.pojo;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class CandidatePOJO {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int candidateId;
	
	private String candidateName;
	
	private int voteCount;
	
	private Set<String> voters;
	
	public CandidatePOJO (String candidateName) {
		this.candidateName = candidateName;
		this.voteCount = 0;
		this.voters = new HashSet<>();
	}
	public int getcandidateId() {
		return candidateId;
	}
	
	public String getCandidateName() {
		return candidateName;
	}
	
	public int getVoteCount() {
		return voteCount;
	}
	
	public void incrementVoteCount() {
		voteCount++;
	}
}
