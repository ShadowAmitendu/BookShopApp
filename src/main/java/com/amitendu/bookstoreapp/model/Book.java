package com.amitendu.bookstoreapp.model;

public class Book {
    private int id;
    private String title;
    private String author;
    private double price;
    private String category;
    private String imageUrl;

    public Book(int id, String title, String author, double price, String category, String imageUrl) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.price = price;
        this.category = category;
        this.imageUrl = imageUrl;
    }

    // Getters
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public double getPrice() { return price; }
    public String getCategory() { return category; }
    public String getImageUrl() { return imageUrl; }
}