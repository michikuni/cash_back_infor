import 'package:cash_back_infor/features/theme/color_theme.dart';
import 'package:cash_back_infor/features/theme/text_decoration.dart';
import 'package:cash_back_infor/utils/text_define.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseNotiDiaLogWidget extends StatelessWidget {
  const BaseNotiDiaLogWidget({
    super.key,
    required this.child,
    required this.imageUrl,
    required this.title,
    required this.height,
  });
  final Widget child;
  final String title;
  final String imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: AppColor.pureWhite,
        ),
        height: height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: height - 4,
                decoration: BoxDecoration(
                  color: AppColor.pureWhite,
                  borderRadius: BorderRadius.circular(36),
                ),
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(imageUrl,height: 146,width: 176,),
                    SizedBox(height: 12,),
                    Text(
                      AppString.baseNotiTitleText,
                      style: Theme.of(context).textTheme.bodyLarge?.baseNotiTitleText
                    ),
                    SizedBox(height: 12,),
                    Text(title, style: Theme.of(context).textTheme.bodySmall?.baseNotiText, textAlign: TextAlign.center,),
                    SizedBox(height: 24),
                    child           
                  ],
                ),
              ),
            ),
            Positioned(
              top: -4,
              right: -4,
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.pureWhite,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(2),
                  child: const Icon(
                    Icons.cancel_rounded,
                    color: AppColor.mediumGrey,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
