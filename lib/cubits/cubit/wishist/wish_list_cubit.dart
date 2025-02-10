import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/model/WishListModel/getallwishlist.dart';
import 'package:lazashopping/services/addwishlist/addwishlist_services.dart';
import 'package:lazashopping/services/getallwishlist/getalluserwishlist.dart';
import 'package:lazashopping/services/removewishlist/removewishlist.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishlistState> {
  WishListCubit() : super(WishlistInitial());
   static WishListCubit get(context) => BlocProvider.of(context);
Future<void> loadWishlist() async {
  try {
    wishlist = await GetUserWishListServices().getAllWishList() ?? [];
    print("Wishlist Loaded: $wishlist");  // ✅ تحقق مما إذا كان يتم جلب المنتجات
    emit(WishlistLoaded(List.from(wishlist))); // تحديث الحالة
  } catch (e) {
    print("Error loading wishlist: $e");
    emit(WishlistError("❌ Error: $e"));
  }
   
}
bool isInWishlist(dynamic product) {  // ✅ دالة التحقق من وجود المنتج في المفضلة
    return wishlist.any((item) => item.id == product.id);  
  }
  List<GetAllUserWishList> wishlist = [];
Future<void> toggleWishlist(dynamic product) async {
  try {
    print("Before Update: $wishlist"); 

    final isExist = wishlist.any((item) => item.id == product.id);

    if (isExist) {
      await RemoveWishlListServices().removeWishList(
        productId: product.id!,
        name: product.name!,
        img: product.img!,
        price: product.price!,
      );
      wishlist.removeWhere((item) => item.id == product.id);
            print("After Remove: $wishlist"); // ✅ تأكيد أن العنصر اتشال

    } else {
      final response = await AddWishlListServices().addWishList(
        productId: product.id!,
        name: product.name!,
        img: product.img!,
        price: product.price!,
      );
      
      print("🔹 API Response: $response"); // ✅ طباعة رد السيرفر

      wishlist.add(GetAllUserWishList(
        id: product.id!,
        name: product.name!,
        img: product.img!,
        price: product.price!,
      ));
    }
   emit(WishlistLoading());  // ✅ حالة تحميل لإجبار إعادة البناء
await Future.delayed(Duration(milliseconds: 100)); // ✅ انتظار بسيط
emit(WishlistLoaded(List.from(wishlist)));  

    print("After Update: $wishlist"); 

  } catch (e) {
    emit(WishlistError("❌ Error: $e"));
  }
}



}
