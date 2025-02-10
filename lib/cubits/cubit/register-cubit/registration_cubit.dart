import 'package:bloc/bloc.dart';
import 'package:lazashopping/model/AuthModel/register.dart';
import 'package:lazashopping/services/AuthServices/register.dart';
import 'package:meta/meta.dart';
part 'registration_state.dart';
class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit( {required this .registered} ) : super(RegistrationLoading());
final RegisterServices registered;
void submitRegistration({required String userName,required String email,required String password,required bool remember})async{


try {
Register data=   await registered.register(name: userName, email: email, password: password, rememberMe: remember);
  

emit(RegistrationSuccess(register: data)) ;  

    
} on Exception catch (e) {
emit(RegistrationFailure(message: "Failed: ${e.toString()}"));

}


}




}
