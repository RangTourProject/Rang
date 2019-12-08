package com.rang.jsp.member.encrypt;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter({"*.me"})
public class EncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 인코딩
		request.setCharacterEncoding("utf-8");
		
		// 서블릿이 동작하기 전 실행 내용
		HttpServletRequest req = (HttpServletRequest)request;
		
		System.out.println("암호화 전 비밀번호 : " + req.getParameter("password"));
		
		EncryptWrapper lw = new EncryptWrapper(req); // LoginWrapper 클래스 생성
		
		chain.doFilter(lw, response);
		
		// 서블릿이 동작한 뒤 실행 내용 
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
