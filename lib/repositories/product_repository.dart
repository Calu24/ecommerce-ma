import 'package:db_client/db_client.dart';
import 'package:flutter_ecommerce_web/models/product.dart';

class ProductRepository {
  const ProductRepository({required this.dbClient});
  final DbClient dbClient;

  Stream<List<Product>> streamProducts(String categoryId) {
    final productStream = dbClient.streamAllByField(
      collection: 'products',
      field: 'categoryId',
      value: categoryId,
    );

    return productStream.map(
      (records) => records
          .map((record) => Product.fromJson(record.data, id: record.id))
          .toList(),
    );
  }

  Future<void> createProducts() async {
    try {
      for (final product in Product.products) {
        await dbClient.add(
          collection: 'products',
          data: {
            'name': product.name,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'categoryId': product.category,
            'stock': product.stock,
          },
        );
      }
    } catch (e) {
      throw Exception('Failed to create products: $e');
    }
  }
}
