import 'package:cash_back_infor/ui/signup/cubit/signup_cubit.dart';
import 'package:cash_back_infor/ui/signup/cubit/signup_state.dart';
import 'package:cash_back_infor/ui/utils/button_primary.dart';
import 'package:cash_back_infor/utils/color.dart';
import 'package:cash_back_infor/utils/text_decoration_extension.dart';
import 'package:cash_back_infor/utils/text_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BirthSelectionWidget extends StatefulWidget {
  const BirthSelectionWidget({super.key});

  @override
  State<BirthSelectionWidget> createState() => _BirthSelectionWidgetState();
}

class _BirthSelectionWidgetState extends State<BirthSelectionWidget> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<SignupCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                        Image.asset(AssetString.signupBirthAsset),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${state.name.value}${AppString.signupBirthText}',
                            maxLines: null,
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall?.signupBirthText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        int year = 2021 - index;
                        final isSelected = selectedIndex == year;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = year;
                              context.read<SignupCubit>().birthSelected(year);
                            });
                          },
                          child: _buildYearButton(year.toString(), isSelected),
                        );
                      },
                    ),

                    const SizedBox(height: 12),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = 2009;
                          context.read<SignupCubit>().birthSelected(2009);
                        });
                      },
                      child: _buildYearButton(
                        AppString.signupBuildYearButton,
                        selectedIndex == 2009,
                        isFullWidth: true,
                      ),
                    ),
                    Expanded(child: Container()),
                    PrimaryButton(
                      text: AppString.signupBirthPrimary,
                      onPressed: () {
                        context.push('/english-level');
                      },
                      enabled: (selectedIndex != null),
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

Widget _buildYearButton(
  String text,
  bool isSelected, {
  bool isFullWidth = false,
}) {
  return Container(
    width: isFullWidth ? double.infinity : null,
    height: isFullWidth ? 60 : null,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isSelected ? AppColor.signupBuildYearButtonSelecBg: AppColor.signupBuildYearButtonUnselecBg,
      border: Border.all(
        color: isSelected ? AppColor.signupBuildYearButtonSelecBorder : AppColor.signupBuildYearButtonUnselecBorder,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: isSelected ? AppColor.signupBuildYearButtonSelecText : AppColor.signupBuildYearButtonUnselecText,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
