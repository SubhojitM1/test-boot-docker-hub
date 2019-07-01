package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class NewTestController {
	
	@GetMapping
	public String getValue() {
		return "Test me in google build";
	}
 
}
