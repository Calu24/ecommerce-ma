import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    this.name,
    this.description,
    this.imageUrl,
  });
  factory Category.fromJson(Map<String, dynamic> json, {String? id}) {
    return Category(
      id: id ?? json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String? ?? 'https://picsum.photos/200',
    );
  }
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
      ];

  static const categories = [
    Category(
      id: '1',
      name: 'Headphones',
      description: 'Listen to your favorite music',
      imageUrl: 'https://picsum.photos/200',
    ),
    Category(
      id: '2',
      name: 'Smartphones',
      description: 'Get the latest smartphones',
      imageUrl: 'https://picsum.photos/200',
    ),
    Category(
      id: '3',
      name: 'Laptops',
      description: 'Get the latest laptops',
      imageUrl: 'https://picsum.photos/200',
    ),
    Category(
      id: '4',
      name: 'Cameras',
      description: 'Capture your best moments',
      imageUrl: 'https://picsum.photos/200',
    ),
    Category(
      id: '5',
      name: 'Smartwatches',
      description: 'Get the latest smartwatches',
      imageUrl: 'https://picsum.photos/200',
    ),
    Category(
      id: '6',
      name: 'Speakers',
      description: 'Enhance your audio experience',
      imageUrl: 'https://picsum.photos/200',
    ),
    Category(
      id: '7',
      name: 'Televisions',
      description: 'Upgrade your entertainment',
      imageUrl: 'https://picsum.photos/200',
    ),
    Category(
      id: '8',
      name: 'Tablets',
      description: 'Stay connected on the go',
      imageUrl: 'https://picsum.photos/200',
    ),
    Category(
      id: '9',
      name: 'Gaming Consoles',
      description: 'Immerse yourself in gaming',
      imageUrl: 'https://picsum.photos/200',
    ),
    Category(
      id: '10',
      name: 'Printers',
      description: 'Print documents with ease',
      imageUrl: 'https://picsum.photos/200',
    ),
  ];
}
