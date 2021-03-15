package com.spring.w3m.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.w3m.inquiry.user.service.InquiryService;
import com.spring.w3m.inquiry.user.vo.InquiryVO;
import com.spring.w3m.notice.admin.service.NoticeService;
import com.spring.w3m.notice.admin.vo.NoticeVO;

@Controller
public class HomeController {
//header 부분

	@Autowired
	private InquiryService inquiryService;
	
	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/login.do")
	public String login() {

		return "login/login";
	}

	@RequestMapping("/insertMember.do")
	public String memberinsert() {

		return "login/insertMember";
	}

	@RequestMapping("/searchID.do")
	public String searchID() {

		return "login/searchID";
	}

	// 공지사항
	@RequestMapping("/notice.do")
	public String notification(NoticeVO vo, Model model) {
		System.out.println("---공지사항---");
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "list/notice";
	}

	// 문의사항
	@RequestMapping("/inquiry.do")
	public String getBoardList(InquiryVO vo, Model model) {
		System.out.println("---문의사항---");
		model.addAttribute("inquiryList", inquiryService.getInquiryList(vo));
		return "list/inquiry";
	}


}
