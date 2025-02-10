import 'package:flutter/material.dart';
import 'package:lazashopping/screens/homepage/homescreen.dart';
import 'package:lazashopping/screens/wishlist/wishlist.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
  elevation: 0,
  selectedItemColor: Colors.blue,
  unselectedItemColor: Colors.grey,
  unselectedLabelStyle: TextStyle(fontSize: 18),
  selectedFontSize: 18,
showSelectedLabels: true,
showUnselectedLabels: true,
onTap: (index){
setState(() {
  selectedIndex=index;
});
  if (index == 1) {
          Navigator.pushNamed(context, WishListScreen.id);
        }
          if (index == 0) {
          Navigator.pushNamed(context, HomeScreen.id);
        }
},
currentIndex: selectedIndex,

type: BottomNavigationBarType.fixed,

  items: [
  BottomNavigationBarItem(
    label: "Home",
    icon:selectedIndex==0?
    SizedBox.shrink():
 Icon(Icons.home_outlined)
  ),

BottomNavigationBarItem(

            icon:selectedIndex==1? SizedBox.shrink()
            
            :Icon( Icons.favorite_outline,),
            label: "Wishlist",
            
          ),
          BottomNavigationBarItem(
            icon:selectedIndex==2?
            SizedBox.shrink()
            : Icon(  Icons.credit_card),
            label: "card",
          ),
          BottomNavigationBarItem(
            icon:selectedIndex==3?
            SizedBox.shrink():
             Icon( Icons.shopping_bag_outlined),
            label: "Order",
          ),

]);

  }
}