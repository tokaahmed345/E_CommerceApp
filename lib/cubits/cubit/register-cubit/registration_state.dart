part of 'registration_cubit.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}
final class RegistrationSuccess extends RegistrationState { final Register register;

  RegistrationSuccess({required this.register});}
final class RegistrationFailure extends RegistrationState {final  String message;

  RegistrationFailure({required this.message});}
final class RegistrationLoading extends RegistrationState {}
