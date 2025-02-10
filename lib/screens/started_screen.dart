import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lazashopping/screens/Homepage/homescreen.dart';
import 'package:lazashopping/screens/Auth/login.dart';
import 'package:lazashopping/screens/Auth/signup.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customrectanglebutton.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});
  static String id = "started";
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDE9FE),
      appBar: AppBar(
        backgroundColor: Color(0xffEDE9FE),
        elevation: 0,
        leading: CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xffEDE9FE),
            foregroundColor: Colors.black,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                ))),
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            "Let's Get Started",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 160.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                  child: CustomRec_Button(
                    onTap: () {},
                    text: "FaceBook",
                    icon: Icons.facebook,
                    background: Color(0xff4267b2),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                  child: CustomRec_Button(
                    onTap: () {},
                    text: "Twiter",
                    icon: FontAwesomeIcons.twitter,
                    background: Colors.blue,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
                  child: CustomRec_Button(
                    onTap: () {
                      signInWithGoogle().then((UserCredential) {
                        Navigator.pushNamed(context, HomeScreen.id);
                      }).catchError((e) {
                        print("Error signing in with Google: $e");
                      });
                      ;
                    },
                    text: "Google",
                    icon: FontAwesomeIcons.google,
                    background: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0, bottom: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.grey, fontSize: 20)),
                TextSpan(
                    text: "LOGIN",
                    style: TextStyle(color: Colors.black, fontSize: 20))
              ])),
            ),
          ),
          Expanded(
            child: CustomContainer(
                text: "Go To Registration",
                onTap: () {
                  Navigator.pushNamed(context, Sign_Up.id);
                }),
          )
        ],
      ),
    );
  }
}
