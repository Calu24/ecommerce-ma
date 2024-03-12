import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_web/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));

    await Future<void>.delayed(const Duration(seconds: 5));

    emit(state.copyWith(isLoading: false));
  }
}
