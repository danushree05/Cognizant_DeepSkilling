package Cognizant_DeepSkilling.Week1_DataStructuresAndAlgorithms_HandsOn.HandsOn_EcommerceSearchFunctionality.Code;

public class Product 
{
    int productId;
    String productName;
    String category;
    public Product(int productId, String productName, String category)
    {
        this.productId=productId;
        this.productName=productName;
        this.category=category;
    }
    public String toString()
    {
        return "["+productId+", "+productName+", "+category+"]";
    }
}