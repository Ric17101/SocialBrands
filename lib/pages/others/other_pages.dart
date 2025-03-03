import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:socials_app_flutter/pages/social_brand_details/social_rand_webview.dart';
import 'package:socials_app_flutter/state/models/social_brand_item_ui.dart';
import 'package:socials_app_flutter/utilities/asset_images.dart';

class OtherPagesArgs {
  OtherPagesArgs({required this.itemUi});

  final SocialBrandItemUi? itemUi;
}

class OtherPages extends StatefulWidget {
  static const String route = 'others-page';

  const OtherPages({
    required this.itemUi,
    super.key,
  });

  final SocialBrandItemUi itemUi;

  @override
  State<OtherPages> createState() => OtherPagesState();
}

class OtherPagesState extends State<OtherPages> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final widgetThemeColor =
        widget.itemUi.color != null ? Colors.white : Colors.black;
    final items = [
      SocialBrandItemUi(
        name: 'Samsung',
        webUrl: 'https://www.samsung.com/',
        color: Colors.yellow[700],
        image: AssetImages.samsung,
      ),
      SocialBrandItemUi(
        name: 'Apple',
        webUrl: 'https://www.apple.com/',
        color: Colors.yellow[700],
        image: AssetImages.apple,
      ),
      SocialBrandItemUi(
        name: 'Windows',
        webUrl: 'https://www.windows.com/',
        color: Colors.yellow[700],
        image: AssetImages.windows,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          widget.itemUi.name,
          style: TextStyle(
            color: widgetThemeColor,
            fontSize: 16.0,
          ),
        ),
        iconTheme: IconThemeData(color: widgetThemeColor),
        backgroundColor: Colors.yellow[700],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'You might also like',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            CarouselSlider(
              items: List.generate(items.length, (int index) {
                return Container(
                  width: 400.0,
                  color: Colors.white,
                  child: items[index].image,
                );
              }),
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: currentIndex,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 400),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              items[currentIndex].name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 100.0,
                vertical: 20.0,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  elevation: 2.0,
                  shadowColor: Colors.grey,
                  foregroundColor: widgetThemeColor,
                  minimumSize: const Size(88, 44),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  ),
                  backgroundColor: Colors.yellow[700],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SocialBrandWebView(
                        itemUi: items[currentIndex],
                      ),
                    ),
                  );
                },
                child: Text(
                  'Visit ${items[currentIndex].name} Website',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
