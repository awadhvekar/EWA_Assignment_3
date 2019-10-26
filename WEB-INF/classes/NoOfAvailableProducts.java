import java.io.IOException;
import java.io.*;

public class NoOfAvailableProducts implements Serializable
{
    private String productName;
    private String productPrice;
    private String numberOfAvailableProducts;

    public NoOfAvailableProducts(String productName, String productPrice, String numberOfAvailableProducts)
    {
        this.productName = productName;
        this.productPrice = productPrice;
        this.numberOfAvailableProducts = numberOfAvailableProducts;
    }

    public String getProductName()
    {
		return productName;
	}

    public void setProductName(String productName)
    {
		this.productName = productName;
    }
    
    public String getProductPrice()
    {
		return productPrice;
	}

    public void setProductPrice(String productPrice)
    {
		this.productPrice = productPrice;
    }
    
    public String getNumberOfAvailableProducts()
    {
		return numberOfAvailableProducts;
	}

    public void setNumberOfAvailableProducts(String numberOfAvailableProducts)
    {
		this.numberOfAvailableProducts = numberOfAvailableProducts;
	}
}