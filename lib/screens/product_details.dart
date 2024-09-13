import 'package:flutter/material.dart';
import '../Api/api_product.dart';
import '../Models/product.dart';
import '../strings/asset_path.dart';
import 'productDetails_screen.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    // products = fetchProducts(); // Fetch the products when the page loads
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text('Product List')),
  //     body: FutureBuilder<List<Product>>(
  //       future: products,
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Center(child: CircularProgressIndicator());
  //         } else if (snapshot.hasError) {
  //           return Center(child: Text('Error: ${snapshot.error}'));
  //         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //           return Center(child: Text('No products available'));
  //         }

  //         // Display the products in a grid view
  //         return GridView.builder(
  //           itemCount: snapshot.data!.length,
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  //           itemBuilder: (context, index) {
  //             final product = snapshot.data![index];
  //             return Card(
  //               child: Column(
  //                 children: [
  //                   Image.network(product.imageUrl), // Display product image
  //                   Text(product.name),
  //                   Text('\$${product.price.toStringAsFixed(2)}'),
  //                 ],
  //               ),
  //             );
  //           },
  //         );
  //       },
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-60,
      child:  GridView.builder(
        itemCount: 10, // Number of products (fetch from API later)
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
           Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProductDetailPage(
      product: Product(
        name: 'Cool T-shirt',
        description: 'A stylish t-shirt made of 100% cotton.',
        price: 29.99,
        imageUrl: 'https://your-image-url.com/tshirt.jpg', id: '',
      ),
    ),
  ),
);
            },
            child: Card(
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: Image.asset(AssetPath.product)), // Replace with actual image URL
                  Card(color: Colors.greenAccent,
                    child: const Column(children: [
                    Text('Product Name'),
                    Text('\$20'), // Replace with product price
                    ],),
                  )
                 
                ],
              ),
            ),
          );
        },
      
          )
    );
   
  }
  
}
