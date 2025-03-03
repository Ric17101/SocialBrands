import 'package:flutter/material.dart';
import 'package:socials_app_flutter/pages/others/other_pages.dart';
import 'package:socials_app_flutter/pages/social_brand_item_widget.dart';
import 'package:socials_app_flutter/pages/user_appbar_widget.dart';
import 'package:socials_app_flutter/state/models/async_result.dart';
import 'package:socials_app_flutter/state/models/social_brand_item_ui.dart';
import 'package:socials_app_flutter/state/models/user_detail_ui.dart';
import 'package:socials_app_flutter/utilities/asset_images.dart';

class BrandsOverview extends StatefulWidget {
  const BrandsOverview({
    required this.brandItemUiList,
    required this.onNavigateToSocialBrandDetailsPage,
    required this.onLogout,
    super.key,
    required this.user,
  });

  final AsyncResult<List<SocialBrandItemUi>> brandItemUiList;
  final AsyncResult<UserDetailUi> user;
  final Function(SocialBrandItemUi itemUi) onNavigateToSocialBrandDetailsPage;
  final VoidCallback onLogout;

  @override
  State<BrandsOverview> createState() => _BrandsOverviewState();
}

class _BrandsOverviewState extends State<BrandsOverview> {
  bool get loading => widget.brandItemUiList
      .maybeWhen(loading: (_) => true, orElse: () => false);

  @override
  Widget build(BuildContext context) {
    final items = widget.brandItemUiList.maybeWhen(
      success: (brandItems) =>
          brandItems
              ?.map((brandItem) => SocialBrandItemWidget(
                    thumbnail: brandItem.iconUrl,
                    onTap: () {
                      widget.onNavigateToSocialBrandDetailsPage(brandItem);
                    },
                  ))
              .toList() ??
          List.empty(),
      loading: (brandItems) =>
          brandItems
              ?.map((brandItem) => const SocialBrandItemWidget())
              .toList() ??
          List.empty(),
      orElse: () => List.empty(),
    );

    final userName = widget.user.maybeWhen(
      success: (user) => user?.userName ?? '',
      orElse: () => '',
    );
    final userId = widget.user.maybeWhen(
      success: (user) => user?.userId ?? '',
      orElse: () => '',
    );
    final profilePicture = widget.user.maybeWhen(
      success: (user) => user?.profilePicture ?? '',
      orElse: () => '',
    );

    return Scaffold(
      appBar: UserAppBarWidget(
        userName: userName,
        userId: userId,
        profilePicture: profilePicture,
        onLogout: () => widget.onLogout(),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          if (loading) {
            return const Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text(
                  'Fetching Data',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ));
          }

          return GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 30.0,
            ),
            children: <Widget>[
              ...items,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => OtherPages(
                        itemUi: SocialBrandItemUi(
                          name: 'Others',
                          color: Colors.yellow[700],
                          image: AssetImages.others,
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(24.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: AssetImages.others,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
