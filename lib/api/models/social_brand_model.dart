import 'dart:convert';

List<SocialBrandModel> welcomeFromJson(String str) =>
    List<SocialBrandModel>.from(json.decode(str).map((x) => SocialBrandModel.fromJson(x)));

String welcomeToJson(List<SocialBrandModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SocialBrandModel {
  String name;
  String history;
  String iconUrl;
  String imgUrl;
  String webUrl;

  SocialBrandModel({
    required this.name,
    required this.history,
    required this.iconUrl,
    required this.imgUrl,
    required this.webUrl,
  });

  factory SocialBrandModel.fromJson(Map<String, dynamic> json) => SocialBrandModel(
        name: json["name"],
        history: json["history"],
        iconUrl: json["iconUrl"],
        imgUrl: json["imgUrl"],
        webUrl: json["webUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "history": history,
        "iconUrl": iconUrl,
        "imgUrl": imgUrl,
        "webUrl": webUrl,
      };
}
