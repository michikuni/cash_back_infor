import 'package:cash_back_infor/ui/signup/components/loading_screen.dart';
import 'package:cash_back_infor/ui/signup/cubit/signup_cubit.dart';
import 'package:cash_back_infor/ui/signup/cubit/signup_state.dart';
import 'package:cash_back_infor/ui/utils/button_primary.dart';
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
                        Image.asset('assets/image/name_input.png'),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Khả năng tiếng Anh hiện tại của bé?',
                            maxLines: null,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Color(0xFF4B4B4B)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    InkWell(
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
                                ? Color(0xFF36BFFA)
                                : Color(0xFFE5E5E5),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: (state.englishLevel == EnglishLevel.unknown)
                              ? Color(0xFFF8FDFF)
                              : Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/image/english_level1.png'),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                maxLines: null,
                                'Bé chưa biết gì về tiếng Anh',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color:
                                          (state.englishLevel ==
                                              EnglishLevel.unknown)
                                          ? Color(0xFF36BFFA)
                                          : Color(0xFF4B4B4B),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    InkWell(
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
                                ? Color(0xFF36BFFA)
                                : Color(0xFFE5E5E5),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: (state.englishLevel == EnglishLevel.word)
                              ? Color(0xFFF8FDFF)
                              : Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/image/english_level2.png'),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                maxLines: null,
                                'Bé nhận biết được vài từ đơn giản',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color:
                                          (state.englishLevel ==
                                              EnglishLevel.word)
                                          ? Color(0xFF36BFFA)
                                          : Color(0xFF4B4B4B),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    InkWell(
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
                                ? Color(0xFF36BFFA)
                                : Color(0xFFE5E5E5),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: (state.englishLevel == EnglishLevel.sentence)
                              ? Color(0xFFF8FDFF)
                              : Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/image/english_level3.png'),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                maxLines: null,
                                'Bé hiểu được câu ngắn, đơn giản',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color:
                                          (state.englishLevel ==
                                              EnglishLevel.sentence)
                                          ? Color(0xFF36BFFA)
                                          : Color(0xFF4B4B4B),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    InkWell(
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
                                ? Color(0xFF36BFFA)
                                : Color(0xFFE5E5E5),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: (state.englishLevel == EnglishLevel.paragraph)
                              ? Color(0xFFF8FDFF)
                              : Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/image/english_level4.png'),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                maxLines: null,
                                'Bé đọc hiểu đoạn văn ngắn',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color:
                                          (state.englishLevel ==
                                              EnglishLevel.paragraph)
                                          ? Color(0xFF36BFFA)
                                          : Color(0xFF4B4B4B),
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
                            builder: (context) => const FakeLoadingWidget(),
                          );
                        }

                        if (state.status == FormzSubmissionStatus.success) {
                          context.go('/cash-back');
                        }

                        if (state.status == FormzSubmissionStatus.failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Đăng ký thất bại')),
                          );
                          context.go('/sign-up');
                        }
                      },
                      child: PrimaryButton(
                        text: 'Tiếp tục',
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
