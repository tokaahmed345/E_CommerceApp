import 'package:bloc/bloc.dart';
import 'package:lazashopping/model/AuthModel/verfication.dart';
import 'package:lazashopping/screens/Auth/verification%20_code.dart';
import 'package:lazashopping/services/AuthServices/verficationservices.dart';
import 'package:meta/meta.dart';

part 'verfication_state.dart';

class VerficationCubit extends Cubit<VerficationState> {
  VerficationCubit({required this.verified}) : super(VerficationInitial());


final  VerficationServices verified;

void Verfy({required String email,required String code})async{
  emit(VerficationLoading());
try {

var data= await verified.Verfy(email: email,code: code);
  emit(VerficationSuccess(verfy:data));
} on Exception catch (e) {

emit(VerficationFailure(message: "Error :${e.toString()}"));

}





}

}
