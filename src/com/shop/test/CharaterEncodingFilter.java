package com.shop.test;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class CharaterEncodingFilter implements Filter {

	private String encoding = null;
	public void init(FilterConfig config) throws ServletException {
		System.out.println("ChangeEncodingFilter INIT");
		encoding = config.getInitParameter("encoding"); //web.xml에서 설정한 UTF-8로 설정
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("1.ChangeEncodingFilter IN");
		request.setCharacterEncoding("encoding"); //클라이언트로부터 보내온 데이터를 UTF-8로 변경
		chain.doFilter(request, response); //실제 데이터를 받아 필터링후 전송하는 부분
		System.out.println("2.ChangeEncodingFilter OUT");
	}

	public void destroy() {
		System.out.println("ChangeEncodingFilter 종료");
	}
	

}
