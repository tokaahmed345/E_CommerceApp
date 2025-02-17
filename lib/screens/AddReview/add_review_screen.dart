import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/AddReview-cubit/add_review_cubit.dart';
import 'package:lazashopping/screens/addreview/customtextfieldreview.dart';
import 'package:lazashopping/screens/addreview/customwidget/custombar.dart';
import 'package:lazashopping/screens/addreview/customwidget/customreviewslider.dart';
import 'package:lazashopping/services/reviewservices/addreviewservces.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customtextfield.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  static String id = "addreviewscreen";

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  final AddReviewService servces=AddReviewService();
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (context) => AddReviewCubit(servces),
      child: BlocConsumer<AddReviewCubit, AddReviewState>(
        listener: (context, state) {
          if (state is AddReviewLoading) {
            Center(child: CircularProgressIndicator());
          } else if (state is AddReviewSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Review added Successfully")));
            Navigator.of(context).pop();
          } else if (state is AddReviewFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custombar(title: "Add Review", number: 80),
                    SizedBox(height: 25,),
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      CustomTextField(
                        hintText: "Type your Name",
                        controller: userNameController,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "How Was Your Experience? ",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      CustomTextFieldReview(
                        num: 9,
                        hintText: "Describe your Experience?",
                        controller: experienceController,
                      ),
                      SizedBox(height: 20),
                      Text("Star",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      CustomSlider(
                        onRatingChanged: (value) {
                          setState(() {
                            rating = value; // تحديث قيمة التقييم
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomContainer(text: "Submit Review", onTap:(){
BlocProvider.of<AddReviewCubit>(context).submitReview(id: id, userName: userNameController.text, feedBack: experienceController.text, rating: rating);

                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
