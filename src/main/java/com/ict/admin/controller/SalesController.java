package com.ict.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SalesController {

    @GetMapping("/api/sales/data")
    @ResponseBody
    public SalesData getSalesData() {
    	// 여기서는 일반적으로 데이터베이스 또는 서비스에서 데이터를 가져옵니다.
    	// 이 예를 들어 설명하기가 어렵습니다.
        
        SalesData salesData = new SalesData();

        // 세 개의 항목이 있는 첫 번째 차트에 대한 표본 데이터
        salesData.items = new String[] {"Item1", "Item2", "Item3"};
        salesData.values = new int[] {5, 10, 15};

        return salesData;
    }

    @GetMapping("/admin/statistics")
    public String displaySalesPage() {
        return "admin/statistics";
    }

 // API 응답을 위한 중첩 DTO 클래스
    public static class SalesData {
        public String[] items;
        public int[] values;
    }
}