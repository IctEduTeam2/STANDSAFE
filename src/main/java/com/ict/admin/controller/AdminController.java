package com.ict.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.admin.model.service.AdminService;
import com.ict.admin.model.vo.AdminVO;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;


	// 사용자관리
	@RequestMapping("/userManagement.do")
	public ModelAndView getUserManagement() {
		return new ModelAndView("/admin_main/manage/userManagement");
	}

	// 관리자관리
	@RequestMapping("/adminManagement.do")
	public ModelAndView getAdminManagement() {
		return new ModelAndView("/admin_main/manage/adminManagement");
	}

	// 이메일 보내기
	@RequestMapping("/emaillist.do")
	public ModelAndView getEmailList() {
		return new ModelAndView("/admin_main/manage/emaillist");
	}

	// 이메일 폼
	@RequestMapping("/emailForm.do")
	public ModelAndView getEmailForm() {
		return new ModelAndView("/admin_main/manage/emailForm");
	}

	// 이메일 폼->목록
	@RequestMapping("/emaillist_go.do")
	public ModelAndView getEmailFormBack() {
		return new ModelAndView("/admin_main/manage/emaillist");
	}

	// 이메일 리스트->세부사항
	@RequestMapping("/emailonelist_go.do")
	public ModelAndView getEmailOneList() {
		return new ModelAndView("/admin_main/manage/mailonelist");
	}

	// 관리자 등록폼
	@RequestMapping("/registmanager.do")
	public ModelAndView getRegistManager() {
		return new ModelAndView("/admin_main/manage/registmanager");
	}

	// 관리자 등록완료
	@RequestMapping("/adminManageGo.do")
	public ModelAndView getUserManageGo(AdminVO adVO) {
		ModelAndView mv = new ModelAndView("/admin_main/index");
		adVO.setADMIN_PW(passwordEncoder.encode(adVO.getADMIN_PW()));
		int result = adminService.getAdminAdd(adVO);
		if (result > 0) {
			// 성공
			return mv;
		} else {
			// 실패
			return new ModelAndView("errorPage");
		}
	}

	// 관리자 등록취소
	@RequestMapping("adminManageCancel.do")
	public ModelAndView getAdminManageCancel() {
		return new ModelAndView("/admin_main/manage/adminManagement");
	}

	// 관리자화면
	@RequestMapping("/adminlogin.do")
	public ModelAndView getLoginForm() {
		return new ModelAndView("user/adminlogin");
	}

	// 관리자로그인
	@RequestMapping("/admin_loginok.do")
	public ModelAndView getAdminLoginOk(AdminVO adVO, HttpSession session) {
		// 입력한 id의 패스워드를 DB에 가져와서 입력한 pwd와 비교해서 맞으면 성공 틀리면 실패
		// id로 DB에 저장된 pwd 가져오기
		ModelAndView mv = new ModelAndView("/admin_main/index");
		AdminVO advo = adminService.getAdminPw(adVO.getADMIN_ID());
		//System.out.println(adminService.getAdminPw(adVO.getADMIN_ID()));
		if (!passwordEncoder.matches(adVO.getADMIN_PW(), advo.getADMIN_PW())) {
			session.setAttribute("loginChk", "fail");
			System.out.println("관리자 로그인 실패");
			return mv;
		} else {
			session.setAttribute("advo", advo);
			session.setAttribute("loginChk", "ok");
			//System.out.println("LoginChk: " + session.getAttribute("loginChk"));
			System.out.println("관리자 로그인 됨");

			return mv;
		}
	}

	// 통계
	@RequestMapping("/statistics.do")
	public ModelAndView getStatistics() {
		return new ModelAndView("/admin_main/statistics");
	}

	// 상품리스트
	@RequestMapping("/product_list.do")
	public ModelAndView getProductList() {
		ModelAndView mv = new ModelAndView("/admin_main/product_list");
		return mv;
	}

	// 상품등록폼
	@RequestMapping("/product_insertform.do")
	public ModelAndView getProductInsertForm() {
		ModelAndView mv = new ModelAndView("admin_main/product_insert");
		return mv;
	}

	// 상품등록
	@RequestMapping("/product_insert.do")
	public ModelAndView getProductInsert() {
		ModelAndView mv = new ModelAndView("admin_main/product_list");
		return mv;
	}

	// 상품상세보기 미처리
	@RequestMapping("/product_detail.do")
	public ModelAndView getProductDetail() {
		ModelAndView mv = new ModelAndView("admin_main/product_detail");
		return mv;
	}

	@RequestMapping("/product_updateform.do")
	public ModelAndView getProductUpdateForm() {
		ModelAndView mv = new ModelAndView("admin_main/product_update");
		return mv;
	}

	@RequestMapping("product_update.do")
	public ModelAndView getProductUpdate() {
		ModelAndView mv = new ModelAndView("admin_main/product_list");
		return mv;
	}

	@RequestMapping("/product_delete.do")
	public ModelAndView getProductDelete() {
		ModelAndView mv = new ModelAndView("admin_main/product_delete");
		return mv;
	}

	// 재고 관리 리스트
	@RequestMapping("/inventory_management.do")
	public ModelAndView getInventoryManagementgo() {
		ModelAndView mv = new ModelAndView("admin_main/inventory_management");
		return mv;
	}

	@RequestMapping("/inventory_updateform.do")
	public ModelAndView getInventoryUpdateForm() {
		ModelAndView mv = new ModelAndView("admin_main/inventory_update");
		return mv;
	}

	@RequestMapping("/inventory_update.do")
	public ModelAndView getInventory_Update() {
		ModelAndView mv = new ModelAndView("admin_main/product_list");
		return mv;
	}

	// 반품 관리
	@RequestMapping("/return_list.do")
	public ModelAndView getInventory_Return() {
		ModelAndView mv = new ModelAndView("admin_main/return_list");
		return mv;
	}

	@RequestMapping("/return_detail.do")
	public ModelAndView getInventory() {
		ModelAndView mv = new ModelAndView("admin_main/return_detail");
		return mv;
	}

	@RequestMapping("/exchange_list.do")
	public ModelAndView getExchangeList() {
		ModelAndView mv = new ModelAndView("admin_main/exchange_list");
		return mv;
	}

	@RequestMapping("/exchange_detail.do")
	public ModelAndView getExchangeDetail() {
		ModelAndView mv = new ModelAndView("admin_main/exchange_detail");
		return mv;
	}

	@RequestMapping("/order_list.do")
	public ModelAndView getOrderList() {
		ModelAndView mv = new ModelAndView("admin_main/order_list");
		return mv;
	}

	@RequestMapping("/order_detail.do")
	public ModelAndView getOrderDetail() {
		ModelAndView mv = new ModelAndView("admin_main/order_detail");
		return mv;
	}
}
