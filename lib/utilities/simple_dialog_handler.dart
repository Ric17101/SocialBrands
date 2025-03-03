import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socials_app_flutter/utilities/dialog_handler.dart';

class SimpleDialogHandler extends DialogHandler {
  final String headerText;
  final String? descriptionText;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onTap;

  SimpleDialogHandler({
    required this.headerText,
    this.descriptionText,
    this.confirmText,
    this.cancelText,
    this.onTap,
  });

  @override
  Widget createDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(headerText),
      content: const Column(
        children: [
          Text(
            "Login Failed, please try again",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Close",
            style: TextStyle(color: Colors.red, fontSize: 16.0),
          ),
        )
      ],
    );
  }
}
