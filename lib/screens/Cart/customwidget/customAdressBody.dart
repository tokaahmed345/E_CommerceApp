
import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/cart-screen.dart';
import 'package:lazashopping/screens/Cart/customwidget/customadresstextfield.dart';
import 'package:lazashopping/widgets/customcontainer.dart';

class CustomColumnAdreesBody extends StatelessWidget {
  const CustomColumnAdreesBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    

   final TextEditingController nameController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

    return Column(children: [
      
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
        Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 10,)
    ,  CustomAdressTextField(controller: nameController,),
    SizedBox(height: 20,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
    
        children: [
      Text("Country",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
    
      SizedBox(
        width: 150,
        child: CustomAdressTextField(controller:countryController ,))
    ],),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("City",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
    
      SizedBox(
        width: 150,
        child: CustomAdressTextField(controller: cityController,))
    ],)
    ],),
    SizedBox(height: 20,),
    
      Text("PhoneNumber",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      SizedBox(height: 10,),
      CustomAdressTextField(controller: phoneController,) ,
      SizedBox(height: 20,),
    
       Text("Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
         SizedBox(height: 10,),
    
      CustomAdressTextField(controller: addressController,) 
      
      
      
       ],),
      ),
    
    Spacer(),
    CustomContainer(text: "Save Address",
    
onTap: (){
  Navigator.pushNamed(context, CartView.id,arguments: {
    "country":countryController.text,
    "address":addressController.text,
  });
},    
    
    ),
    
    
    ],);
  }
}
