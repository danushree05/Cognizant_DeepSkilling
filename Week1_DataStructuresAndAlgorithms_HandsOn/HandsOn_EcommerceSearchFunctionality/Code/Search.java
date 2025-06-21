package Cognizant_DeepSkilling.Week1_DataStructuresAndAlgorithms_HandsOn.HandsOn_EcommerceSearchFunctionality.Code;

public class Search {

    public static Product linearSearch(Product[] products, String targetName) 
    {
        for (Product product : products)
        {
            if (product.productName.equalsIgnoreCase(targetName)) 
            {
                return product;
            }
        }
        return null;
     }
     public static Product binarySearch(Product[] products, String targetName)
      {
        int left = 0;
        int right = products.length - 1;

        while (left<=right)
         {
            int mid=left+(right-left)/2;
            int compare=products[mid].productName.compareToIgnoreCase(targetName);

            if (compare==0)
            {
                return products[mid];
            } 
            else if (compare < 0) 
            {
                left=mid+1;
            }
            else
            {
                right=mid-1;
            }
        }
        return null;
    }
}




