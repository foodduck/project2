package com.shop.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.shop.biz.QnaDAO;
import com.shop.model.DBConn;
import com.shop.model.QnaVO;

public class UnitTest2 {
	private static QnaDAO dao;
	private static QnaVO vo;
	private Connection con =null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {		//1
		dao = new QnaDAO();
		System.out.println("DAO 생성 성공");
	}

	@Before
	public void setUp() throws Exception {	//2
		vo = new QnaVO();
		System.out.println("VO 생성 성공");
	}

	@After
	public void tearDown() throws Exception {	//5
		DBConn.close(rs, stmt, con);
		System.out.println("DB 닫기 성공");
	}

	@Test
	public void test1() {			//3 - voTest
		String Tit = "VO에 대한 JUnit Test";
		vo.setTit(Tit);
		System.out.println(vo.getTit());
		System.out.println("VO TEST 성공");
	}
	
	@Test
	public void test2() {		//4
		ArrayList<QnaVO> QnaList = dao.getQnaList();		//Ctrl
		for(int i=0;i<QnaList.size();i++) {		//jsp 파일
			vo = QnaList.get(i);
			System.out.println(vo.getTit());
		}	
	}
}
