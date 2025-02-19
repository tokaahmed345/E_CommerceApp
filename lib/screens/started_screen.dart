import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lazashopping/screens/Cart/customwidget/customAppbar.dart';
import 'package:lazashopping/screens/Homepage/homescreen.dart';
import 'package:lazashopping/screens/Auth/login.dart';
import 'package:lazashopping/screens/Auth/signup.dart';
import 'package:lazashopping/widgets/customcontainer.dart';
import 'package:lazashopping/widgets/customrectanglebutton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});
  static String id = "started";

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
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

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Get the screen width for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: const CustomAppBar(
          title: "",
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                "Let's Get Started",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallScreen ? 30 : 40,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isSmallScreen ? 100 : 180,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 10),
                    child: CustomRec_Button(
                      onTap: () {
                        signInWithFacebook().then((UserCredential) {
                          Navigator.pushNamed(context, HomeScreen.id);
                        }).catchError((e) {
                          print("Error signing in with facebook: $e");
                        });
                      },
                      text: "FaceBook",
                      icon: Icons.facebook,
                      background: const Color(0xff4267b2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 10),
                    child: CustomRec_Button(
                      onTap: () {
                        setState(() {
                          isLoading = true;
                        });
                        signInWithGoogle().then((UserCredential) {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushNamed(context, HomeScreen.id);
                        }).catchError((e) {
                          setState(() {
                            isLoading = false;
                          });
                          print("Error signing in with Google: $e");
                        });
                      },
                      text: "Google",
                      icon: FontAwesomeIcons.google,
                      background: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.33),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: isSmallScreen ? 18 : 20,
                    )),
                TextSpan(
                    text: "LOGIN",
                    style: TextStyle(
                        color:
                            Theme.of(context).appBarTheme.titleTextStyle!.color,
                        fontSize: isSmallScreen ? 16 : 20))
              ])),
            ),
            const Spacer(),
            CustomContainer(
                text: "Go To Registration",
                onTap: () {
                  Navigator.pushNamed(context, SignUp.id);
                }),
          ],
        ),
      ),
    );
  }
}
