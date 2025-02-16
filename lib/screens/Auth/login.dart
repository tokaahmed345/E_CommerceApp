import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/component/clipper.dart';
import 'package:lazashopping/cubits/cubit/login-cubit/login_cubit.dart';
import 'package:lazashopping/screens/Auth/forgetpassword.dart';
import 'package:lazashopping/screens/Homepage/homescreen.dart';
import 'package:lazashopping/services/AuthServices/loginservices.dart';
import 'package:lazashopping/widgets/customappbar.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customtextfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // User Name Controller
  TextEditingController userNameController = TextEditingController();
  // Password Controller
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  // LoginServices logserv = LoginServices();
  bool remember = false;

  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogIN_Cubit(logserv: LoginServices()),
      child: BlocConsumer<LogIN_Cubit, LogInCubitState>(
        listener: (context, state) {
          if (state is LogInSuccessState) {
            print(state.login.token);
            Navigator.pushNamed(context, HomeScreen.id);
          } else if (state is LogInFailureState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is LogInLoadingState) {
            Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          return Scaffold(
                        resizeToAvoidBottomInset: false,
appBar: CustomAppbar(title:""),

            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
         
            body: SafeArea(
              child: Form(
                key: globalKey,
                child: Column(
                  
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    Center(
                        child: Text(
                      "LOGIN",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    // User Name Section
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 5),
                      child: Text(
                        "UserName",
                        style: TextStyle(color: Colors.grey, fontSize: 19),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: CustomTextField(
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Field is required";
                            } else
                              return null;
                          },
                          onChanged: (val) {
                            setState(() {});
                          },
                          controller: userNameController,
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Password",
                          style: TextStyle(color: Colors.grey, fontSize: 19),
                        ),
                      ),
                    ),
                    // Password  Section
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 3),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Stack(
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
                              maxLength: 10,
                              obscureText: true,
                              controller: passwordController,
                              onTap: () {
                                setState(() {
                                  isShow = !isShow;
                                });
                              },
                              icon: isShow
                                  ? Icons.visibility
                                  : Icons.visibility_off),

                          // Torch Effect Section
                          isShow
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: ClipPath(
                                      // Custom Clipper
                                      clipper: MyClipper(),
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 205, 98, 255),
                                        ),
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          passwordController.text,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    // Submit Button   Section

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, ForgotPassword.id);
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.red),
                              ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Remember me",
                            style: TextStyle(color: Theme.of(context).appBarTheme.titleTextStyle!.color, fontSize: 20),
                          ),
                          Switch(
                              activeColor: Colors.green,
                              value: remember,
                              onChanged: (val) {
                                setState(() {
                                  remember = val;
                                });
                              })
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "By connecting your account confirm that you agree with our Term and Condition",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    BlocBuilder<LogIN_Cubit, LogInCubitState>(
                      builder: (context, state) {
                        return CustomContainer(
                          text: "Login",
                          onTap: () async {
                            if (globalKey.currentState!.validate()) {
                              BlocProvider.of<LogIN_Cubit>(context).submitlogin(
                                  email: userNameController.text,
                                  password: passwordController.text,
                                  rememberMe: remember);
                            }
                          },
                        );
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
