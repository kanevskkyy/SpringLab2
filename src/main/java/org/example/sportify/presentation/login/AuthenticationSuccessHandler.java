package org.example.sportify.presentation.login;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import jakarta.servlet.ServletException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import java.io.IOException;
import java.util.Set;

@Component
public class AuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());

        if (roles.contains("ROLE_ADMIN")) getRedirectStrategy().sendRedirect(request, response, "/admin/dashboard");
        else if (roles.contains("ROLE_USER")) getRedirectStrategy().sendRedirect(request, response, "/music");
        else super.onAuthenticationSuccess(request, response, authentication);
    }
}
