package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.SessionService;

import jakarta.validation.Valid;



@Controller
public class LoginController {
	@Autowired
	AccountDAO accountDAO;
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("/login.html")
	public String login(Model model) {
		model.addAttribute("user", sessionService.getAttribute("user"));
		return "login";
	}
	@PostMapping("/login.html")
	public String login1(Model model, @RequestParam String username, @RequestParam String password) {
		try {
			Account user = accountDAO.findById(username).get();	
			if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Invalid password");
			}
			else {
				sessionService.setAttribute("user", user); 
				String uri = (String) sessionService.getAttribute("security-uri");
				model.addAttribute("message", "Login succeed");
//				if (uri != null) {
//					return "redirect:" + uri;
//				} 
//				else {
//					model.addAttribute("message", "Login succeed");
//				}
			}
		} catch (Exception e) {
			model.addAttribute("message", "Invalid username");
		}
		return "login";
	}
	
	@GetMapping("/logout.html")
	public String logout() {
		sessionService.removeAttribute("user");
		sessionService.removeAttribute("security-uri");
		return "redirect:/login.html";
	}
	
	
	@RequestMapping("/admin.html")
	public String admin() {
		Account user = sessionService.getAttribute("user");
		if(!user.getAdmin()) {			
			String error="Khong du quyen truy cap ";
			return "redirect:/login.html?error="+error;
		}
		return "admin";
	}
	@RequestMapping("/register.html")
	public String register() {
		
		return "register";
	}
	
	
	@PostMapping("/register.html")
	public String register1(Model model,
			@RequestParam String username, 
			@RequestParam String password,
			@RequestParam String fullname, 
			@RequestParam String email
			) {
		if (!accountDAO.findById(username).isEmpty()) {
			model.addAttribute("error", "Vui lòng đặt tên username khác!");
		} else {
			Account user = new Account();
			user.setUsername(username);
			user.setPassword(password);
			user.setFullname(fullname);
			user.setEmail(email);
			user.setActivated(true);
			user.setAdmin(false);
			accountDAO.save(user);
			model.addAttribute("message", "Đăng kí thành công");
		}
		return "register";
	}
	
}
