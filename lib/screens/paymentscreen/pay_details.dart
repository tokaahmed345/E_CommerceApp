import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/payment/cubit/payment_cubit.dart';
import 'package:lazashopping/screens/paymentscreen/web_view.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/screens/Cart/customwidget/customadresstextfield.dart';
class DetailsPayment extends StatefulWidget {
  static String id = "DetailsPayment";
  const DetailsPayment({super.key});
  @override
  State<DetailsPayment> createState() => _DetailsPaymentState();
}
class _DetailsPaymentState extends State<DetailsPayment> {
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double totalOrder = 0.0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is double) {
        setState(() {
          totalOrder = args;
        });
      }
    });
  }
  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double horizontalPadding = screenWidth * 0.05;
    double verticalPadding = screenHeight * 0.02;
    double fontSize = screenWidth * 0.05;

    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocListener<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state is PaymentLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Processing Checkout..."),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is PaymentSuccess) {
            Navigator.pushNamed(
              context,
              PayMobIFrameScreen.id,
              arguments: {'paymentUrl': state.paymentUrl},
            );
          } else if (state is PaymentFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Builder(builder: (context) {
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60.0),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: verticalPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("First Name",
                              style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: verticalPadding),
                          CustomAdressTextField(
                            controller: fNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field is required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: verticalPadding),
                          Text("Last Name",
                              style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: verticalPadding),
                          CustomAdressTextField(
                            controller: lNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field is required";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: verticalPadding),
                          Text("Phone Number",
                              style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: verticalPadding),
                          CustomAdressTextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field is required";
                              }
                              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: verticalPadding),
                          Text("Email",
                              style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: verticalPadding),
                          CustomAdressTextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "This field is required";
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: verticalPadding),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                CustomContainer(
                  text: "Checkout  \$${totalOrder.toStringAsFixed(2)}",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<PaymentCubit>().startPayment(
                            fName: fNameController.text,
                            lName: lNameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                            totalOrder: totalOrder,
                          );
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
