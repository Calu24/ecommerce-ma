import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_web/cubit/checkout_state.dart';
import 'package:flutter_stripe_web/flutter_stripe_web.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(const CheckoutState());

  Future<void> load() async {
    // emit(state.copyWith(isLoading: true));

    // emit(state.copyWith(isLoading: false));
  }

  void setCard(CardFieldInputDetails card) {
    emit(state.copyWith(card: card));
  }

  void isLoading({required bool value}) =>
      emit(state.copyWith(isLoading: value));
}
