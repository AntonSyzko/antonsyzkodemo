package com.gmail.antonsyzko.doctoradministrationpanel.utils;

/**
 * Created by Admin on 06.08.2016.
 */

/*
demo use
 */

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

//not really used - hardcoded at DB
public class QuickPasswordEncodingGenerator {

    /**
     * @param args
     */

    private PasswordEncoder passwordEncoder;

    public static void main(String[] args) {
        String password = "test";
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        System.out.println(passwordEncoder.encode(password));



    }



}

