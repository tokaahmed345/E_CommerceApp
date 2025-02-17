import 'package:flutter/material.dart';
import 'package:lazashopping/screens/started_screen.dart';
import 'package:lazashopping/widgets/custombutton.dart';

class Customcard extends StatefulWidget {
  const Customcard({super.key});

  @override
  State<Customcard> createState() => _CustomcardState();
}

bool isMenSelected = false;
bool isWomenSelected = false;
bool isSkipSelected = false;

class _CustomcardState extends State<Customcard> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    // Adjust padding and font sizes based on screen size
    double padding = screenWidth < 600 ? 16.0 : 26.0;
    double fontSizeTitle = screenWidth < 600 ? 22.0 : 27.0;
    double fontSizeBody = screenWidth < 600 ? 16.0 : 20.0;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Text(
                "Look Good, Feel Good",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSizeTitle),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Create your individual & Unique style and look amazing every day.",
                style: TextStyle(fontSize: fontSizeBody, color: Colors.grey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomButton(
                    onPressed: () {
                      isMenSelected = true;
                      isWomenSelected = false;
                      isSkipSelected = false;
                      setState(() {});
                      Navigator.pushNamed(context, StartedScreen.id);
                    },
                    text: "Men",
                    textColor: isMenSelected ? Colors.white : Colors.grey,
                    backgroundColor: isMenSelected
                        ? Color(0xff9775fa)
                        : Colors.grey[100] ?? Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomButton(
                    onPressed: () {
                      isMenSelected = false;
                      isWomenSelected = true;
                      isSkipSelected = false;
                      setState(() {});
                      Navigator.pushNamed(context, StartedScreen.id);
                    },
                    text: "Women",
                    textColor: isWomenSelected ? Colors.white : Colors.grey,
                    backgroundColor: isWomenSelected
                        ? Color(0xff9775fa)
                        : Colors.grey[100] ?? Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomButton(
                onPressed: () {
                  isMenSelected = false;
                  isWomenSelected = false;
                  isSkipSelected = true;
                  setState(() {});
                  Navigator.pushNamed(context, StartedScreen.id);
                },
                text: "Skip",
                textColor: isSkipSelected ? Colors.white : Colors.grey,
                backgroundColor: isSkipSelected
                    ? Color(0xff9775fa)
                    : Colors.grey[100] ?? Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
