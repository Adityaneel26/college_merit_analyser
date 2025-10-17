package com.mycompany.mavenproject2;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author HV
 */

// This is a simple "JavaBean" or "POJO"
// Its only job is to hold the data for one row from our database table.
public class College {

    // Fields to match the columns in your 'colleges' table
    private String instituteName;
    private String instType;
    private String branch;
    private String quota;
    private String admissionCategory;
    private double ddcetMarksOpen;
    private int ddcetRankOpen;
    private double ddcetMarksClose;
    private int ddcetRankClose;

    // Getters and Setters for each field.
    // These allow the servlet to put data in and the JSP to get data out.
    public String getInstituteName() {
        return instituteName;
    }

    public void setInstituteName(String instituteName) {
        this.instituteName = instituteName;
    }

    public String getInstType() {
        return instType;
    }

    public void setInstType(String instType) {
        this.instType = instType;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getQuota() {
        return quota;
    }

    public void setQuota(String quota) {
        this.quota = quota;
    }

    public String getAdmissionCategory() {
        return admissionCategory;
    }

    public void setAdmissionCategory(String admissionCategory) {
        this.admissionCategory = admissionCategory;
    }

    public double getDdcetMarksOpen() {
        return ddcetMarksOpen;
    }

    public void setDdcetMarksOpen(double ddcetMarksOpen) {
        this.ddcetMarksOpen = ddcetMarksOpen;
    }

    public int getDdcetRankOpen() {
        return ddcetRankOpen;
    }

    public void setDdcetRankOpen(int ddcetRankOpen) {
        this.ddcetRankOpen = ddcetRankOpen;
    }

    public double getDdcetMarksClose() {
        return ddcetMarksClose;
    }

    public void setDdcetMarksClose(double ddcetMarksClose) {
        this.ddcetMarksClose = ddcetMarksClose;
    }

    public int getDdcetRankClose() {
        return ddcetRankClose;
    }

    public void setDdcetRankClose(int ddcetRankClose) {
        this.ddcetRankClose = ddcetRankClose;
    }
}