package com.jspiders.onlinevotingapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.jspiders.onlinevotingapp.pojo.CandidatePOJO;
import com.jspiders.onlinevotingapp.pojo.VotePOJO;
import com.jspiders.onlinevotingapp.service.VoteService;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@ComponentScan(basePackages = {"com.jspiders.onlinevotingapp"})
public class VoteController {
	
	private List<CandidatePOJO> candidates = new ArrayList<>();
	
	
	@Autowired
	private VoteService service;
	
	
	@GetMapping("/home")
	public String home() {
		return "Home";
	}
	
	
	@GetMapping("/login")
	public String login(@SessionAttribute(name = "login", required = false)
    VotePOJO login,ModelMap map) {
		
		return "LoginPage";
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request, @RequestParam String username,
			@RequestParam String password, ModelMap map) {
		boolean isAdmin = username.equals("admin") && password.equals("admin");
		boolean isLoggedIn = service.login(username, password);
		
		if (isAdmin) {
				HttpSession session = request.getSession();
				session.setAttribute("login", true);
				session.setMaxInactiveInterval(30);
				map.addAttribute("candidates", candidates);
				return "VoteCounts";
		}
		else if(isLoggedIn) {
			HttpSession session = request.getSession();
			session.setAttribute("login", true);
			session.setMaxInactiveInterval(30);
			return "VotingPage";
			
		} else {
			map.addAttribute("msg", "You have not registerd yet plz register first..!!");
			return "LoginPage";
		}
	}
	
	
	@GetMapping("/register")
	public String register(ModelMap map){
//		if (login == null) {
//			map.addAttribute("msg", "Please login to proceed..!!");
//			return "LoginPage";
//		}
		return "RegisterPage";
	}
	
	@PostMapping("/register")
	public String register(@SessionAttribute(name = "login", required = false)
    VotePOJO login,@ModelAttribute VotePOJO user, ModelMap map) {
		
//		

		boolean f = service.checkUsername(user.getUsername());
			
			if(f) {
				map.addAttribute("msg", "The user already exists..!!");
			}
			else {
				VotePOJO pojo = service.register(user);
				
				if(pojo!=null) {
			    
				map.addAttribute("msg", "You have Registerd Successfully now login to proceed");
				return "LoginPage";
			}
		}
		return "RegisterPage";
	}
	
	
	
	@PostMapping("/saveCandidate")
	public String saveCandidate(@SessionAttribute(name = "login", required = false)
    VotePOJO login, @RequestBody List<VotePOJO> userData, ModelMap map) {
//		if (login == null) {
//			map.addAttribute("msg", "Please login to proceed..!!");
//			return "LoginPage";
//		}
		List<VotePOJO> pojos = service.saveCandidate(userData);
		if (pojos!=null) {
			map.addAttribute("msg", "Data Saved");
			return "AdminHome";
		}
		return "AdminHome";
	}
	

	@PostConstruct
	public void init() {
		candidates = new ArrayList<>();
		
		candidates.add(new CandidatePOJO("candidate1"));
		candidates.add(new CandidatePOJO("candidate2"));
		candidates.add(new CandidatePOJO("candidate3"));
		candidates.add(new CandidatePOJO("candidate4"));
	}
	
	@GetMapping("/submitVote")
	public String showVotePage(ModelMap map, HttpServletRequest request) {
//		if (login == null) {
//			map.addAttribute("msg", "Please login to proceed..!!");
//			return "LoginPage";
//		}
		map.addAttribute("candidates", candidates);
		map.addAttribute("vote", new VotePOJO());
		
		return "VotingPage";
		
	}
	
	@PostMapping("/submitVote")
	public String submitVote(@ModelAttribute("vote") VotePOJO vote, HttpServletRequest request, ModelMap map) {
//		if (login == null) {
//			map.addAttribute("msg", "Please login to proceed..!!");
//			return "LoginPage";
//		}
		String username = vote.getUsername();
		String candidateName = vote.getCandidateName();
		
		if (request.getSession().getAttribute("hasVoted")!= null) {
			map.addAttribute("msg", "You Have Already Voted..!!");
			return "alreadyVoted";
		}
		
		for (CandidatePOJO candidate : candidates) {
			if (candidate.getCandidateName().equals(vote.getCandidateName())) {
				candidate.incrementVoteCount();
				break;
			}
		}
		request.getSession().setAttribute("hasVoted", true);
		
		
		for (CandidatePOJO candidate : candidates) {
			if (candidate.getCandidateName().equals(candidateName)) {
				candidate.incrementVoteCount();
				candidate.getVoters().add(username);
				break;
			}
		}
		
		return "VotingPage";
	}
	
	@GetMapping("/voteCounts")
	public String showVoteCounts(@SessionAttribute(name = "login", required = false)
    VotePOJO login,ModelMap map) {
		if (login == null || !login.getUsername().equals("admin") || !login.getPassword().equals("admin")) {
			map.addAttribute("msg", "You have not authorized to access this page.");
			return "LoginPage";
		}
		map.addAttribute("candidates", candidates);
		
		return "VoteCounts";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, ModelMap map) {
		session.invalidate();
		map.addAttribute("msg", "Successfully loged out..!!");
		return "LoginPage";
	}
	

}
