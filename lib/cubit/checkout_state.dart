import 'package:equatable/equatable.dart';
import 'package:flutter_stripe_web/flutter_stripe_web.dart';

class CheckoutState extends Equatable {
  const CheckoutState({
    this.isLoading = false,
    this.card,
  });

  final bool isLoading;
  final CardFieldInputDetails? card;

  CheckoutState copyWith({
    bool? isLoading,
    CardFieldInputDetails? card,
  }) =>
      CheckoutState(
        isLoading: isLoading ?? this.isLoading,
        card: card ?? this.card,
      );

  @override
  List<Object?> get props => [
        isLoading,
        card,
      ];
}
