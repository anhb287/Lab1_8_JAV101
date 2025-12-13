package poly.filter;

import java.io.IOException;
import java.util.Locale;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.jsp.jstl.core.Config;

@WebFilter("/*")
public class LocaleFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;

        String lang = (String) req.getSession().getAttribute("lang");
        if (lang == null) lang = "vi";

        Locale locale = new Locale(lang);
        Config.set(req, Config.FMT_LOCALE, locale);
        Config.set(req, Config.FMT_FALLBACK_LOCALE, Locale.ENGLISH);

        chain.doFilter(request, response);
    }
}

