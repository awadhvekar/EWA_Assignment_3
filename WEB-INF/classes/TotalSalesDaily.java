import java.io.IOException;
import java.io.*;

public class TotalSalesDaily implements Serializable
{
    private String orderDate;
    private String totalDailySales;

    public TotalSalesDaily(String orderDate, String totalDailySales)
    {
        this.orderDate = orderDate;
        this.totalDailySales = totalDailySales;
    }

    public String getOrderDate()
    {
		return orderDate;
    }

    public void setOrderDate(String orderDate)
    {
		this.orderDate = orderDate;
    }
    
    public String getTotalDailySales()
    {
		return totalDailySales;
    }

    public void setTotalDailySales(String totalDailySales)
    {
		this.totalDailySales = totalDailySales;
    }
}