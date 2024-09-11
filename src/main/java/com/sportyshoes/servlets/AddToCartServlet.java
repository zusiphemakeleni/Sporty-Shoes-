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
import javax.servlet.http.HttpSession;
import com.sportyshoes.model.Product;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the product ID from the form
        int productId = Integer.parseInt(request.getParameter("productId"));

        // Retrieve the product from the database
        Product product = getProductById(productId);
        
        // Get the session and cart from the session
        HttpSession session = request.getSession();
        ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Add the product to the cart
        cart.add(product);
        session.setAttribute("cart", cart);

        // Calculate the total price
        double total = 0;
        for (Product p : cart) {
            total += p.getPrice();
        }
        session.setAttribute("total", total);

        // Redirect to the cart page
        response.sendRedirect("cart.jsp");
    }

    private Product getProductById(int productId) {
        Product product = null;
        String jdbcUrl = "jdbc:mysql://localhost:3306/sportyshoes";
        String jdbcUser = "root";
        String jdbcPassword = "BHEle270#";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
            String sql = "SELECT * FROM products WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, productId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getDouble("price"));
                product.setImage(resultSet.getString("image"));
                product.setDescription(resultSet.getString("description"));
                product.setOnSale(resultSet.getBoolean("on_sale"));
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return product;
    }
}
