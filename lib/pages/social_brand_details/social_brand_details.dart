import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socials_app_flutter/state/models/social_brand_item_ui.dart';

class SocialBrandDetails extends StatelessWidget {
  const SocialBrandDetails({
    required this.itemUi,
    super.key,
  });

  final SocialBrandItemUi itemUi;

  @override
  Widget build(BuildContext context) {
    final networkImage = itemUi.imgUrl.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: itemUi.imgUrl,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : const SizedBox();

    final widgetThemeColor = itemUi.color != null ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          itemUi.name,
          style: TextStyle(
            color: widgetThemeColor,
            fontSize: 16.0,
          ),
        ),
        iconTheme: IconThemeData(color: widgetThemeColor),
        backgroundColor: itemUi.color ?? Colors.transparent,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          networkImage,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 20.0,
            ),
            child: Text(
              itemUi.history,
              overflow: TextOverflow.visible,
              softWrap: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 100.0,
              vertical: 20.0,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: widgetThemeColor,
                minimumSize: const Size(88, 44),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
                backgroundColor: itemUi.color ?? Colors.transparent,
              ),
              onPressed: () {
                print('Button pressed');
              },
              child: Text('Visit ${itemUi.name}'),
            ),
          ),
        ],
      ),
    );
  }
}
