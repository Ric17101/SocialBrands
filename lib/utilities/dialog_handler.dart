import 'package:flutter/material.dart';

abstract class DialogHandler {
  Widget createDialog(BuildContext context);

  void closeDialog(BuildContext context) => Navigator.pop(context);

  void showDialogHandler(BuildContext context, DialogHandler? dialogHandler) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialogHandler?.createDialog(context) ?? const SizedBox();
      },
    );
  }
}
