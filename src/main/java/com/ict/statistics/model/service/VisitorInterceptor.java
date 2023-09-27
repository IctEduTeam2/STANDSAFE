package com.ict.statistics.model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class VisitorInterceptor implements HandlerInterceptor {

    @Autowired
    private VisitorService visitorService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String ID = (String) request.getSession().getAttribute("ID");
        if (ID != null) {
            visitorService.recordVisit(ID);
        }
        return true;
    }
}
