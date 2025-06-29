package com.example;

import org.junit.Test;
import org.junit.Assert;


public class StudentTest {
     @Test
    public void testScholarshipEligibility() {
        Student student1 = new Student("S1001", "Alice", 3.8);
        Student student2 = new Student("S1002", "Bob", 3.2);

       
        Assert.assertTrue("Student with GPA 3.8 should be eligible", student1.isEligibleForScholarship());

        
        Assert.assertFalse("Student with GPA 3.2 should NOT be eligible", student2.isEligibleForScholarship());
    }
}
