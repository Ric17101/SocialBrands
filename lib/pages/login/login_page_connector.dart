import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:socials_app_flutter/pages/login/login_page_vm.dart';
import 'package:socials_app_flutter/pages/login/login_page.dart';
import 'package:socials_app_flutter/state/actions/actions.dart';
import 'package:socials_app_flutter/state/app_state.dart';
import 'package:socials_app_flutter/utilities/dialog_handler.dart';

class LoginPageConnector extends StatelessWidget {
  static const String route = 'login-page';

  const LoginPageConnector({super.key});

  void _showDialog(BuildContext context, DialogHandler? dialogHandler) =>
      dialogHandler?.showDialogHandler(context, dialogHandler);

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, LoginPageVm>(
        vm: () => LoginPageVmFactory(),
        onInitialBuild: (_, store, __) => store.dispatch(
          GetLoggedInUserAction(),
        ),
        onDidChange: (context, store, vm) {
          if (context != null && context.mounted == true) {
            _showDialog(context, vm.dialogEvent?.consume());
          }
        },
        builder: (context, vm) => LoginPage(
          onLogin: vm.onLogin,
          isLoading: vm.isLoading,
          user: vm.user,
        ),
      );
}
