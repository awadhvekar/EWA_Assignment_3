import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.io.*;
import java.sql.*;

@WebServlet("/Inventory")
public class Inventory extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
        //displayInventory(request, response);
        Utilities utility = new Utilities(request, pw);

        try
        {
            if(!utility.isLoggedin())
			{
				HttpSession session = request.getSession(true);				
				session.setAttribute("login_msg", "Please Login to view Inventory.");
				response.sendRedirect("Login");
				return;
            }
            
            HttpSession session=request.getSession(); 	
			utility.printHtml("Header.html");
            utility.printHtml("LeftNavigationBar.html");

            pw.print("<div id='content'><div class='post'><h2 class='title meta'>");
			pw.print("<a style='font-size: 24px;'>Inventory</a>");
            pw.print("</h2><div class='entry'>");
            
            pw.print("<h4>Count of Available Products</h4>");
            pw.print("<table class='gridtable gridtableFull gridDataTable' id='tblInventoryNoOfProducts'>");
            pw.print("<thead><tr><td>Sr No</td>");
            pw.print("<td>Product Name</td>");
            pw.print("<td>Product Price</td>");
            pw.print("<td>Number of Products (available in store)</td>");
            pw.print("</tr></thead><tbody>");

            //HashMap<String, ArrayList<NoOfAvailableProducts>> availableProductsList = new HashMap<String, ArrayList<NoOfAvailableProducts>>();
            ArrayList <NoOfAvailableProducts> availableProductsList = new ArrayList <NoOfAvailableProducts> ();
            availableProductsList = MySqlDataStoreUtilities.availableProductsList();
            int i = 1;
            for(NoOfAvailableProducts product : availableProductsList)
            {
                pw.print("<tr>");
                pw.print("<td>"+i+"</td><td>"+product.getProductName()+"</td><td>"+product.getProductPrice()+"</td><td>"+product.getNumberOfAvailableProducts()+"</td></tr>");
                i++;
            }

            pw.print("</tbody></table>");
            /*
            pw.print("<table class='gridtable gridtableFull gridDataTable' id='tblInventoryNoOfProducts2'>");
            pw.print("<thead><tr><td>Sr No</td>");
            pw.print("<td>Product Name</td>");
            pw.print("<td>Product Price</td>");
            pw.print("<td>Number of Products (available in store)</td>");
            pw.print("</tr></thead><tbody>");
                    


            pw.print("</tbody></table>");
            */
            
            pw.print("</div></div></div>"); //</h2></div></div></div>
            utility.printHtml("Footer.html");
        }
        catch(Exception e)
        {

        }
    }

    /*
    protected void displayInventory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
        Utilities utility = new Utilities(request, pw);
        
        utility.printHtml("Footer.html");
    }
    */
}