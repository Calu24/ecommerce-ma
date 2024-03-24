import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_web/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final homePageController = PageController();

  Future<void> load() async {
    // emit(state.copyWith(isLoading: true));

    // emit(state.copyWith(isLoading: false));
  }

  void changePage(int index) {
    homePageController.animateTo(
      index * 1000.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
