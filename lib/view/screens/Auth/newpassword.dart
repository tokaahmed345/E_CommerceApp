import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/update-cubit/update_password_cubit.dart';
import 'package:lazashopping/view/screens/Auth/login.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/services/AuthServices/updateservices.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customtextfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class NewPassword_Screan extends StatelessWidget {
  const NewPassword_Screan({super.key});
  static String id = "newpassword";

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = GlobalKey();

    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    String email = "";
    email = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (context) =>
          UpdatePasswordCubit(newPassword: updatePasswordServices()),
      child: BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
        listener: (context, state) {
          if (state is UpdateSuccess) {
            print(state.update.message);
            Navigator.pushNamed(context, LoginScreen.id);
          } else if (state is UpdateFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is UpdatePasswordLoading,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: const CustomAppBar(title: ""),
              body: LayoutBuilder(
                builder: (context, constraints) {
                  // Use constraints to adapt layout
                  double screenWidth = constraints.maxWidth;
                  double screenHeight = constraints.maxHeight;

                  return Column(
                    children: [
                      Form(
                        key: globalKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Title text with adjusted font size
                            SizedBox(height: screenHeight * 0.05),
                            Text(
                              "New Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth > 600 ? 30 : 24,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.05),

                            // Password text field with responsive padding
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05),
                              child: CustomTextField(
                                controller: passwordController,
                                hintText: "New Password",
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Field is required";
                                  } else if (val.length < 6) {
                                    return "Password must be at least 6 characters";
                                  } else if (!RegExp(r'^[A-Z]').hasMatch(val)) {
                                    return "Password must start with a capital letter";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.05),

                            // Confirm password text field with responsive padding
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.05),
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

                            // Instruction text with responsive size
                            Padding(
                              padding: EdgeInsets.only(top: screenHeight * 0.1),
                              child: Text(
                                "Please write your new password",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth > 600 ? 16 : 14,
                                ),
                              ),
                            ),

                            // Reset password button with responsive padding
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.1),
                        child: BlocBuilder<UpdatePasswordCubit,
                            UpdatePasswordState>(
                          builder: (context, state) {
                            return CustomContainer(
                              text: "Reset Password",
                              onTap: () async {
                                if (globalKey.currentState!.validate()) {
                                  if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Passwords do not match")),
                                    );
                                    return;
                                  }

                                  BlocProvider.of<UpdatePasswordCubit>(context)
                                      .update(
                                    email: email,
                                    password: passwordController.text,
                                    confirmEmail:
                                        confirmPasswordController.text,
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
