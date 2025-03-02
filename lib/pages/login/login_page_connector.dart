import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:socials_app_flutter/pages/login/login_page_vm.dart';
import 'package:socials_app_flutter/pages/login/login_page.dart';
import 'package:socials_app_flutter/state/actions/actions.dart';
import 'package:socials_app_flutter/state/app_state.dart';

class LoginPageConnector extends StatelessWidget {
  static const String route = 'login-page';

  const LoginPageConnector({super.key});

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, LoginPageVm>(
        vm: () => LoginPageVmFactory(),
        onInitialBuild: (_, store, __) => store.dispatch(
          GetLoggedInUserAction(),
        ),
        builder: (context, vm) => LoginPage(
          onLogin: vm.onLogin,
          isLoading: vm.isLoading,
          isLoggedIn: vm.isLoggedIn,
          user: vm.user,
        ),
      );
}
