import 'package:cash_back_infor/features/theme/color_theme.dart';
import 'package:cash_back_infor/features/theme/text_decoration.dart';
import 'package:cash_back_infor/utils/text_define.dart';
import 'package:flutter/material.dart';

class SignupLoadingWidget extends StatefulWidget {
  const SignupLoadingWidget({super.key});

  @override
  State<SignupLoadingWidget> createState() => _SignupLoadingWidgetState();
}

class _SignupLoadingWidgetState extends State<SignupLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _circleProgressController;
  late Animation<double> _animationValue;
  @override
  void initState() {
    super.initState();
    _circleProgressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationValue =
        Tween<double>(begin: 0.0, end: 1.0).animate(_circleProgressController)
          ..addListener(() {
            setState(() {});
          });
    _circleProgressController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _circleProgressController.dispose();
  }

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
            style: Theme.of(context).textTheme.titleMedium?.signupLoadTitleText,
          ),
          SizedBox(height: 108),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 216,
                height: 216,
                child: CircularProgressIndicator(
                  color: AppColor.signupLoadCheckIc,
                  value: _animationValue.value,
                  strokeWidth: 24,
                  strokeCap: StrokeCap.round,
                ),
              ),
              Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                  border: Border.all(color: AppColor.platinum, width: 1),
                ),
              ),
              Center(
                child: Text(
                  '${(_animationValue.value*100).toInt()}%',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium?.signupLoadText,
                ),
              ),
            ],
          ),
          SizedBox(height: 132),
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
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.signupLoadText,
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
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.signupLoadText,
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
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.signupLoadText,
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
