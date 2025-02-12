part of 'get_all_item_in_cart_cubit.dart';

@immutable
sealed class GetAllItemInCartState {}

final class GetAllItemInCartInitial extends GetAllItemInCartState {}
final class GetAllItemInCarLoading extends GetAllItemInCartState {}
final class GetAllItemInCartSuccess extends GetAllItemInCartState {

  final Map<String,dynamic>getAllItems;

  GetAllItemInCartSuccess(this.getAllItems);
  
    


}
final class GetAllItemInCartFailure extends GetAllItemInCartState {final String message;

  GetAllItemInCartFailure({required this.message});}
