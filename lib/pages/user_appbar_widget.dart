import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String userId;
  final String? profilePicture;
  final VoidCallback onLogout;

  const UserAppBarWidget({
    super.key,
    required this.userName,
    required this.userId,
    required this.profilePicture,
    required this.onLogout,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Logout?"),
          content: Column(
            children: [
              _buildProfileWidget(),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                onLogout();
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.blue, fontSize: 16.0),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildProfileWidget() {
    final networkImage = profilePicture != null
        ? CachedNetworkImage(
            imageUrl: profilePicture!,
            imageBuilder: (context, imageProvider) => Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => const SizedBox(height: 30.0),
            errorWidget: (context, url, error) => const Icon(Icons.person),
          )
        : const SizedBox(height: 30.0);

    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final networkImage = profilePicture != null
        ? CachedNetworkImage(
            imageUrl: profilePicture!,
            imageBuilder: (context, imageProvider) => Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => const SizedBox(height: 30.0),
            errorWidget: (context, url, error) => const Icon(Icons.person),
          )
        : const SizedBox(height: 30.0);

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
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
        leading: GestureDetector(
          child: networkImage,
          onTap: () {
            _showLogoutDialog(context);
          },
        ),
      ), //or row/any widget
    );
  }
}
