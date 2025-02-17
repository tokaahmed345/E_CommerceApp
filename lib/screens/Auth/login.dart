import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/component/clipper.dart';
import 'package:lazashopping/cubits/cubit/login-cubit/login_cubit.dart';
import 'package:lazashopping/screens/Auth/forgetpassword.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/screens/Homepage/homescreen.dart';
import 'package:lazashopping/services/AuthServices/loginservices.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';
import 'package:lazashopping/widgets/customappbar.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customtextfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  bool remember = false;
  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    double fontSize = screenWidth < 400 ? 18.0 : 22.0;
    double titleFontSize = screenWidth < 400 ? 30.0 : 40.0;
    double padding = screenWidth < 400 ? 13.0 : 10.0;

    return BlocProvider(
      create: (context) => LogIN_Cubit(logserv: LoginServices()),
      child: BlocConsumer<LogIN_Cubit, LogInCubitState>(
        listener: (context, state) {
          if (state is LogInSuccessState) {
            print(state.login.token);
            SharedPref.savePassword(passwordController.text);
            SharedPref.setEmail(userNameController.text);
            Navigator.pushNamed(context, HomeScreen.id);
          } else if (state is LogInFailureState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LogInLoadingState,
            child: Scaffold(
              resizeToAvoidBottomInset: false, // Ensures keyboard doesn't cover content
              appBar: CustomAppBar(title:""),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: SafeArea(
                child: Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                              "LOGIN",
                              style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
                            )),
                            SizedBox(height: screenHeight * 0.05),
                            
                            // User Name Section
                            Padding(
                              padding: EdgeInsets.only(left: padding, bottom: 5),
                              child: Text(
                                "UserName",
                                style: TextStyle(color: Colors.grey, fontSize: fontSize),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: padding),
                              child: CustomTextField(
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Field is required";
                                  }
                                  return null;
                                },
                                controller: userNameController,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            
                            // Password Section
                            Padding(
                              padding: EdgeInsets.only(left: padding, bottom: 5),
                              child: Text(
                                "Password",
                                style: TextStyle(color: Colors.grey, fontSize: fontSize),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: padding),
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
                                      obscureText: !isShow,
                                      controller: passwordController,
                                      onTap: () {
                                        setState(() {
                                          isShow = !isShow;
                                        });
                                      },
                                      icon: isShow ? Icons.visibility : Icons.visibility_off),
                                  isShow
                                      ? Padding(
                                          padding: EdgeInsets.only(right: 30),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: ClipPath(
                                              clipper: MyClipper(),
                                              child: Container(
                                                height: 50,
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                  color: Color.fromARGB(255, 205, 98, 255),
                                                ),
                                                padding: const EdgeInsets.only(left: 10),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  passwordController.text,
                                                  style: const TextStyle(color: Colors.black, fontSize: 20),
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
                            
                            // Forgot Password Section
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, ForgotPassword.id);
                                },
                                child: Text("Forgot Password?", style: TextStyle(color: Colors.red)),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            
                            // Remember Me Section
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: padding),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Remember me", style: TextStyle(color: Theme.of(context).appBarTheme.titleTextStyle!.color, fontSize: fontSize)),
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
                                             
                          ],
                        ),
                      ),
                           Spacer(),
                          
                          // Terms & Conditions Text
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: padding),
                            child: Text(
                              "By connecting your account confirm that you agree with our Term and Condition",
                              style: TextStyle(color: Colors.grey, fontSize: fontSize),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          
                          // Login Button
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
            ),
          );
        },
      ),
    );
  }
}
