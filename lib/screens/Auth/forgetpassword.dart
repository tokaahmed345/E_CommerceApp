import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/forgot-cubit/forgot_cubit.dart';
import 'package:lazashopping/screens/Auth/verification%20_code.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/services/AuthServices/resetservices.dart';
import 'package:lazashopping/widgets/customappbar.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customtextfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    super.key,
  });
  static String id = "ForgetPassword";

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotCubit(forgot: ForgotServices()),
      child: BlocConsumer<ForgotCubit, ForgotState>(
        listener: (context, state) {
if(state is ForgotSuccess){
  print(state.reset.message);
  Navigator.pushNamed(context, VerificationCode.id,arguments:emailController.text);



}else if(state is ForgotFailure){
print(state.message);
}

        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is ForgotLoading,
            child: Scaffold(
                          resizeToAvoidBottomInset: false,
            
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: const CustomAppBar(title: "",),
              body: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Image(image: AssetImage("assets/images/IMG.png")),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        hintText: "Enter your Email",
                        controller: emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Text(
                        "Please write your email to receive a \n confirmation code to set a new password.",
                        style: TextStyle(color: Colors.grey, fontSize: 21),
                      ),
                    ),
                    CustomContainer(
                      text: "Confirm Mail",
                      onTap: () {
            if(formKey.currentState!.validate()){
              print("*****");
              BlocProvider.of<ForgotCubit>(context).forgotten(email:emailController.text);
            
            }
            
            
            
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


