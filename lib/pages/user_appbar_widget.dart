import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String userId;
  final String? thumbnail;

  const UserAppBarWidget({
    super.key,
    required this.userName,
    required this.userId,
    this.thumbnail,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

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
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
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

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            Text(
              userId,
              style: const TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          ],
        ),
        leading: networkImage,
      ), //or row/any widget
    );
  }
}
