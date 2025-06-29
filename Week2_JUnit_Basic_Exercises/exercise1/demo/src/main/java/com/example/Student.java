package com.example;
public class Student {
    private String id;
    private String name;
    private double gpa;

    public Student(String id, String name, double gpa) {
        this.id = id;
        this.name = name;
        this.gpa = gpa;
    }

    // Getters
    public String getId() { return id; }
    public String getName() { return name; }
    public double getGpa() { return gpa; }

    
    public boolean isEligibleForScholarship() {
        return gpa >= 3.5;
    }
}
