package exercise4;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CalculatorTest
{
    
    private Calculator calculator;
    @Before
    public void setUp() {
        System.out.println("Setting up Calculator instance...");
        calculator = new Calculator();
    }
    @After
    public void tearDown() {
        System.out.println("Cleaning up after test...");
        calculator = null; 
    }
    @Test
    public void testAddition() {
        int a = 10;
        int b = 5;

        int result = calculator.add(a, b);

        assertEquals("10+5 should be 15", 15, result);
    }

    @Test
    public void testSubtraction() {

        int a = 10;
        int b = 4;

        int result = calculator.subtract(a, b);

        assertEquals("10-4 should be 6", 6, result);
    }

}
