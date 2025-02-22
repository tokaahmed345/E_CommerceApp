part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}
final class PaymentSuccess extends PaymentState {
      String paymentUrl ;

  PaymentSuccess(this.paymentUrl);


}
final class PaymentFailure extends PaymentState  {final String message;

  PaymentFailure({required this.message});}
final class PaymentLoading extends PaymentState {}
