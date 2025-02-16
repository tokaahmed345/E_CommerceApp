import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/update-cubit/update_password_cubit.dart';
import 'package:lazashopping/screens/Auth/login.dart';

import 'package:lazashopping/services/AuthServices/updateservices.dart';
import 'package:lazashopping/widgets/customappbar.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customtextfield.dart';

class NewPassword_Screan extends StatefulWidget {
  const NewPassword_Screan({super.key});
  static String id = "newpassword";

  @override
  State<NewPassword_Screan> createState() => _NewPassword_ScreanState();
}

class _NewPassword_ScreanState extends State<NewPassword_Screan> {
  GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String email = "";

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (context) => UpdatePasswordCubit(newPassword:updatePasswordServices() ),
      child: BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
        listener: (context, state) {
          if (state is UpdateSuccess) {
            print(state.update.message);
            Navigator.pushNamed(context, LoginScreen.id);
          } else if (state is UpdateFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is UpdatePasswordLoading) {
            Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          return Scaffold(
                        resizeToAvoidBottomInset: false,

            backgroundColor:Theme.of(context).scaffoldBackgroundColor,
            appBar: CustomAppbar(title: ""),
            body: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      controller: passwordController,
                      hintText: "New Password",
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Field is required";
                        } else if (val.length < 6) {
                          return "Password must be at least 6 characters";
                        }else if (!RegExp(r'^[A-Z]').hasMatch(val)) {
    return "Password must start with a capital letter";
  }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      controller: confirmPasswordController,
                      hintText: "Confirm Password",
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Field is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 140.0),
                    child: Text(
                      "Please write your new password",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  BlocBuilder<UpdatePasswordCubit, UpdatePasswordState>(
                    builder: (context, state) {
                      return CustomContainer(
                        text: "Reset Password",
                        onTap: () async {
                          if (globalKey.currentState!.validate()) {
 if (passwordController.text != confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Passwords do not match")),
                              );
                              return;
                            }

BlocProvider.of<UpdatePasswordCubit>(context).update(email: email, password: passwordController.text, confirmEmail: confirmPasswordController.text);

                           
                          }
                        },
                      );
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
