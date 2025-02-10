part of 'adding_address_cubit.dart';

@immutable
sealed class AddingAddressState {}

final class AddingAddressInitial extends AddingAddressState {}
final class AddingAddressLoading extends AddingAddressState {}
final class AddingAddressUpdated extends AddingAddressState {final String address;final String country;

  AddingAddressUpdated({required this.address, required this.country});}
final class AddingAddressFailure extends AddingAddressState {final String message;

  AddingAddressFailure({required this.message});}

