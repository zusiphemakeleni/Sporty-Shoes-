package com.sportyshoes.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sportyshoes.model.Product;

@WebServlet("/women")
public class WomenProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Product> womenProducts = new ArrayList<>();

        // Database connection details
        String jdbcUrl = "jdbc:mysql://localhost:3306/sportyshoes";
        String jdbcUser = "root";
        String jdbcPassword = "BHEle270#";

        try {
            // Load the database driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get a connection to the database
            Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

            // Create a SQL query to fetch all women's products
            String sql = "SELECT * FROM products WHERE category = 'Women'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            // Process the result set
            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setImage(resultSet.getString("image"));
                product.setDescription(resultSet.getString("description"));
                product.setOnSale(resultSet.getBoolean("on_sale"));
                womenProducts.add(product);
            }

            // Close the connections
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the products as a request attribute
        request.setAttribute("womenProducts", womenProducts);

        // Forward to the women JSP page
        request.getRequestDispatcher("women.jsp").forward(request, response);
    }
}

