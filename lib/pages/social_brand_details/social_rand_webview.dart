import 'package:flutter/material.dart';
import 'package:socials_app_flutter/state/models/social_brand_item_ui.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SocialBrandWebView extends StatefulWidget {
  const SocialBrandWebView({
    required this.itemUi,
    super.key,
  });

  final SocialBrandItemUi itemUi;

  @override
  State<SocialBrandWebView> createState() => _SocialBrandWebViewState();
}

class _SocialBrandWebViewState extends State<SocialBrandWebView> {
  bool isLoading = true;
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.itemUi.webUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widgetThemeColor =
        widget.itemUi.color != null ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.itemUi.name,
          style: TextStyle(
            color: widgetThemeColor,
            fontSize: 16.0,
          ),
        ),
        iconTheme: IconThemeData(color: widgetThemeColor),
        backgroundColor: widget.itemUi.color ?? Colors.transparent,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
