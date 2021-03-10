package com.spring.w3m.user.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.w3m.user.common.UserVO;

@Controller
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void memberInsert(UserVO vo) {
		sqlSessionTemplate.insert("UserDAO.insertUser",vo);
		System.out.println("회원가입 정보 입력");
		
	}
}
