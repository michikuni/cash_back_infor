import 'package:cash_back_infor/features/theme/color_theme.dart';
import 'package:cash_back_infor/features/theme/text_decoration.dart';
import 'package:cash_back_infor/utils/text_define.dart';
import 'package:flutter/material.dart';

class FakeLoadingWidget extends StatelessWidget {
  const FakeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.signupLoadBg),
      padding: EdgeInsets.all(44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            maxLines: null,
            AppString.signupLoadText,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.signupLoadTitleText,
          ),
          SizedBox(height: 56),
          Image.asset(AssetString.signupLoadAsset),
          SizedBox(height: 66),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: AppColor.signupLoadCheckIc),
                    Expanded(
                      child: Text(
                        maxLines: null,
                        AppString.signupLoad1Text,
                        style: Theme.of(context).textTheme.bodySmall?.signupLoadText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: AppColor.signupLoadCheckIc),
                    Text(
                      textAlign: TextAlign.center,
                      maxLines: null,
                      AppString.signupLoad2Text,
                      style: Theme.of(context).textTheme.bodySmall?.signupLoadText,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: AppColor.signupLoadCheckIc),
                    Text(
                      textAlign: TextAlign.center,
                      maxLines: null,
                      AppString.signupLoad3Text,
                      style: Theme.of(context).textTheme.bodySmall?.signupLoadText,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
