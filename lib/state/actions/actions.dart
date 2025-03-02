import 'dart:async';

import 'package:async_redux/async_redux.dart';

import 'package:socials_app_flutter/main.dart';
import 'package:socials_app_flutter/state/app_state.dart';
import 'package:socials_app_flutter/api/api_service.dart';

/// Reusable loading page state for request action
abstract class LoadingAction extends ReduxAction<AppState> {
  LoadingAction({required this.actionKey});

  final String actionKey;

  @override
  Future<void> before() async => await dispatchAsync(WaitAction.add(actionKey));

  @override
  void after() => dispatch(WaitAction.remove(actionKey));
}

/// Get Data request action
class GetDataAction extends LoadingAction {
  GetDataAction() : super(actionKey: key);

  static const key = 'get-data-action';

  @override
  Future<AppState> reduce() async {
    final data = await getIt<ApiService>().brandsApi.brandsApi.getData();

    return state.copyWith(data: data);
  }
}

/// Get brands request action
class LoadDataAction extends LoadingAction {
  LoadDataAction() : super(actionKey: key);

  static const key = 'load-data-action';

  @override
  Future<AppState> reduce() async {
    final data = await getIt<ApiService>().brandsApi.brandsApi.getData();

    return state.copyWith(data: data);
  }
}
