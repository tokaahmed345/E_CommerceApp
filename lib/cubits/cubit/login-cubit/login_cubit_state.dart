part of 'login_cubit.dart';

@immutable
sealed class LogInCubitState {}

final class LogInInitial extends LogInCubitState {}
final class LogInSuccessState extends LogInCubitState{final LogIn  login;

  LogInSuccessState({required this.login});}
final class LogInLoadingState extends LogInCubitState{}
final class LogInFailureState extends LogInCubitState{ final String message; 

  LogInFailureState({required this.message});}

final class TogglePasswordVissability extends LogInLoadingState{}