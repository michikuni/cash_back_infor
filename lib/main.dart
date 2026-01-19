import 'package:cash_back_infor/features/routers/app_routers.dart';
import 'package:cash_back_infor/features/theme/style_defaults.dart';

import './di/setup.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const MonkeyApp());
}

class MonkeyApp extends StatelessWidget {
  const MonkeyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.appRouters,
      theme: StyleDefault.lightTheme
    );
  }
}
