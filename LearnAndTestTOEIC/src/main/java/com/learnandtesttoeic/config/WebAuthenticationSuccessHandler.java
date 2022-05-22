package com.learnandtesttoeic.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

@Component
public class WebAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        authorities.forEach(authority -> {
            if (authority.getAuthority().equals("ROLE_USER")) {
                try {
                    redirectStrategy.sendRedirect(request, response, "/");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (authority.getAuthority().contains("ROLE_ADMIN")) {
                try {
                    redirectStrategy.sendRedirect(request, response, "/admin");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                throw new IllegalStateException();
            }
        });

    }
}
