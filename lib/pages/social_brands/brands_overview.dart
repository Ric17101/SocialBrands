import 'package:flutter/material.dart';
import 'package:socials_app_flutter/pages/social_brand_details/social_brand_details.dart';
import 'package:socials_app_flutter/pages/social_brand_item_widget.dart';
import 'package:socials_app_flutter/pages/user_appbar_widget.dart';
import 'package:socials_app_flutter/state/models/async_result.dart';
import 'package:socials_app_flutter/state/models/social_brand_item_ui.dart';

class BrandsOverview extends StatefulWidget {
  const BrandsOverview({
    required this.brandItemUiList,
    super.key,
  });

  final AsyncResult<List<SocialBrandItemUi>> brandItemUiList;

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              SocialBrandDetails(itemUi: brandItem),
                        ),
                      );
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

    return Scaffold(
      appBar: const UserAppBarWidget(
        userName: 'test',
        userId: '123123',
        thumbnail: "https://indexcodex.com/api/v1/assets/userimage.png",
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          if (loading) return const Center(child: CircularProgressIndicator());

          return GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 30.0,
            ),
            children: <Widget>[
              ...items,
              Container(
                margin: const EdgeInsets.all(24.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset('assets/images/visit.png'),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
