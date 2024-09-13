
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
        itemCount: 5, // Number of items in cart
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Product Name'),
            subtitle: Text('\$20'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                // Remove from cart functionality
              },
            ),
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          // Proceed to checkout
        },
        child: Text('Checkout'),
      ),
    );
  }
}
