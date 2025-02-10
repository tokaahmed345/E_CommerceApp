part of 'wish_list_cubit.dart';


abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<GetAllUserWishList> wishlist;
  WishlistLoaded(this.wishlist);
}

class WishlistError extends WishlistState {
  final String error;
  WishlistError(this.error);
}