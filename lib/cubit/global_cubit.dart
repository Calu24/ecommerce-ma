import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_web/cubit/global_state.dart';
import 'package:flutter_ecommerce_web/main.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(const GlobalState());

  void load() {
    emit(state.copyWith(isLoading: true));

    // final categories = await categoryRepository.fetchCategories();

    // print(categories);

    // await categoryRepository.createCategories();

    productRepository.streamProducts('Category 1').listen((products1) {
      productRepository.streamProducts('Category 2').listen((products2) {
        final products = products1..add(products2.first);
        emit(state.copyWith(products: products));
      });
    });

    // TODO(Lucas): cancel the stream
    // await products.cancel();
    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }

  void addOneToCart() {
    emit(state.copyWith(cartTotalQuantity: state.cartTotalQuantity + 1));
  }
}
