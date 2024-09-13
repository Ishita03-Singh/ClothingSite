import 'package:flutter/material.dart';

import '../Models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product image
            Image.network(
              product.imageUrl,
              height: 300,
              fit: BoxFit.cover,
            ),

            // Product name and price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 16.0),

            // Product description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                product.description,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),

            SizedBox(height: 20.0),

            // "Add to Cart" or "Buy Now" button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  
                  // Implement your action here, like adding to the cart
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.name} added to cart')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18.0),
                ),
                child: Text('Add to Cart'),
              ),
            ),

            SizedBox(height: 10.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Implement Buy Now action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Proceed to buy ${product.name}')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  // primary: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18.0),
                ),
                child: Text('Buy Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}