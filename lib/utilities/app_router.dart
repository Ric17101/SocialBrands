import 'package:flutter/material.dart';
import 'package:socials_app_flutter/pages/login/login_page_connector.dart';
import 'package:socials_app_flutter/pages/social_brand_details/social_brand_details_page.dart';
import 'package:socials_app_flutter/pages/social_brands/brands_overview_connector.dart';
import 'package:socials_app_flutter/social_brands_app.dart';
import 'package:socials_app_flutter/state/models/social_brand_item_ui.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case SocialBrandsApp.route:
        return MaterialPageRoute<void>(builder: (_) => SocialBrandsApp());
      case LoginPageConnector.route:
        return MaterialPageRoute<void>(
          builder: (_) => const LoginPageConnector(),
        );
      case BrandsOverviewConnector.route:
        return MaterialPageRoute<void>(
          builder: (_) => const BrandsOverviewConnector(),
        );
      case SocialBrandDetailsPage.route:
        final args = arguments is SocialBrandDetailsArgs
            ? arguments
            : SocialBrandDetailsArgs(itemUi: null);
        return MaterialPageRoute<void>(
          builder: (_) => SocialBrandDetailsPage(
            itemUi: args.itemUi ?? const SocialBrandItemUi(),
          ),
        );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Error: No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
