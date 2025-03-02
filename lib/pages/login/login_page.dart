import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = TextEditingController();
  bool _validate = false;

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
      Image.asset('assets/images/youtube.png'),
      Image.asset('assets/images/spotify.png'),
      Image.asset('assets/images/facebook.png'),
    ];

    return Scaffold(
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
                foregroundColor: Colors.grey[700],
                minimumSize: const Size(88, 44),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
                backgroundColor: Colors.grey[350],
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                setState(() {
                  _controller.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                });

                // TODO: TEST with validator
                _onLoginPressed();
              },
              child: const Text('Enter'),
            ),
          ),
        ],
      ),
    );
  }
}
