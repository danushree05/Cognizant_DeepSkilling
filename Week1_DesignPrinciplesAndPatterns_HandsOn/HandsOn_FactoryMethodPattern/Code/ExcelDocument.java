package Cognizant_DeepSkilling.Week1_DesignPrinciplesAndPatterns_HandsOn.HandsOn_FactoryMethodPattern.Code;

public class ExcelDocument implements Document {
    @Override
    public void open() {
        System.out.println("Opening an Excel Document.");
    }
}