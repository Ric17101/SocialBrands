import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:socials_app_flutter/pages/login/login_page_connector.dart';
import 'package:socials_app_flutter/pages/others/other_pages.dart';
import 'package:socials_app_flutter/state/app_state.dart';
import 'package:socials_app_flutter/utilities/app_router.dart';

class SocialBrandsApp extends StatelessWidget {
  static const String route = '/';
  final store = Store<AppState>(initialState: AppState.init());

  SocialBrandsApp({super.key});

  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white,
              primary: Colors.blue,
              secondary: Colors.blue,
            ),
            useMaterial3: true,
          ),
          home: PopScope(
            canPop: false,
            onPopInvoked: (didPop) async {
              bool canPop = await _onWillPop(context);
              if (canPop) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (context.mounted) Navigator.pop(context, null);
                });
              } else {
                return;
              }
            },
            child: Navigator(
              key: navigatorKey,
              initialRoute: LoginPageConnector.route,
              // initialRoute: OtherPages.route,
              onGenerateRoute: AppRouter().generateRoute,
            ),
          ),
        ),
      );

  Future _onWillPop(BuildContext context) async {
    final currentState = navigatorKey.currentState;
    if (currentState == null) return false;
    return !await currentState.maybePop();
  }
}
