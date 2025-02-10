part of 'forgot_cubit.dart';

@immutable
sealed class ForgotState {}

final class ForgotInitial extends ForgotState {}
final class ForgotLoading extends ForgotState {}


final class ForgotSuccess extends ForgotState {
  final ForgotPassword reset;

  ForgotSuccess( {required this.reset});}
final class ForgotFailure extends ForgotState {final String message;

  ForgotFailure({required this.message});}
