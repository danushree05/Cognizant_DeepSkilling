package Cognizant_DeepSkilling.Week1_DesignPrinciplesAndPatterns_HandsOn.HandsOn_SingletonPattern.Code;

public class Main {
    public static void main(String[] args) {
        // Get Logger instances
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        // Use logger
        logger1.log("Application started");
        logger2.log("An event occurred");

       
        if (logger1 == logger2) {
            System.out.println("Both logger1 and logger2 refer to the same instance.");
        } else {
            System.out.println("Different Logger instances found!");
        }
    }
}

//Why we use this 
//The constructor message Logger Initialized. is printed only once, showing that the object was created a single time
