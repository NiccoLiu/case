package com.sm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sm.service.ITemplateService;

@Controller
public class TemplateController {
	@Autowired
	ITemplateService templateService;
}
