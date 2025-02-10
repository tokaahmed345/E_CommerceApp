import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/component/clipper.dart';
import 'package:lazashopping/cubits/cubit/login-cubit/login_cubit.dart';
import 'package:lazashopping/cubits/cubit/register-cubit/registration_cubit.dart';
import 'package:lazashopping/model/AuthModel/login.dart';
import 'package:lazashopping/screens/Auth/login.dart';
import 'package:lazashopping/services/AuthServices/register.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customtextfield.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});
  static String id = "Signup";

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  GlobalKey<FormState> globalKey = GlobalKey();
  RegisterServices reg = RegisterServices();
  bool isShow = false;
  bool remember = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController UserNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(registered: RegisterServices()),
      child: BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            print(state.register.message);
            Navigator.pushNamed(context, LoginScreen.id);
          } else if (state is RegistrationFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is RegistrationLoading) {
            Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          return Scaffold(
                        resizeToAvoidBottomInset: false,

            backgroundColor: Color(0xffEDE9FE),
            body: Form(
              key: globalKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        // Login Text
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back)),
                        Center(
                            child: Text(
                          "Sign_Up",
                          style:
                              TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                        // User Name Section
                        Text(
                          "UserName",
                          style: TextStyle(color: Colors.grey, fontSize: 19),
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
                        const SizedBox(
                          height: 30,
                        ),
                                
                        Text(
                          "Email Address",
                          style: TextStyle(color: Colors.grey, fontSize: 19),
                        ),
                                
                        CustomTextField(
                          controller: emailController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Field is required";
                            } else
                              return null;
                            ;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                                
                        Text(
                          "Password",
                          style: TextStyle(color: Colors.grey, fontSize: 19),
                        ),
                        // Password  Section
                                 
                                
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
                                
                                obscureText: true,
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
                        // Submit Button   Section
                                
                        SizedBox(
                          height: 10,
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
                                style: TextStyle(color: Colors.black, fontSize: 20),
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
                        
                      ],
                    ),
                  ),
               Spacer(),

                    CustomContainer(
                        text: "Sign Up",
                        onTap: () {
                          if (globalKey.currentState!.validate()) {
                            BlocProvider.of<RegistrationCubit>(context)
                                .submitRegistration(
                                    userName: UserNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    remember: remember);
                          }
                        })
               
                ],
              ),
              
            ),
          );
        },
      ),
    );
  }
}
