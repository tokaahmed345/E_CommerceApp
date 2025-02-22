import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/AddReview-cubit/add_review_cubit.dart';
import 'package:lazashopping/cubits/cubit/allreviewcubit/cubit/all_review_cubit.dart';
import 'package:lazashopping/helpers/helper.dart';
import 'package:lazashopping/view/screens/AddReview/customtextfieldreview.dart';
import 'package:lazashopping/view/screens/AddReview/customwidget/customreviewslider.dart';
import 'package:lazashopping/view/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/services/reviewservices/addreviewservces.dart';
import 'package:lazashopping/services/reviewservices/allreview.dart';
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

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = screenWidth < 400 ? 12.0 : 10.0;
    double titleFontSize = screenWidth < 400 ? 18.0 : 22.0;

    return MultiBlocProvider(
      providers: [
        BlocProvider<AllReviewCubit>(
          create: (context) => AllReviewCubit(AllReviewServces()),
        ),
        BlocProvider<AddReviewCubit>(
          create: (context) => AddReviewCubit(
            AddReviewService(),
            BlocProvider.of<AllReviewCubit>(context),
          ),
        ),
      ],
      child: BlocConsumer<AddReviewCubit, AddReviewState>(
        listener: (context, state) {
          if (state is AddReviewLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          } else if (state is AddReviewSuccess) {
            Navigator.of(context).pop(); // إغلاق الـ Dialog عند النجاح
            Helpers.showSnackbar(
              context,
              "Review Added Successfully",
              backgroundColor: Colors.green,
            );
            Navigator.of(context).pop(); // العودة إلى الشاشة السابقة
          } else if (state is AddReviewFailure) {
            Navigator.of(context).pop(); // إغلاق الـ Dialog عند الفشل
            Helpers.showSnackbar(
              context,
              state.message,
              backgroundColor: Colors.red,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: const CustomAppBar(title: "Add Review"),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",
                          style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold)),
                      CustomTextField(
                          hintText: "Type your Name",
                          controller: userNameController),
                      SizedBox(height: screenHeight * 0.02),
                      Text("How Was Your Experience?",
                          style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold)),
                      CustomTextFieldReview(
                          num: 10,
                          hintText: "Describe your Experience?",
                          controller: experienceController),
                      SizedBox(height: screenHeight * 0.02),
                      Text("Star",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: titleFontSize)),
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
                const Spacer(),
                CustomContainer(
                  text: "Submit Review",
                  onTap: () {
                    BlocProvider.of<AddReviewCubit>(context)
                        .submitReview(
                      id: id,
                      userName: userNameController.text,
                      feedBack: experienceController.text,
                      rating: rating,
                    )
                        .then((_) {
                      BlocProvider.of<AllReviewCubit>(context).fetchData(id);
                      Navigator.of(context).pop(); // العودة إلى الشاشة السابقة
                    }).catchError((error) {
                      Navigator.of(context).pop(); // إغلاق الـ Dialog عند الخطأ
                      Helpers.showSnackbar(
                        context,
                        "Failed to add review: $error",
                        backgroundColor: Colors.red,
                      );
                    });
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
