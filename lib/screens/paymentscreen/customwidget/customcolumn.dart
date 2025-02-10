import 'package:flutter/material.dart';
import 'package:lazashopping/screens/Cart/customwidget/customadresstextfield.dart';

class CustomColumnPaymentDetails extends StatelessWidget {
  const CustomColumnPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

      children: [Text("Card Owner",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      SizedBox(height: 5,),

       CustomAdressTextField() ,
       SizedBox(height: 10,),

         Text("Card Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      SizedBox(height: 5,),

       CustomAdressTextField() ,      
              SizedBox(height: 10,),

        Row(
          children: [ 
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ Text("EXP",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                    
                 CustomAdressTextField()    ,  ],),
          ),
                          SizedBox(width: 10,),

          Expanded(
            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

              children: [ Text("CVV",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                    
                 CustomAdressTextField()    ,  ],),
          ),   
         ],)],);
  }
}