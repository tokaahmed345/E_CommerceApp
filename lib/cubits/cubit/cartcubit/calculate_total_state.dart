part of 'calculate_total_cubit.dart';

@immutable
sealed class CalculateTotalState {}

final class CalculateTotalInitial extends CalculateTotalState {}
final class CalculateTotalSuccess extends CalculateTotalState {

  final double subtotal;
  final double total;
  CalculateTotalSuccess(this.subtotal, this.total); 

}
