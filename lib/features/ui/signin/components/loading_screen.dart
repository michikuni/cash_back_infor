import 'package:cash_back_infor/features/theme/color_theme.dart';
import 'package:cash_back_infor/utils/text_define.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.signinLoadBg,
      ),
      child: Image.asset(AssetString.loadAssset),
    );
  }
}
