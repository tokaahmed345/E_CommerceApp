import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'adding_address_state.dart';

class AddingAddressCubit extends Cubit<AddingAddressState> {
  AddingAddressCubit() : super(AddingAddressInitial());


Future<void>updateAddress({required String country,required String address})async{
  emit(AddingAddressLoading());


try{
 emit(AddingAddressUpdated(country: country,address: address)); 
}catch(e){
emit(AddingAddressFailure(message: e.toString()));
}
}


}
