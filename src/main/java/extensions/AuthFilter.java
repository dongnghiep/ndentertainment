package extensions;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;

public class AuthFilter implements HttpFilter {
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String uri = req.getRequestURI();
		User user = (User) req.getSession().getAttribute("user");
		String error = "";
		if (user == null) {
			error = resp.encodeURL("Vui lòng đăng nhập!");
		} else if (user.getAdmin() && uri.contains("/admin/")) {
			error = resp.encodeURL("Vui lòng đăng nhập với vai trò admin!");
		}
		if (!error.isEmpty()) {
			req.getSession().setAttribute("securi", uri);
			resp.sendRedirect("/account/sign-in?error=" + resp.encodeURL(error));
		} else {
			chain.doFilter(req, resp);
		}
	}
}
