part of 'update_password_cubit.dart';

@immutable
sealed class UpdatePasswordState {}

final class UpdatePasswordInitial extends UpdatePasswordState {}
final class UpdateSuccess extends  UpdatePasswordState {final UpdatePassword update ;

  UpdateSuccess({required this.update});}
final class UpdateFailure extends UpdatePasswordState {final String message;

  UpdateFailure({required this.message});}
  final class UpdatePasswordLoading extends UpdatePasswordState {}
