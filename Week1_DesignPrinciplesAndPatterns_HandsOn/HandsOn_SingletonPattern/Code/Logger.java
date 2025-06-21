package Cognizant_DeepSkilling.Week1_DesignPrinciplesAndPatterns_HandsOn.HandsOn_SingletonPattern.Code;

public class Logger {
    private static Logger instance;
    private Logger()
    {
        System.out.println("Logger Initialized.");
    }
    public static Logger getInstance()
    {
        if (instance==null)
         {
            instance = new Logger(); 
        }
        return instance;
    }
    public void log(String message)
    {
        System.out.println("Log Message: " + message);
    }
    
}
//steps which i did
// Step 1: I createed a private static instance of the Logger class
// Step 2: I made the constructor private so no other class can instantiate it
// Step 3: I Provide a public static method to return the single instance
// Method to simulate logging
