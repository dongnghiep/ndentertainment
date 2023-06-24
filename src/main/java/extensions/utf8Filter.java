package extensions;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
@WebFilter(urlPatterns = "/*", dispatcherTypes = DispatcherType.REQUEST)
public class utf8Filter implements Filter{
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		chain.doFilter(req, resp);
	}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		Filter.super.init(filterConfig);
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		Filter.super.destroy();
	}
}
