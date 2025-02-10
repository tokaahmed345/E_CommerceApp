part of 'add_review_cubit.dart';

@immutable
sealed class AddReviewState {}

final class AddReviewInitial extends AddReviewState {}
final class AddReviewSuccess extends AddReviewState {
  final  AddReview addReview;

  AddReviewSuccess({required this.addReview});
}
final class AddReviewFailure extends AddReviewState {final String message;

  AddReviewFailure({required this.message});

}
final class AddReviewLoading extends AddReviewState {}
