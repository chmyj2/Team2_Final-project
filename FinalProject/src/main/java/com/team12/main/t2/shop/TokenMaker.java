package com.team12.main.t2.shop;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class TokenMaker {

    public static void make(HttpServletRequest request) {

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss:SS");
        String token = sdf.format(d);
        request.setAttribute("token", token);

        System.out.println(token);


    }



}
