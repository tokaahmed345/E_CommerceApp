import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/component/clipper.dart';
import 'package:lazashopping/cubits/cubit/login-cubit/login_cubit.dart';
import 'package:lazashopping/cubits/cubit/register-cubit/registration_cubit.dart';
import 'package:lazashopping/model/AuthModel/login.dart';
import 'package:lazashopping/screens/Auth/login.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/services/AuthServices/register.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';
import 'package:lazashopping/widgets/customappbar.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customtextfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static String id = "Signup";

  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
      GlobalKey<FormState> globalKey = GlobalKey();
  RegisterServices reg = RegisterServices();
  bool isShow = false;
  bool remember = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController UserNameController = TextEditingController();

    return BlocProvider(
      create: (context) => RegistrationCubit(registered: RegisterServices()),
      child: BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            SharedPref.saveUsername(UserNameController.text);
            print(state.register.message);
            Navigator.pushNamed(context, LoginScreen.id);
          } else if (state is RegistrationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is RegistrationLoading) {
            Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset:  false,
            appBar: CustomAppBar(title: ""),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Column(
              children: [
                Form(
                  key: globalKey,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(  horizontal: MediaQuery.of(context).size.width * 0.05,  // Responsive horizontal padding
                vertical: MediaQuery.of(context).size.height * 0.05,  ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.1,  // Responsive font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        
                        // User Name Section
                        Text(
                          "UserName",
                          style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.width * 0.05),
                        ),
                        CustomTextField(
                          controller: UserNameController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Field is required";
                            } else
                              return null;
                          },
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                        
                        // Email Address Section
                        Text(
                          "Email Address",
                          style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.width * 0.05),
                        ),
                        CustomTextField(
                          controller: emailController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Field is required";
                            } else
                              return null;
                          },
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                        
                        // Password Section
                        Text(
                          "Password",
                          style: TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.width * 0.05),
                        ),
                        Stack(
                          children: [
                            CustomTextField(
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Field is required";
                                } else if (val.length < 6) {
                                  return "Password must be at least 6 characters";
                                }
                                return null;
                              },
                              controller: passwordController,
                              maxLength: 10,
                              obscureText: !isShow,
                              onTap: () {
                                setState(() {
                                  isShow = !isShow;
                                });
                              },
                              icon: isShow ? Icons.visibility : Icons.visibility_off,
                            ),
                            isShow
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: ClipPath(
                                        clipper: MyClipper(),
                                        child: Container(
                                          height: 50,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 205, 98, 255),
                                          ),
                                          padding: const EdgeInsets.only(left: 10),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            passwordController.text,
                                            style: TextStyle(color: Colors.black, fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                        
                        // Remember Me Section
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Remember me",
                                style: TextStyle(
                                  color: Theme.of(context).appBarTheme.titleTextStyle!.color,
                                  fontSize: MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              Switch(
                                activeColor: Colors.green,
                                value: remember,
                                onChanged: (val) {
                                  setState(() {
                                    remember = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                                        
                        // Submit Button Section
                    
                      ],
                    ),
                  ),
                ),
Spacer(),
                  CustomContainer(
                          text: "Sign Up",
                          onTap: () {
                            if (globalKey.currentState!.validate()) {
                              BlocProvider.of<RegistrationCubit>(context).submitRegistration(
                                userName: UserNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                remember: remember,
                              );
                            }
                          },
                        ),
              ],
            ),
          );
        },
      ),
    );
  }
}


