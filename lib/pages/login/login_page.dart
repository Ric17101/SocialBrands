import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:socials_app_flutter/api/models/user_model.dart';
import 'package:socials_app_flutter/utilities/asset_images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.onLogin,
    required this.isLoading,
    required this.isLoggedIn,
    required this.user,
  });

  final Function(String? username, String? pin) onLogin;
  final bool isLoading;
  final bool isLoggedIn;
  final UserModel? user;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = TextEditingController();
  bool _validate = false;
  final FocusNode _node = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if ((value.length > 24) && value.isNotEmpty) {
      return "Must not exceed 24 characters";
    }

    if (!RegExp(r'^[A-Za-z0-9_.]+$').hasMatch(value) && value.isNotEmpty) {
      return "Values must be alphanumeric";
    }

    // TODO: TEST
    if (_validate && value.isEmpty) {
      return "Please enter your username";
    }

    return null;
  }

  void _onLoginPressed() {
    const CupertinoAlertDialog(
      title: Text("Dialog Title"),
      content: Text("This is my content"),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text("Yes"),
        ),
        CupertinoDialogAction(
          child: Text("No"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final brands = [
      AssetImages.youtube,
      AssetImages.spotify,
      AssetImages.facebook,
    ];

    final size = MediaQuery.of(context).size;
    final enableEnterButton = _controller.text.isNotEmpty;

    // TODO: handle error message
    return Material(
      child: Stack(
        children: [
          Scaffold(
            body: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 20.0,
              ),
              children: [
                SizedBox(
                  height: 400.0,
                  child: Stack(
                    children: <Widget>[
                      ...brands
                          .asMap()
                          .map(
                            (index, item) => MapEntry(
                              index,
                              Positioned(
                                top: 200.0 + (index * 30),
                                left: 50.0 + (index * 60),
                                child: SizedBox(
                                  height: 100.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: item,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .values
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextFormField(
                    controller: _controller,
                    textAlign: TextAlign.center,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintStyle: TextStyle(fontWeight: FontWeight.w300),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    onChanged: (value) {
                      // TODO
                      setState(() {
                        _controller.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                      });
                    },
                    validator: (value) => _validateUsername(value),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor:
                          enableEnterButton ? Colors.green : Colors.grey[700],
                      backgroundColor:
                          enableEnterButton ? Colors.green : Colors.grey[350],
                      minimumSize: const Size(88, 44),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10.0,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      ),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            enableEnterButton ? Colors.green : Colors.grey[700],
                      ),
                    ),
                    onPressed: enableEnterButton
                        ? () {
                            setState(() {
                              _controller.text.isEmpty
                                  ? _validate = true
                                  : _validate = false;
                            });

                            // TODO: TEST with validator
                            _onLoginPressed();

                            _showPinDialog(context);
                          }
                        : null,
                    child: Text(
                      'Enter',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            enableEnterButton ? Colors.white : Colors.grey[700],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (widget.isLoading) ...[
            Container(
              color: Colors.black.withOpacity(0.5),
              height: size.height,
              child: const SizedBox(
                height: 20.0,
                child: Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                ),
              ),
            ),
            const Text(
              'Logging In',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ],
      ),
    );
  }

  void _showPinDialog(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      padding: EdgeInsets.zero,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: Colors.transparent),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final pinController = TextEditingController();
        return CupertinoAlertDialog(
          title: const Text("Verify it's you"),
          content: Column(
            children: [
              const Text("Please enter your 6 digit PIN"),
              Material(
                color: Colors.transparent,
                child: Pinput(
                  focusNode: _node,
                  length: 6,
                  controller: pinController,
                  defaultPinTheme: defaultPinTheme,
                  preFilledWidget: const Text(
                    "-",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: Colors.transparent),
                    ),
                  ),
                  onCompleted: (pin) => debugPrint(pin),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                _node.unfocus();
                Navigator.pop(context, pinController.text);
                pinController.dispose();
              },
              child: const Text(
                'Enter',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16.0,
                ),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () {
                _node.unfocus();
                Navigator.pop(context, null);
                pinController.dispose();
              },
              child: const Text(
                "Close",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                ),
              ),
            )
          ],
        );
      },
    ).then((text) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) FocusScope.of(context).unfocus();
      });
      if (text == null) return;

      if (!text.isEmpty) {
        widget.onLogin(_controller.text, text);
      }
    });
  }
}
