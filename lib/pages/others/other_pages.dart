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
  final controller = CarouselController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      // TODO: Set the current index here
      setState(() {
        // currentIndex = controller.position;

        final position = controller.position;
        final width = MediaQuery.sizeOf(context).width - 32; //your width
        if (position.hasPixels) {
          final index = (position.pixels / width).round();
          setState(() {
            currentIndex = index;
          });
        }
      });
    });

    // controller.nextPage();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: scaffoldKey,
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              const Text(
                'You might also like',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 240,
                child: CarouselView(
                  elevation: 2.0,
                  itemSnapping: true,
                  controller: controller,
                  itemExtent: MediaQuery.sizeOf(context).width - 32.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  children: List.generate(items.length, (index) {
                    setState(() {
                      currentIndex = index;
                    });
                    return Container(
                      color: Colors.white,
                      child: items[index].image,
                    );
                  }),
                ),
              ),
              // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              //   ...List.generate(items.length, (index) {
              //     final item = items[index];
              //
              //     return AnimatedContainer(
              //       duration: const Duration(milliseconds: 300),
              //       margin: const EdgeInsets.symmetric(horizontal: 30),
              //       height: 0,
              //       width: currentIndex == index ? 24 : 8,
              //       decoration: const BoxDecoration(color: Colors.red),
              //       child: Text(
              //         item.name,
              //         style: const TextStyle(fontSize: 12, color: Colors.black),
              //       ),
              //     );
              //   }),
              // ]),
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
      ),
    );
  }
}
