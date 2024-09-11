package com.sportyshoes.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/sportyshoes";
    private String jdbcUsername = "root";
    private String jdbcPassword = "BHEle270#";

    // SQL queries
    private static final String SELECT_PRODUCTS_BY_CATEGORY = "SELECT * FROM products WHERE category = ?";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM products";

    // Method to get a connection
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Method to get products by category
    public List<Product> getProductsByCategory(String category) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_CATEGORY)) {
            preparedStatement.setString(1, category);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                String description = rs.getString("description");
                boolean onSale = rs.getBoolean("onSale");
                products.add(new Product(id, name, category, price, image, description, onSale));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Method to get all products
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String category = rs.getString("category");
                double price = rs.getDouble("price");
                String image = rs.getString("image");
                String description = rs.getString("description");
                boolean onSale = rs.getBoolean("onSale");
                products.add(new Product(id, name, category, price, image, description, onSale));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
