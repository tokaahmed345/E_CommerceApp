import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazashopping/cubits/cubit/Theme/theme_cubit_cubit.dart';
import 'package:lazashopping/firebase_options.dart';
import 'package:lazashopping/model/themes/light&darkTheme.dart';
import 'package:lazashopping/view/screens/AddReview/add_review_screen.dart';
import 'package:lazashopping/view/screens/AllReview/reviewsscreen.dart';
import 'package:lazashopping/view/screens/Cart/addressscreen.dart';
import 'package:lazashopping/view/screens/Cart/cart-screen.dart';
import 'package:lazashopping/view/screens/DetailsProduct.dart/info_screen.dart';
import 'package:lazashopping/view/screens/Orders/getallorders.dart';
import 'package:lazashopping/view/screens/Category/categoryhome.dart';
import 'package:lazashopping/view/screens/Auth/forgetpassword.dart';
import 'package:lazashopping/view/screens/Auth/login.dart';
import 'package:lazashopping/view/screens/Auth/signup.dart';
import 'package:lazashopping/view/screens/drawersScreens/account_Info.dart';
import 'package:lazashopping/view/screens/drawersScreens/display_Password.dart';
import 'package:lazashopping/view/screens/homepage/homescreen.dart';
import 'package:lazashopping/view/screens/orderconfirmed/orderconfirmed.dart';
import 'package:lazashopping/view/screens/paymentscreen/pay_details.dart';
import 'package:lazashopping/view/screens/paymentscreen/web_view.dart';
import 'package:lazashopping/view/screens/welcomescreen.dart';
import 'package:lazashopping/view/screens/Auth/newpassword.dart';
import 'package:lazashopping/view/screens/splash/splash.dart';
import 'package:lazashopping/view/screens/started_screen.dart';
import 'package:lazashopping/view/screens/Auth/verification%20_code.dart';
import 'package:lazashopping/view/screens/wishlist/wishlist.dart';
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
              SplashScreen.id: (context) => SplashScreen(),
              Welcome_Screen.id: (context) => Welcome_Screen(),
              StartedScreen.id: (context) => StartedScreen(),
              SignUp.id: (context) => SignUp(),
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
              OrderConfirmedScreen.id: (context) => OrderConfirmedScreen(),
              WishListScreen.id: (context) => WishListScreen(),
              GetOrders.id: (context) => GetOrders(),
              DisplayPasswordScreen.id:(context)=>DisplayPasswordScreen(),
              AccountInfoScreen.id:(context)=>AccountInfoScreen(),
              PayMobIFrameScreen.id:(context)=>PayMobIFrameScreen(),
              DetailsPayment.id:(context)=>DetailsPayment()
            },
            initialRoute:
                 //SplashScreen.id
                SharedPref.getToken() == null
                    ? SplashScreen.id
                    : HomeScreen.id,
          );
        },
      ),
    );
  }
}
