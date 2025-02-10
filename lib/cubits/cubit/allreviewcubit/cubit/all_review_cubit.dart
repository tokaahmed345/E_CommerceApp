import 'package:bloc/bloc.dart';
import 'package:lazashopping/model/ProductDetails/iteminfo.dart';
import 'package:lazashopping/services/reviewservices/allreview.dart';
import 'package:meta/meta.dart';

part 'all_review_state.dart';

class AllReviewCubit extends Cubit<AllReviewState> {
  AllReviewCubit(this.servcesReview) : super(AllReviewInitial());
final AllReviewServces servcesReview;
 Future<void>   fetchData(String productId)async{
emit(ReviewLoading());

  try{
   final review=await AllReviewServces().getAllReview(id: productId);
emit(ReviewSuccess(review));
  }catch(e){
emit(ReviewFailure(message: e.toString()));
  }

}



}
