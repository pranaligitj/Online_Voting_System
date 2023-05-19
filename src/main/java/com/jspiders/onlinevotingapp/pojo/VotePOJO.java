package com.jspiders.onlinevotingapp.pojo;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.Data;

@Entity
@Data
public class VotePOJO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	
	private String username;
	
	private String password;
	
	private String email;
	
	private long contact;
	
	private String candidateName;
	@OneToOne
	@JoinColumn(name = "candidate_id")
	private CandidatePOJO candidate;
	
	public CandidatePOJO getCandidate() {
		return candidate;
	}
	
	public void setCandidate(CandidatePOJO candidate) {
		this.candidate = candidate;
	}
}
