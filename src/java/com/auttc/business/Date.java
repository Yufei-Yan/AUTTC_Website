/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.auttc.business;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author cheng
 */
public class Date {
    public static String getDate() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("/MM/dd/yyyy");
        LocalDate localDate = LocalDate.now();
        return dtf.format(localDate);
    }
}
