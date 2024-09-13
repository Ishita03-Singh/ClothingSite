class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Method to convert JSON into a Product object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'], // assuming the id field is named '_id' in your API
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(), // convert the price to a double
      imageUrl: json['imageUrl'],
    );
  }

  // Method to convert a Product object back into JSON (optional, for creating products)
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
