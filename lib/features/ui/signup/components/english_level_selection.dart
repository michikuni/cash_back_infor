import 'package:cash_back_infor/features/ui/signup/components/loading_screen.dart';
import 'package:cash_back_infor/features/ui/signup/cubit/signup_cubit.dart';
import 'package:cash_back_infor/features/ui/signup/cubit/signup_state.dart';
import 'package:cash_back_infor/features/ui/utils/button_primary.dart';
import 'package:cash_back_infor/features/theme/color_theme.dart';
import 'package:cash_back_infor/features/theme/text_decoration.dart';
import 'package:cash_back_infor/utils/text_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class EnglishLevelSelectionWidget extends StatefulWidget {
  const EnglishLevelSelectionWidget({super.key});

  @override
  State<EnglishLevelSelectionWidget> createState() =>
      _EnglishLevelSelectionWidget();
}

class _EnglishLevelSelectionWidget extends State<EnglishLevelSelectionWidget> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<SignupCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AssetString.signupEnglishLevelAsset),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            AppString.signupEnglishLevelText,
                            maxLines: null,
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall?.signupEnglishLevelText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          context.read<SignupCubit>().englishLevel(
                            EnglishLevel.unknown,
                          );
                        });
                      },
                      child: Container(
                        height: 88,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: (state.englishLevel == EnglishLevel.unknown)
                                ? AppColor.signupEnglishLevelSelectBorder
                                : AppColor.signupEnglishLevelUnselectBorder,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: (state.englishLevel == EnglishLevel.unknown)
                              ? AppColor.signupEnglishLevelSelectBg
                              : AppColor.signupEnglishLevelUnselectBg,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(AssetString.signupEnglishLevel1Asset),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                maxLines: null,
                                AppString.signupEnglishLevel1Text,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color:
                                          (state.englishLevel ==
                                              EnglishLevel.unknown)
                                          ? AppColor
                                                .signupEnglishLevelSelectText
                                          : AppColor
                                                .signupEnglishLevelUnselectText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          context.read<SignupCubit>().englishLevel(
                            EnglishLevel.word,
                          );
                        });
                      },
                      child: Container(
                        height: 88,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: (state.englishLevel == EnglishLevel.word)
                                ? AppColor.signupEnglishLevelSelectBorder
                                : AppColor.signupEnglishLevelUnselectBorder,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: (state.englishLevel == EnglishLevel.word)
                              ? AppColor.signupEnglishLevelSelectBg
                              : AppColor.signupEnglishLevelUnselectBg,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(AssetString.signupEnglishLevel2Asset),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                maxLines: null,
                                AppString.signupEnglishLevel2Text,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color:
                                          (state.englishLevel ==
                                              EnglishLevel.word)
                                          ? AppColor
                                                .signupEnglishLevelSelectText
                                          : AppColor
                                                .signupEnglishLevelUnselectText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          context.read<SignupCubit>().englishLevel(
                            EnglishLevel.sentence,
                          );
                        });
                      },
                      child: Container(
                        height: 88,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: (state.englishLevel == EnglishLevel.sentence)
                                ? AppColor.signupEnglishLevelSelectBorder
                                : AppColor.signupEnglishLevelUnselectBorder,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: (state.englishLevel == EnglishLevel.sentence)
                              ? AppColor.signupEnglishLevelSelectBg
                              : AppColor.signupEnglishLevelUnselectBg,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(AssetString.signupEnglishLevel3Asset),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                maxLines: null,
                                AppString.signupEnglishLevel3Text,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color:
                                          (state.englishLevel ==
                                              EnglishLevel.sentence)
                                          ? AppColor
                                                .signupEnglishLevelSelectText
                                          : AppColor
                                                .signupEnglishLevelUnselectText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          context.read<SignupCubit>().englishLevel(
                            EnglishLevel.paragraph,
                          );
                        });
                      },
                      child: Container(
                        height: 88,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color:
                                (state.englishLevel == EnglishLevel.paragraph)
                                ? AppColor.signupEnglishLevelSelectBorder
                                : AppColor.signupEnglishLevelUnselectBorder,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: (state.englishLevel == EnglishLevel.paragraph)
                              ? AppColor.signupEnglishLevelSelectBg
                              : AppColor.signupEnglishLevelUnselectBg,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(AssetString.signupEnglishLevel4Asset),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                maxLines: null,
                                AppString.signupEnglishLevel4Text,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color:
                                          (state.englishLevel ==
                                              EnglishLevel.paragraph)
                                          ? AppColor
                                                .signupEnglishLevelSelectText
                                          : AppColor
                                                .signupEnglishLevelUnselectText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Expanded(child: Container()),
                    BlocListener<SignupCubit, SignupState>(
                      listenWhen: (prev, curr) => prev.status != curr.status,
                      listener: (context, state) {
                        if (state.status == FormzSubmissionStatus.inProgress) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const SignupLoadingWidget(),
                          );
                        }

                        if (state.status == FormzSubmissionStatus.success) {
                          context.go('/cash-back');
                        }

                        if (state.status == FormzSubmissionStatus.failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(AppString.signupFailure),
                            ),
                          );
                          context.go('/sign-up');
                        }
                      },
                      child: PrimaryButton(
                        text: AppString.signupEnglishLevelPrimaryButton,
                        onPressed: () {
                          context.read<SignupCubit>().submit();
                        },
                        enabled: state.englishLevel != EnglishLevel.unselected,
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
