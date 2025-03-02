import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:socials_app_flutter/pages/social_brands/brands_overview.dart';
import 'package:socials_app_flutter/pages/social_brands/brands_overview_vm.dart';
import 'package:socials_app_flutter/state/actions/actions.dart';
import 'package:socials_app_flutter/state/app_state.dart';

class BrandsOverviewConnector extends StatelessWidget {
  const BrandsOverviewConnector({super.key});

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, BrandsOverviewVm>(
        vm: () => BrandsOverviewVmFactory(),
        onInitialBuild: (_, store, __) => store.dispatch(GetDataAction()),
        builder: (context, vm) => BrandsOverview(
          brandItemUiList: vm.brandItemUiList,
        ),
      );
}
