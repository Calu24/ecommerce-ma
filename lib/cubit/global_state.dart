import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_web/models/product.dart';

class GlobalState extends Equatable {
  const GlobalState({
    this.isLoading = false,
    this.products = const [],
    this.cartTotalQuantity = 0,
  });

  final bool isLoading;
  final List<Product?> products;
  final int cartTotalQuantity;

  GlobalState copyWith({
    bool? isLoading,
    List<Product?>? products,
    int? cartTotalQuantity,
  }) =>
      GlobalState(
        isLoading: isLoading ?? this.isLoading,
        products: products ?? this.products,
        cartTotalQuantity: cartTotalQuantity ?? this.cartTotalQuantity,
      );

  @override
  List<Object> get props => [
        isLoading,
        products,
        cartTotalQuantity,
      ];
}
