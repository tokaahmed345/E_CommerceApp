part of 'all_review_cubit.dart';

@immutable
sealed class AllReviewState {}

final class AllReviewInitial extends AllReviewState {}
final class ReviewLoading extends AllReviewState {}
final class ReviewSuccess extends AllReviewState {

  final List<Review>reviews;

  ReviewSuccess(this.reviews);
}
final class ReviewFailure extends AllReviewState {final String message;

  ReviewFailure({required this.message});}

