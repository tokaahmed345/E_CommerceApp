part of 'add_to_cart_cubit.dart';

@immutable
sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}
final class AddToCartSuccess extends AddToCartState {

final Map<String,dynamic>succes;

  AddToCartSuccess( this.succes);
  
}
final class AddToCartFailure extends AddToCartState {final String message;

  AddToCartFailure({required this.message});}
final class AddToCartLoading extends AddToCartState {}
