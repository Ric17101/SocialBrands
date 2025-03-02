import 'dart:ui';

import 'package:async_redux/async_redux.dart';
import 'package:socials_app_flutter/pages/social_brands/brands_overview_connector.dart';
import 'package:socials_app_flutter/state/actions/actions.dart';
import 'package:socials_app_flutter/state/app_state.dart';
import 'package:socials_app_flutter/state/models/async_result.dart';
import 'package:socials_app_flutter/state/models/social_brand_item_ui.dart';

class BrandsOverviewVmFactory
    extends VmFactory<AppState, BrandsOverviewConnector> {
  @override
  Vm fromStore() => BrandsOverviewVm(
        brandItemUiList: _brandItemUiList,
      );

  AsyncResult<List<SocialBrandItemUi>> get _brandItemUiList {
    final brandList = state.data.brands
        .map((brand) => SocialBrandItemUi(
              name: brand.name ?? '',
              history: brand.history ?? '',
              iconUrl: brand.iconUrl ?? '',
              imgUrl: brand.imgUrl ?? '',
              webUrl: brand.webUrl ?? '',
            ))
        .toList();

    if (isPageLoading(_pageKeys)) return AsyncResult.loading(brandList);

    return AsyncResult.success(brandList);
  }

  bool isPageLoading(List<String> keys) => _isWaitingForKeys(keys);

  bool _isWaitingForKeys(List<String> keys) =>
      keys.any((k) => state.wait.isWaitingFor(k));

  static const _pageKeys = [
    GetDataAction.key,
  ];
}

class BrandsOverviewVm extends Vm {
  BrandsOverviewVm({
    required this.brandItemUiList,
  }) : super(equals: [brandItemUiList]);

  final AsyncResult<List<SocialBrandItemUi>> brandItemUiList;
}
