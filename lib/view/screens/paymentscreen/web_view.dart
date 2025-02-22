import 'package:flutter/material.dart';
import 'package:lazashopping/view/screens/orderconfirmed/orderconfirmed.dart';
import 'package:lazashopping/sharedpref/sharedprefrance.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayMobIFrameScreen extends StatefulWidget {
  static String id = "paymob_iframe";

  const PayMobIFrameScreen({super.key});

  @override
  State<PayMobIFrameScreen> createState() => _PayMobIFrameScreenState();
}

class _PayMobIFrameScreenState extends State<PayMobIFrameScreen> {
  late WebViewController? _controller;
  bool isLoading = true;
  String? paymentUrl;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (url) async {
            setState(() {
              isLoading = false;
            });

            String pageContent = (await _controller!
                    .runJavaScriptReturningResult("document.body.innerText"))
                .toString();

            if (pageContent.contains("Approved")) {
              await Future.delayed(const Duration(seconds: 1));
              Navigator.pushNamed(context, OrderConfirmedScreen.id);
              SharedPref.clearAddress();
            }
          },
        ),
      );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    paymentUrl = args?['paymentUrl'];

    if (paymentUrl != null) {
      _controller!.loadRequest(Uri.parse(paymentUrl!));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double loaderSize = screenWidth * 0.1; // حجم اللودر كنسبة من العرض

    return Scaffold(
      body: Stack(
        children: [
          if (paymentUrl != null && _controller != null)
            SizedBox(
              width: screenWidth,
              height: screenHeight, // الويب فيو يأخذ كامل الشاشة
              child: WebViewWidget(controller: _controller!),
            )
          else
            Center(
              child: Text(
                "Error: No payment URL provided",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // حجم النص كنسبة من العرض
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.white.withOpacity(0.8),
                child: Center(
                  child: SizedBox(
                    width: loaderSize,
                    height: loaderSize,
                    child: const CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
