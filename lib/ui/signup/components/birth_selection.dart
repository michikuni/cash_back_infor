import 'package:cash_back_infor/ui/signup/cubit/signup_cubit.dart';
import 'package:cash_back_infor/ui/signup/cubit/signup_state.dart';
import 'package:cash_back_infor/ui/utils/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BirthSelectionWidget extends StatelessWidget {
  const BirthSelectionWidget({super.key});

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
                padding: EdgeInsets.symmetric(horizontal: 23),
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
                            '${state.name.value} sinh vào năm nào?',
                            maxLines: null,
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Color(0xFF4B4B4B)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    GridView.builder(
                      shrinkWrap:
                          true, //GridView nằm gọn trong Column
                      physics:
                          NeverScrollableScrollPhysics(), // Tắt cuộn riêng của Grid nếu bọc ngoài bởi SingleChildScrollView
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // 4 cột
                        crossAxisSpacing: 10, // Khoảng cách ngang giữa các ô
                        mainAxisSpacing: 10, // Khoảng cách dọc giữa các ô
                        childAspectRatio:
                            1.2,
                      ),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        int year = 2021 - index;
                        return _buildYearButton(year.toString());
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ), 
                    _buildYearButton('Sinh trước năm 2010', isFullWidth: true),
                    Expanded(child: Container()),
                    PrimaryButton(
                      text: 'Tiếp tục',
                      onPressed: () {},
                      enabled: state.name.isValid ? true : false,
                    ),
                    SizedBox(height: 34),
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

Widget _buildYearButton(String text, {bool isFullWidth = false}) {
  return Container(
    width: isFullWidth ? double.infinity : null,
    height: isFullWidth ? 60 : null,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Color(0xFFE0E0E0)), 
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: TextStyle(color: Color(0xFF4B4B4B), fontWeight: FontWeight.w600),
    ),
  );
}
