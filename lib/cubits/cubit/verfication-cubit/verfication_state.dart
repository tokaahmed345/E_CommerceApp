part of 'verfication_cubit.dart';

@immutable
sealed class VerficationState {}

final class VerficationInitial extends VerficationState {}
final class VerficationLoading extends VerficationState {}

final class VerficationSuccess extends VerficationState { 
 final Verfication verfy;

  VerficationSuccess({required this.verfy});}
final class VerficationFailure extends VerficationState {final String message;

  VerficationFailure({required this.message});}