
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/verfication-cubit/verfication_cubit.dart';
import 'package:lazashopping/screens/Auth/newpassword.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/services/AuthServices/verficationservices.dart';
import 'package:lazashopping/widgets/customappbar.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});
  static String id = "VerificationCode";

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  GlobalKey<FormState> key = GlobalKey();
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  String code = "";
  int countdown = 20; // تحديد عدد الثواني للعد التنازلي
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startCountdown(); 
  }

  @override
  void dispose() {
    timer.cancel(); 
   for (var nodes in focusNodes){
nodes.dispose();
    };
    super.dispose();

  }

  void startCountdown() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        t.cancel(); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => VerficationCubit(verified: VerficationServices()),
      child: BlocConsumer<VerficationCubit, VerficationState>(
        listener: (context, state) {
          if (state is VerficationSuccess) {
            print(state.verfy.message);
            Navigator.pushNamed(
              context,
              NewPassword_Screan.id,
              arguments: email,
            );
          } else if (state is VerficationFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is VerficationLoading) {
            Center(child: CircularProgressIndicator());
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is VerficationLoading,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor:Theme.of(context).scaffoldBackgroundColor,
              appBar:CustomAppBar(title: ""),
              body: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Verification Code",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const Image(image: AssetImage("assets/images/IMG.png")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: SizedBox(
                            width: 50,
                            child: TextField(
                              onChanged: (val){
            if(val.isNotEmpty && index<3){
            FocusScope.of(context).requestFocus(focusNodes[index+1])   ;
            }else if (val .isEmpty&&index>0){
            FocusScope.of(context).requestFocus(focusNodes[index-1])   ;
            
            }
                              },
                              controller: controllers[index],
                              focusNode: focusNodes[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              decoration: InputDecoration(
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Text(
                        countdown > 0
                            ? "$countdown seconds remaining to resend code."
                            : "Resend confirmation code.",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    CustomContainer(
                      text: "Confirm Code",
                      onTap: () async {
                        code = controllers.map((controller) => controller.text).join();
                        if (code.length == 4) {
                          BlocProvider.of<VerficationCubit>(context)
                              .Verfy(email: email, code: code);
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
