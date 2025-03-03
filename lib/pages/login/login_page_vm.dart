import 'package:async_redux/async_redux.dart';
import 'package:socials_app_flutter/api/models/user_model.dart';
import 'package:socials_app_flutter/pages/social_brands/brands_overview_connector.dart';
import 'package:socials_app_flutter/state/actions/actions.dart';
import 'package:socials_app_flutter/state/app_state.dart';
import 'package:socials_app_flutter/state/models/async_result.dart';
import 'package:socials_app_flutter/state/models/user_detail_ui.dart';
import 'package:socials_app_flutter/utilities/dialog_handler.dart';

class LoginPageVmFactory extends VmFactory<AppState, BrandsOverviewConnector> {
  @override
  Vm fromStore() => LoginPageVm(
        userDetailUi: _userDetailUi,
        onLogin: (username, pin) => _onLogin(username, pin),
        isLoading: _isPageLoading(),
        isLoggedIn: state.user != null,
        user: state.user,
        dialogEvent: state.dialogEvent,
      );

  AsyncResult<UserDetailUi> get _userDetailUi {
    final user = UserDetailUi(
      userId: state.user?.userId ?? '',
      userName: state.user?.userName ?? '',
      loginStatus: state.user?.loginStatus ?? '',
      profilePicture: state.user?.profilePicture ?? '',
    );

    if (_isPageLoading()) return AsyncResult.loading(user);

    return AsyncResult.success(user);
  }

  // void _onSetDialogEventAction() {
  //   final context = navigatorKey.currentContext;
  //   dispatch(
  //     SetDialogEventAction(
  //       SimpleDialogHandler(
  //         headerText: 'global_completeProcess_button'.localized,
  //         descriptionText: 'touroverview_completetour_copytext'.localized,
  //         confirmText: 'touriverview_completetour_header'.localized,
  //         cancelText: 'global_cancel'.localized,
  //         onTap: _onSetTourCompleted,
  //       ),
  //     ),
  //   );
  // }

  bool _isPageLoading() => _isWaitingForKeys();

  bool _isWaitingForKeys() => _pageKeys.any((k) => state.wait.isWaitingFor(k));

  static const _pageKeys = [
    LoginAction.key,
    GetLoggedInUserAction.key,
  ];

  void _onLogin(String? username, String? pin) {
    dispatch(LoginAction(username: username ?? '', pin: pin ?? ''));
  }
}

class LoginPageVm extends Vm {
  LoginPageVm({
    required this.userDetailUi,
    required this.onLogin,
    required this.isLoading,
    required this.isLoggedIn,
    required this.user,
    required this.dialogEvent,
  }) : super(equals: [
          userDetailUi,
          isLoading,
          isLoggedIn,
          user,
          dialogEvent,
        ]);

  final AsyncResult<UserDetailUi> userDetailUi;
  final Function(String? username, String? pin) onLogin;
  final bool isLoading;
  final bool isLoggedIn;
  final Event<DialogHandler>? dialogEvent;
  final UserModel? user;
}
