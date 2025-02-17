import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/Theme/theme_cubit_cubit.dart';
import 'package:lazashopping/firebase_options.dart';
import 'package:lazashopping/model/themes/light&darkTheme.dart';
import 'package:lazashopping/screens/AllReview/reviewsscreen.dart';
import 'package:lazashopping/screens/Cart/addressscreen.dart';
import 'package:lazashopping/screens/Cart/cart-screen.dart';
import 'package:lazashopping/screens/Orders/getallorders.dart';
import 'package:lazashopping/screens/addreview/add_review_screen.dart';
import 'package:lazashopping/screens/Category/categoryhome.dart';
import 'package:lazashopping/screens/Auth/forgetpassword.dart';
import 'package:lazashopping/screens/Homepage/homescreen.dart';
import 'package:lazashopping/screens/detailsproduct.dart/info_screen.dart';
import 'package:lazashopping/screens/Auth/login.dart';
import 'package:lazashopping/screens/Auth/signup.dart';
import 'package:lazashopping/screens/drawersScreens/account_Info.dart';
import 'package:lazashopping/screens/drawersScreens/display_Password.dart';
import 'package:lazashopping/screens/orderconfirmed/orderconfirmed.dart';
import 'package:lazashopping/screens/paymentscreen/addnewcard.dart';
import 'package:lazashopping/screens/paymentscreen/payment.dart';
import 'package:lazashopping/screens/welcomescreen.dart';
import 'package:lazashopping/screens/Auth/newpassword.dart';
import 'package:lazashopping/screens/splash/splash.dart';
import 'package:lazashopping/screens/started_screen.dart';
import 'package:lazashopping/screens/Auth/verification%20_code.dart';
import 'package:lazashopping/screens/wishlist/wishlist.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeLight,
            darkTheme: AppTheme.darkTheme,
            themeMode: state,
            routes: {
              Splash_Screan.id: (context) => Splash_Screan(),
              Welcome_Screen.id: (context) => Welcome_Screen(),
              StartedScreen.id: (context) => StartedScreen(),
              Sign_Up.id: (context) => Sign_Up(),
              ForgotPassword.id: (context) => ForgotPassword(),
              VerificationCode.id: (context) => VerificationCode(),
              NewPassword_Screan.id: (context) => NewPassword_Screan(),
              HomeScreen.id: (context) => HomeScreen(),
              InfoCard.id: (context) => InfoCard(),
              LoginScreen.id: (context) => LoginScreen(),
              ReviewsScreen.id: (context) => ReviewsScreen(),
              CategoryHome.id: (context) => CategoryHome(),
              AddReviewScreen.id: (context) => AddReviewScreen(),
              CartView.id: (context) => CartView(),
              AddressScreen.id: (context) => AddressScreen(),
              PaymentScreen.id: (context) => PaymentScreen(),
              AddNewCard.id: (context) => AddNewCard(),
              OrderConfirmedScreen.id: (context) => OrderConfirmedScreen(),
              WishListScreen.id: (context) => WishListScreen(),
              GetOrders.id: (context) => GetOrders(),
              DisplayPasswordScreen.id:(context)=>DisplayPasswordScreen(),
              AccountInfoScreen.id:(context)=>AccountInfoScreen()
            },
            initialRoute:
                  // Splash_Screan.id
                SharedPref.getToken() == null
                    ? Splash_Screan.id
                    : HomeScreen.id,
          );
        },
      ),
    );
  }
}
