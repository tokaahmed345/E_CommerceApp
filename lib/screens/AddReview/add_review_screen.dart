import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/AddReview-cubit/add_review_cubit.dart';
import 'package:lazashopping/helpers/helper.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
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
  final AddReviewService servces = AddReviewService();
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;

    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Responsive padding and text size
    double padding = screenWidth < 400 ? 12.0 : 10.0;
    double textFontSize = screenWidth < 400 ? 16.0 : 22.0;
    double titleFontSize = screenWidth < 400 ? 18.0 : 22.0;

    return BlocProvider(
      create: (context) => AddReviewCubit(servces),
      child: BlocConsumer<AddReviewCubit, AddReviewState>(
        listener: (context, state) {
          if (state is AddReviewLoading) {
            Center(child: CircularProgressIndicator());
          } else if (state is AddReviewSuccess) {
                      Helpers.showSnackbar(context, "Review Added Successfully",backgroundColor: const Color.fromARGB(255, 231, 85, 209));

            Navigator.of(context).pop();
          } else if (state is AddReviewFailure) {
            Helpers.showSnackbar(context, state.message,backgroundColor: const Color.fromARGB(255, 231, 85, 209));
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar:                       CustomAppBar(title: "Add Review", ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Column(

              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01, horizontal: padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.025),
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold),
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
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold),
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
                            rating = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomContainer(
                  text: "Submit Review",
                  onTap: ()async {
                 await   BlocProvider.of<AddReviewCubit>(context).submitReview(
                        id: id,
                        userName: userNameController.text,
                        feedBack: experienceController.text,
                        rating: rating);
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
