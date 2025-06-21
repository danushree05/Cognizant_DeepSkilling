package Cognizant_DeepSkilling.Week1_DesignPrinciplesAndPatterns_HandsOn.HandsOn_FactoryMethodPattern.Code;

public class PdfDocument implements Document {
    @Override
    public void open() {
        System.out.println("Opening a PDF Document.");
    }
}