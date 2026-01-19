import 'package:cash_back_infor/features/ui/utils/button_primary.dart';
import 'package:cash_back_infor/features/theme/color_theme.dart';
import 'package:cash_back_infor/features/theme/text_decoration.dart';
import 'package:cash_back_infor/utils/text_define.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.signupWelcomeBg),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 45),
            Text(
              AppString.signupWelcome,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.signupWelcomeText,
              textAlign: TextAlign.center,
            ),
            Image.asset(AssetString.signupWelcomeAsset),
            SizedBox(height: 60),
            PrimaryButton(
              text: AppString.signupWelcomePrimary,
              onPressed: () {
                context.push('/name-input');
              },
            ),
          ],
        ),
      ),
    );
  }
}
