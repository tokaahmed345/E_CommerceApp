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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double fontSize = screenWidth < 400 ? 24.0 : 30.0;
    double padding = screenWidth < 400 ? 13.0 : 15.0;

    return BlocProvider(
      create: (context) => ForgotCubit(forgot: ForgotServices()),
      child: BlocConsumer<ForgotCubit, ForgotState>(
        listener: (context, state) {
          if (state is ForgotSuccess) {
            print(state.reset.message);
            Navigator.pushNamed(context, VerificationCode.id, arguments: emailController.text);
          } else if (state is ForgotFailure) {
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
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: screenHeight * 0.01), 
                          Text(
                            "Forgot Password",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Image.asset("assets/images/IMG.png"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextField(
                              hintText: "Enter your Email",
                              controller: emailController,
                              validator: (email) {
                                if (email == null || email.isEmpty) {
                                  return "Please enter your email.";
                                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                                  return "Please enter a valid email address.";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.2), // Adjust top padding dynamically
                            child: Text(
                              "Please write your email to receive a \nconfirmation code to set a new password.",
                              style: TextStyle(color: Colors.grey, fontSize: 21),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomContainer(
                        text: "Confirm Mail",
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            print("*****");
                            BlocProvider.of<ForgotCubit>(context).forgotten(email: emailController.text);
                          }
                        },
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
