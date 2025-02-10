import 'package:bloc/bloc.dart';
import 'package:lazashopping/model/AuthModel/forgot.dart';
import 'package:lazashopping/services/AuthServices/resetservices.dart';
import 'package:meta/meta.dart';

part 'forgot_state.dart';

class ForgotCubit extends Cubit<ForgotState> {
  ForgotCubit({required this.forgot}) : super(ForgotInitial());
  final ForgotServices forgot;

  void forgotten({required String email}) async {
    emit(ForgotLoading());
    try {
      var data = await forgot.reset(email: email);
      emit(ForgotSuccess(reset: data));
    } on Exception catch (e) {
      emit(ForgotFailure(message: "Error :${e.toString()}"));
    }
  }
}
