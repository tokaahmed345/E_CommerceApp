import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lazashopping/model/AuthModel/login.dart';
import 'package:lazashopping/services/AuthServices/loginservices.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';

part 'login_cubit_state.dart';

class LogIN_Cubit extends Cubit<LogInCubitState> {
  LogIN_Cubit( {required this.logserv,} ) : super(LogInInitial());

final LoginServices logserv;
void toggleVissability(){
  emit(TogglePasswordVissability());
}
void submitlogin({required String email,required String password,required bool rememberMe})async{

try {
    emit(LogInLoadingState());

LogIn ?data=await logserv.fetchInfo(email:email , password: password, rememberMe: rememberMe);
if(data!=null){
  SharedPref.saveToken(data.token!);
emit(LogInSuccessState(login: data));
}else{
emit(LogInFailureState(message: 'LogIN Failed'))
;}
} catch (e) {

emit(LogInFailureState(message: "Failed:${e.toString()}"));
}




}
}