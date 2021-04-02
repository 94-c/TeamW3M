package com.spring.w3m.order.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.w3m.order.user.dao.OrderDAO;
import com.spring.w3m.order.user.vo.OrderVO;
import com.spring.w3m.order.user.vo.PayVO;
@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO dao;
	
	@Override
	public int order_inser_prod(OrderVO vo) {
		
		return dao.order_inser_prod(vo);
		
	}

	@Override
	public List<OrderVO> order_List(String user_id) {
		
		return dao.order_List(user_id);
	}

	@Override
	public void order_drop_List(String user_id) {
		dao.order_drop_List(user_id);
		
	}

	@Override
	public int Check_Point(String user_id) {
	
		return dao.Check_Point(user_id);
	}

	@Override
	public int insert_order_list(String user_id) {
		
		return dao.insert_order_list(user_id);
	}

	@Override
	public int orderNum(String user_id) {
		
		return dao.orderNum(user_id);
	}

	@Override
	public int insert_pay(PayVO payvo) {
		
		return dao.insert_pay(payvo);
	}

	@Override
	public int insert_delivery(OrderVO vo) {
		
		return dao.insert_delivery(vo);
	}

	@Override
	public int update_order_prod(String user_id) {
		
		return dao.update_order_prod(user_id);
	}

	@Override
	public int update_order_list_status(String user_id) {
		
		return dao.update_order_list_status(user_id);
	}

	@Override
	public int delete_cart(String user_id) {
		
		return dao.delete_cart(user_id);
	}

}
