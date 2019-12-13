package org.awing.controller;

import org.awing.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class StudentRequestController {
    @Autowired
    private StudentService mStudentService;

    @RequestMapping("/reqAddStudent")
    public String reqAddStudent(ModelMap modelMap) {
        modelMap.addAttribute("reqAddStudent", 1);
        return "editStudent";
    }
}
