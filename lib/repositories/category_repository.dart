import 'package:db_client/db_client.dart';
import 'package:flutter_ecommerce_web/models/category.dart';

class CategoryRepository {
  const CategoryRepository({required this.dbClient});

  final DbClient dbClient;

  Future<List<Category>> fetchCategories() async {
    try {
      final categories = await dbClient.fetchAll(collection: 'categories');
      return categories
          .map((category) => Category.fromJson(category.data, id: category.id))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  // Future<void> createCategories() async {
  //   try {
  //     for (final category in Category.categories) {
  //       await dbClient.add(
  //         collection: 'categories',
  //         data: {
  //           'name': category.name,
  //           'description': category.description,
  //           'imageUrl': category.imageUrl,
  //         },
  //       );
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to create categories: $e');
  //   }
  // }
}
