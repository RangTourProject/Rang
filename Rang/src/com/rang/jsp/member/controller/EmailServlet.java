package com.rang.jsp.member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rang.jsp.common.SMTPAuthenticator;
import com.rang.jsp.member.model.service.MemberService;
import com.rang.jsp.member.model.vo.Member;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet("/pwdFind.me")
public class EmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Random random = new Random();
		// 0 ~ 9999 --> + 1000 = 1000 ~ 10999
		int result = random.nextInt(10000)+1000;

		if(result>10000){
			// 만약 5자리가 되면 10999 에서 1000을 빼서 4자리로 돌려줘라.
	    	result = result - 1000;
		}
		//인증번호 4자리
		request.setCharacterEncoding("utf-8");
		
		String from = "travelrang@naver.com";
		String to = request.getParameter("email");
		String phone = request.getParameter("phone");
		String content = String.valueOf("인증번호 : " + result);
		// 입력값 받음
	 
		Properties p = new Properties(); // 정보를 담을 객체
	 
		p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
	 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP 서버에 접속하기 위한 정보들
	 
		try{
	    Authenticator auth = new SMTPAuthenticator();
	    Session ses = Session.getInstance(p, auth);
	     
//	    ses.setDebug(true);
	     
	    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
	    msg.setSubject("인증번호입니다"); // 제목
	     
	    Address fromAddr = new InternetAddress(from);
	    msg.setFrom(fromAddr); // 보내는 사람
	     
	    Address toAddr = new InternetAddress(to);
	    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
	     
	    
	    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
	     
	    Transport.send(msg); // 전송
	    
	    MemberService ms = new MemberService();
	    Member m = new Member();
	    m.setEmail(to);
	    m.setPhone(phone);
	    m.setPassword(getSHA512(String.valueOf(result)));
	    
	    ms.findPwd(m);
	    
	} catch(Exception e){
	    e.printStackTrace();
	    
//	    return;
	}
		
		response.getWriter().print(result);
	 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private static String getSHA512(String pwd) {
	      try {
	         
	         MessageDigest md = MessageDigest.getInstance("SHA-512");
	         byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
	         md.update(bytes);
	         
	         return Base64.getEncoder().encodeToString(md.digest());
	         
	      } catch (NoSuchAlgorithmException e) {
	         
	         System.out.println("암호화 에러 발생");
	         e.printStackTrace();
	         
	         return null;
	      }
	      
	}
}
