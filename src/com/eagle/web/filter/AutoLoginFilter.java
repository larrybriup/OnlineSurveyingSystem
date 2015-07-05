package com.eagle.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AutoLoginFilter implements Filter{

	public void destroy() {
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)resp;
		Cookie[] cookies = request.getCookies();
		String name=null;
		String password=null;
		if (cookies!=null) {
			for(Cookie c:cookies){
				String cName=c.getName();
				String cValue=c.getValue();
				if("name".equals(cName)){
					name=cValue;
				}
				if("password".equals(cName)){
					password=cValue;
				}
			}
		}
		HttpSession session = request.getSession();
		String autoCode=(String) session.getAttribute("authCode");
		if(name!=null&&password!=null){
			String action="suLoginAction?name="+name+"&password="+password+
					"&autoCode="+autoCode;
			response.sendRedirect(action);
		}else{
			chain.doFilter(req, resp);
		}

	}

	public void init(FilterConfig conf) throws ServletException {
		
	}

}
