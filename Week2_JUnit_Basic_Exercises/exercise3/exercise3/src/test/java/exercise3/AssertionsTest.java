package exercise3;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class AssertionsTest {
    
      
    @Test
    public void testAssertions() {
        
        assertEquals("Sum of 2 + 3 must be 5", 5, 2 + 3);

        
        assertTrue("5 should be greater than 3", 5 > 3);

        
        assertFalse("5 should NOT be less than 3", 5 < 3);

        assertNull("Object should be null", null);  
             
        assertNotNull("Object should NOT be null", new Object());
    }
}
