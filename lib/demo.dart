class Product {
  final String name;
  final String category;
  final String image;

  // Constructor
  Product({
    required this.image,
    required this.name,
    required this.category,
  });

  // Named constructor to create an instance from a JSON object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      category: json['category'],
      image: json['image'],
    );
  }

  // Method to convert the object back to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'image': image,
    };
  }
}
