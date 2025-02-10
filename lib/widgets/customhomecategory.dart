
import 'package:flutter/material.dart';

class CustomHomeCategory extends StatelessWidget {
  const CustomHomeCategory({
    super.key, required this.title, required this.img, required this.id,
  });
final String title;
final String img;
final String id;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
     
            child:  SizedBox(
     width: 150,
     child: Card(
      elevation: 6,
       color: Color(0xfff5f6fa),
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Row(
           
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [Image(image: AssetImage(img,),),
         
         Padding(
           padding: const EdgeInsets.all(5.0),
           child: Text(title,style: TextStyle(fontSize: 25),),
         )],),
       )
     ),
          ),
         
    );
  }
}
