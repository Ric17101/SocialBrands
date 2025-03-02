import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:socials_app_flutter/pages/login/login_page_connector.dart';
import 'package:socials_app_flutter/pages/social_brand_details/social_brand_details_page.dart';
import 'package:socials_app_flutter/pages/social_brands/brands_overview_connector.dart';
import 'package:socials_app_flutter/state/actions/actions.dart';
import 'package:socials_app_flutter/state/app_state.dart';
import 'package:socials_app_flutter/state/models/async_result.dart';
import 'package:socials_app_flutter/state/models/social_brand_item_ui.dart';
import 'package:socials_app_flutter/state/models/user_detail_ui.dart';

class BrandsOverviewVmFactory
    extends VmFactory<AppState, BrandsOverviewConnector> {
  @override
  Vm fromStore() => BrandsOverviewVm(
        user: _getUserDetailUi,
        onLogout: _onLogout,
        brandItemUiList: _brandItemUiList,
        onNavigateToSocialBrandDetailsPage: _onNavigateToSocialBrandDetailsPage,
      );

  AsyncResult<UserDetailUi> get _getUserDetailUi {
    final userDetailUi = UserDetailUi(
      userId: state.user?.userId ?? '',
      userName: state.user?.userName ?? '',
      loginStatus: state.user?.loginStatus ?? '',
      profilePicture: state.user?.profilePicture ?? '',
    );

    if (isPageLoading(_pageKeys)) return AsyncResult.loading(userDetailUi);

    return AsyncResult.success(userDetailUi);
  }

  AsyncResult<List<SocialBrandItemUi>> get _brandItemUiList {
    final brandList = state.data.brands
        .map((brand) => SocialBrandItemUi(
              name: brand.name,
              history: brand.history,
              iconUrl: brand.iconUrl,
              imgUrl: brand.imgUrl,
              webUrl: brand.webUrl,
              color: _brandColorMapper(brand.name),
            ))
        .toList();

    if (isPageLoading(_pageKeys)) return AsyncResult.loading(brandList);

    return AsyncResult.success(brandList);
  }

  void _onNavigateToSocialBrandDetailsPage(SocialBrandItemUi itemUi) {
    dispatch(
      NavigateAction.pushNamed(
        SocialBrandDetailsPage.route,
        arguments: SocialBrandDetailsArgs(itemUi: itemUi),
      ),
    );
  }

  bool isPageLoading(List<String> keys) => _isWaitingForKeys(keys);

  bool _isWaitingForKeys(List<String> keys) =>
      keys.any((k) => state.wait.isWaitingFor(k));

  static const _pageKeys = [
    GetDataAction.key,
    LogoutUserAction.key,
  ];

  Color _brandColorMapper(String name) {
    if (name.toLowerCase().contains("facebook")) return Colors.blue;
    if (name.toLowerCase().contains("spotify")) return Colors.green;
    if (name.toLowerCase().contains("youtube")) return Colors.red;
    return Colors.white;
  }

  void _onLogout() {
    dispatch(LogoutUserAction());
    dispatch(NavigateAction.pushNamedAndRemoveUntil(
      LoginPageConnector.route,
      (route) => false,
    ));
  }
}

class BrandsOverviewVm extends Vm {
  BrandsOverviewVm({
    required this.brandItemUiList,
    required this.onNavigateToSocialBrandDetailsPage,
    required this.onLogout,
    required this.user,
  }) : super(equals: [brandItemUiList, user]);

  final AsyncResult<List<SocialBrandItemUi>> brandItemUiList;
  final AsyncResult<UserDetailUi> user;
  final Function(SocialBrandItemUi itemUi) onNavigateToSocialBrandDetailsPage;
  final VoidCallback onLogout;
}
