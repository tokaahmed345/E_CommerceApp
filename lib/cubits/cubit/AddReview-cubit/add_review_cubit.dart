import 'package:bloc/bloc.dart';
import 'package:lazashopping/cubits/cubit/allreviewcubit/cubit/all_review_cubit.dart';
import 'package:lazashopping/model/reviewmodel/add_review_model.dart';
import 'package:lazashopping/services/reviewservices/addreviewservces.dart';
import 'package:lazashopping/services/reviewservices/allreview.dart';
import 'package:meta/meta.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit(this.reviewServce, this.allReviewCubit) : super(AddReviewInitial());
final AddReviewService reviewServce;

  final AllReviewCubit allReviewCubit;


Future<void> submitReview({
  required String id,
  required String userName,
  required String feedBack,
  required double rating,
}) async {
  try {
    emit(AddReviewLoading());
    AddReview result = await reviewServce.addReview(
      id: id,
      userName: userName,
      feedback: feedBack,
      rating: rating,
    );
    
    // تحديث قائمة المراجعات بعد نجاح الإضافة
    await allReviewCubit.fetchData(id);

    emit(AddReviewSuccess(addReview: result));
  } catch (e) {
    emit(AddReviewFailure(message: e.toString()));
  }
}

}






