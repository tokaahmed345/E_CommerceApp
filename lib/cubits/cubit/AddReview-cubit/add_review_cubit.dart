import 'package:bloc/bloc.dart';
import 'package:lazashopping/model/reviewmodel/add_review_model.dart';
import 'package:lazashopping/services/reviewservices/addreviewservces.dart';
import 'package:meta/meta.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit(this.reviewServce) : super(AddReviewInitial());
final AddReviewService reviewServce;

Future <void> submitReview({required String id,required String userName,required String feedBack,required double rating })async{
try{
emit(AddReviewLoading());
AddReview result=  await reviewServce.addReview(id: id, userName: userName, feedback: feedBack, rating: rating);
emit(AddReviewSuccess(addReview: result));
}catch(e){
  emit(AddReviewFailure(message: e.toString()));


}




}





}
