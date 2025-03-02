import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:socials_app_flutter/pages/login/login_page.dart';
import 'package:socials_app_flutter/state/app_state.dart';

class SocialBrandsApp extends StatelessWidget {
  final store = Store<AppState>(initialState: AppState.init());

  SocialBrandsApp({super.key});

  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
            useMaterial3: true,
          ),
          home: const LoginPage(),
        ),
      );
}
