import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:socials_app_flutter/api/api_service.dart';
import 'package:socials_app_flutter/social_brands_app.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  runApp(const SocialBrandsApp());
}
