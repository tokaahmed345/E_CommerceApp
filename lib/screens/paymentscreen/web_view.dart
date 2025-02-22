import 'package:flutter/material.dart';
import 'package:lazashopping/screens/orderconfirmed/orderconfirmed.dart';
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
              await Future.delayed(
                  const Duration(seconds: 1)); 
              Navigator.pushNamed(
                  context, OrderConfirmedScreen.id); 
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
    return Scaffold(
      body: Stack(
        children: [
          if (paymentUrl != null && _controller != null)
            WebViewWidget(controller: _controller!)
          else
            const Center(child: Text("Error: No payment URL provided")),
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.white.withOpacity(0.8),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
