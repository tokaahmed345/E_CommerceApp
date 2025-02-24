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
  late WebViewController _controller;
  bool isLoading = true;
  String? paymentUrl;
  String? lastLoadedUrl; // لتجنب إعادة تحميل نفس الصفحة

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {
            print("❌ WebView Error: ${error.errorCode} - ${error.description}");
          },
          onPageStarted: (url) {
            if (lastLoadedUrl == url) return; // تجنب إعادة تحميل نفس الصفحة
            setState(() {
              isLoading = true;
              lastLoadedUrl = url; // حفظ آخر رابط تم تحميله
            });
          },
          onPageFinished: (url) async {
            setState(() {
              isLoading = false;
            });

            // 🔹 قراءة محتوى الصفحة لعرضه في الـ console
            String pageContent = (await _controller
                    .runJavaScriptReturningResult("document.body.innerText"))
                .toString();
            print("🔍 Page Content: $pageContent");

            // 🔹 التحقق مما إذا كان الدفع ناجحًا
            if (pageContent.contains("Approved") || pageContent.contains("Success")) {
              await Future.delayed(const Duration(seconds: 1));
              if (mounted) {
                Navigator.pushNamed(context, OrderConfirmedScreen.id);
                SharedPref.clearAddress();
              }
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

    if (args != null && args.containsKey('paymentUrl')) {
      paymentUrl = args['paymentUrl'];

      if (paymentUrl != null && paymentUrl != lastLoadedUrl) {
        _controller.loadRequest(Uri.parse(paymentUrl!));
      }
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
          if (paymentUrl != null)
            SizedBox(
              width: screenWidth,
              height: screenHeight, // الويب فيو يأخذ كامل الشاشة
              child: WebViewWidget(controller: _controller),
            )
          else
            Center(
              child: Text(
                "⚠️ Error: No payment URL provided",
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
