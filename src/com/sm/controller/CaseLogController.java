package com.sm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sm.service.ICaseLogService;

@Controller
public class CaseLogController {
	@Autowired
	ICaseLogService caseLogService;
}
