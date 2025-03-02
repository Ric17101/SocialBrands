import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SocialBrandItemWidget extends StatelessWidget {
  final String? thumbnail;
  final VoidCallback? onTap;

  const SocialBrandItemWidget({
    this.thumbnail,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const loadingIndicator = SizedBox(
      height: 30.0,
      child: Center(child: CircularProgressIndicator()),
    );
    final networkImage = thumbnail != null
        ? CachedNetworkImage(
            imageUrl: thumbnail!,
            imageBuilder: (context, imageProvider) => Container(
              margin: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => loadingIndicator,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : const SizedBox();

    return networkImage;
  }
}
