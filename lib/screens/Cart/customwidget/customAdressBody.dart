import 'package:flutter/material.dart';
import 'package:lazashopping/helpers/helper.dart';
import 'package:lazashopping/screens/Cart/cart-screen.dart';
import 'package:lazashopping/screens/Cart/customwidget/customadresstextfield.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';
import 'package:lazashopping/widgets/customcontainer.dart';

class CustomColumnAdreesBody extends StatefulWidget {
  const CustomColumnAdreesBody({
    super.key,
  });

  @override
  State<CustomColumnAdreesBody> createState() => _CustomColumnAdreesBodyState();
}
   final TextEditingController nameController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();


class _CustomColumnAdreesBodyState extends State<CustomColumnAdreesBody> {
  @override
  Widget build(BuildContext context) {
    // Controllers for the text fields
 
    // Get screen width and height from MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Define padding and text sizes dynamically
    double horizontalPadding = screenWidth * 0.05;
    double verticalPadding = screenHeight * 0.02;
    double fontSize = screenWidth * 0.05;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Section
              Text("Name", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
              SizedBox(height: verticalPadding),
              CustomAdressTextField(controller: nameController),
              SizedBox(height: verticalPadding),
        
              // Row for Country and City
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Country
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Country", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
                      SizedBox(height: verticalPadding),
                      SizedBox(
                        width: screenWidth * 0.4, // Make width responsive
                        child: CustomAdressTextField(controller: countryController),
                      ),
                    ],
                  ),
        
                  // City
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
                      SizedBox(height: verticalPadding),
                      SizedBox(
                        width: screenWidth * 0.4, // Make width responsive
                        child: CustomAdressTextField(controller: cityController),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: verticalPadding),
        
              // Phone Number Section
              Text("Phone Number", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
              SizedBox(height: verticalPadding),
              CustomAdressTextField(controller: phoneController),
              SizedBox(height: verticalPadding),
        
              // Address Section
              Text("Address", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
              SizedBox(height: verticalPadding),
              CustomAdressTextField(controller: addressController),
              SizedBox(height: verticalPadding),
        
              // Save Address Button
             
            ],
          ),
        ),
        Spacer(),
      
       CustomContainer(
                text: "Save Address",
                onTap: () async{
                   if (countryController.text.isNotEmpty && addressController.text.isNotEmpty) {
      await SharedPref.setAddress(countryController.text, addressController.text);
      Navigator.pushNamed(context, CartView.id);
    } else {
      // You can show a snackbar or alert to the user indicating that the address fields can't be empty
      Helpers.showSnackbar(context, "Please fill in both country and address");
    }
  
                },
              ),
      ],
    );
  }
}
