package org.numismat.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainWebController {
   
	@GetMapping(value = {"/","/index"})
    public String index(Model model) {
        return "index";
    }

	@RequestMapping("/login")
    public String getLogin(@RequestParam(value = "error", required = false) String error,
                           Model model) {
        model.addAttribute("error", error != null);
        return "login";
    }
}