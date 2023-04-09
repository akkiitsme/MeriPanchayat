package com.circular;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.user.UserBean;

@Controller
public class CircularController {

	@Autowired
	CircularDao circularDao;
	@Autowired
	CircularService circularService;

	@RequestMapping(value = { "/addcircular" })
	public String addCircular(@ModelAttribute("circular") CircularBean circularBean,Model model) {
		UserBean login = (UserBean)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", login);
		model.addAttribute("dashboard",1);
		return "addCircular";
	}

	@RequestMapping(value = { "/insertcircular" }, consumes = { "multipart/form-data" })
	public String insertCircular(@ModelAttribute("circular") CircularBean circularBean,
			@RequestParam("pdfFile") MultipartFile pdfFile) {
		System.out.println("circularBean :" + circularBean);
		if (!pdfFile.isEmpty()) {
			try {
				File filepath = new File("src/main/resources/static/documents/"+circularBean.getCircularNo()+".pdf");
				System.out.println("filePath: "+filepath);
				OutputStream outStream = new FileOutputStream(filepath);
				outStream.write(pdfFile.getBytes());
				outStream.close();
				circularBean.setFile(circularBean.getCircularNo() + ".pdf");
				circularService.insertCircular(circularBean);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:viewcircular";
	}

	@RequestMapping(value = { "/deletecircular/{circularId}" })
	public String deleteCircular(@PathVariable("circularId") int circularId) {
		System.out.println("circularId :" + circularId);
		circularService.deleteCircular(circularId);
		return "redirect:/viewcircular";
	}

	@RequestMapping(value = { "/viewcircular" })
	public String circularList(Model model) {
		UserBean login = (UserBean)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", login);
		model.addAttribute("dashboard",1);
		model.addAttribute("circularList", circularService.getAllCircularList());
		return "viewCircular";
	}

}
