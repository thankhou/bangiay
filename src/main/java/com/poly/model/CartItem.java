package com.poly.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
	private int productId;
	private String brand;
	private String name;
	private int quantity;
	private double price;
	private String image;
}
