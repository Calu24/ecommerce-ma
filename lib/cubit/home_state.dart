import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isLoading = false,
  });

  final bool isLoading;

  HomeState copyWith({
    bool? isLoading,
  }) =>
      HomeState(
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [
        isLoading,
      ];
}
