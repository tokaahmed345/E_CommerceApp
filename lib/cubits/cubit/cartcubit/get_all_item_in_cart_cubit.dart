import 'package:bloc/bloc.dart';
import 'package:lazashopping/services/cartServices/getallservices.dart';
import 'package:meta/meta.dart';

part 'get_all_item_in_cart_state.dart';

class GetAllItemInCartCubit extends Cubit<GetAllItemInCartState> {
  GetAllItemInCartCubit(  { required this.getAllItemsServices }) : super(GetAllItemInCartInitial());
final GetAllItemInCartServices getAllItemsServices;

Future<void>getAllItemsInCart()async{
emit(GetAllItemInCarLoading());

try{

final result=  await GetAllItemInCartServices().getAllItemInCart();
emit(GetAllItemInCartSuccess(result));
}catch(e){
emit(GetAllItemInCartFailure(message: "${e.toString()}"));


}







}




}
