import 'dart:async';
import 'dart:convert';
import 'package:async_redux/async_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socials_app_flutter/api/models/user_model.dart';
import 'package:socials_app_flutter/main.dart';
import 'package:socials_app_flutter/pages/social_brands/brands_overview_connector.dart';
import 'package:socials_app_flutter/state/app_state.dart';
import 'package:socials_app_flutter/api/api_service.dart';

const String USER_PREFERENCES_KEY = 'user';

/// Reusable loading page state for request action
abstract class LoadingAction extends ReduxAction<AppState> {
  LoadingAction({required this.actionKey});

  final String actionKey;

  @override
  Future<void> before() async => await dispatchAsync(WaitAction.add(actionKey));

  @override
  void after() => dispatch(WaitAction.remove(actionKey));
}

/// Get Data api request action
class GetDataAction extends LoadingAction {
  GetDataAction() : super(actionKey: key);

  static const key = 'get-data-action';

  @override
  Future<AppState> reduce() async {
    final data = await getIt<ApiService>().brandsApi.brandsApi.getData();

    return state.copyWith(data: data);
  }
}

/// GET Logged in user from shared preference
class GetLoggedInUserAction extends LoadingAction {
  GetLoggedInUserAction() : super(actionKey: key);

  static const key = 'get-logged-in-user-action';

  @override
  Future<AppState> reduce() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();

    final userData = await prefs.getString(USER_PREFERENCES_KEY) ?? '';
    final UserModel? userModel =
        userData.isNotEmpty ? UserModel.fromJson(jsonDecode(userData)) : null;
    // TODO: remove these lines
    print("SHAREPRE: ${state.user?.userName}");
    print("SHAREPRE: ${userModel?.userName}");

    if (userModel != null) {
      store.dispatch(NavigateAction.pushNamed(BrandsOverviewConnector.route));
    }

    return state.copyWith(user: userModel);
  }
}

/// Log out user and delete from shared preference
class LogoutUserAction extends LoadingAction {
  LogoutUserAction() : super(actionKey: key);

  static const key = 'log-out-user-action';

  @override
  Future<AppState> reduce() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    await prefs.remove(USER_PREFERENCES_KEY);
    await prefs.clear();

    return state.copyWith(user: null);
  }
}

/// Login Action
class LoginAction extends LoadingAction {
  LoginAction({
    required this.username,
    required this.pin,
  }) : super(actionKey: key);

  final String username;
  final String pin;
  static const key = 'login-action';

  @override
  Future<AppState> reduce() async {
    final user =
        await getIt<ApiService>().loginApi.loginApi.login(username, pin);

    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    await prefs.setString(
        USER_PREFERENCES_KEY, jsonEncode(UserModel.fromJson(user.toJson())));

    store.dispatch(NavigateAction.pushNamed(BrandsOverviewConnector.route));

    return state.copyWith(user: user);
  }
}
