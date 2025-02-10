import 'package:bloc/bloc.dart';
import 'package:lazashopping/cubits/cubit/cartcubit/get_all_item_in_cart_cubit.dart';
import 'package:lazashopping/services/cartServices/add_to_cart.dart';
import 'package:lazashopping/services/cartServices/getallservices.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit( {required this.addServices,required this.getAllItemInCartServices,}) : super(AddToCartInitial());
final AddToCartServices addServices;
final GetAllItemInCartServices getAllItemInCartServices;
 Future< void> addingToCart({    required String productId,
    required String productName,
    required String productImg,
    required double price,})async{
try {
  emit(AddToCartLoading());
        final response = await GetAllItemInCartServices().getAllItemInCart();
        List<dynamic> itemInCart = response["Items"] ?? [];
        bool isProductInCart =
            itemInCart.any((item) => item["ProductId"] == productId);
        if (isProductInCart) {
         
          emit(AddToCartFailure(message: "product already exist"));

        } else {
          final addResponse = await AddToCartServices().addToCart(
            ProductId: productId ?? "",
            ProductName:productName ?? "",
            ProductImg: productImg ?? "",
            Price: price ?? 0.0,
            quantity: 1,
          );
emit(AddToCartSuccess(addResponse));
        }
      } catch (e) {
        emit(AddToCartFailure(message: "Failed to add item in Cart ${e.toString()}"));
      }

}




}
