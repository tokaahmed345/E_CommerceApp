import 'package:bloc/bloc.dart';
import 'package:lazashopping/model/AuthModel/updatepassword.dart';
import 'package:lazashopping/services/AuthServices/updateservices.dart';
import 'package:meta/meta.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit({required this.newPassword}) : super(UpdatePasswordInitial());


final  updatePasswordServices newPassword;

void update({required String email,required String password,required String confirmEmail})async{
try {

 UpdatePassword updateData=   await newPassword.reset(email: email, password: password, confirmEmail: confirmEmail);
  emit(UpdateSuccess(update: updateData));
} on Exception catch (e) {

emit(UpdateFailure(message: "Error :${e.toString()}"));

}





}





  
}
