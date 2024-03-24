import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json, {String? id}) {
    return Product(
      id: id ?? json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?) as double? ?? 0.0,
      imageUrl: json['imageUrl'] as String? ?? 'https://picsum.photos/200',
      category: json['category'] as String? ?? '',
      stock: json['stock'] as int? ?? 0,
    );
  }

  final String id;
  final String name;
  final String? description;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        category,
        stock,
      ];

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    int? stock,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      stock: stock ?? this.stock,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'stock': stock,
    };
  }

  static const products = [
    Product(
      id: '1',
      name: 'Product 1',
      description: 'Description 1',
      price: 9.99,
      imageUrl: 'https://picsum.photos/200',
      category: 'Category 1',
      stock: 10,
    ),
    Product(
      id: '2',
      name: 'Product 2',
      description: 'Description 2',
      price: 19.99,
      imageUrl: 'https://picsum.photos/200',
      category: 'Category 2',
      stock: 5,
    ),
    Product(
      id: '3',
      name: 'Product 3',
      description: 'Description 3',
      price: 29.99,
      imageUrl: 'https://picsum.photos/200',
      category: 'Category 3',
      stock: 3,
    ),
    Product(
      id: '4',
      name: 'Product 4',
      description: 'Description 4',
      price: 39.99,
      imageUrl: 'https://picsum.photos/200',
      category: 'Category 4',
      stock: 7,
    ),
    Product(
      id: '5',
      name: 'Product 5',
      description: 'Description 5',
      price: 49.99,
      imageUrl: 'https://picsum.photos/200',
      category: 'Category 5',
      stock: 2,
    ),
  ];
}
