package Filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by chenyitian on 17-5-20.
 */
@WebFilter(filterName = "EncodingFilter")
public class EncodingFilter implements Filter {
    private String charEncoding;

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        if (!charEncoding.equals(req.getCharacterEncoding())){
            req.setCharacterEncoding(charEncoding);
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        charEncoding=config.getInitParameter("encoding");
        if (charEncoding==null){
            System.out.println("没有设置编码方法");
        }
    }

}
