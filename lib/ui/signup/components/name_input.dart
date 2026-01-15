import 'package:cash_back_infor/ui/signup/cubit/signup_cubit.dart';
import 'package:cash_back_infor/ui/signup/cubit/signup_state.dart';
import 'package:cash_back_infor/ui/utils/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NameInputWidget extends StatelessWidget {
  const NameInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<SignupCubit>(),
      child: Scaffold(
        appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded), onPressed: () {
          context.pop();
        },)),
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
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Tên của bé là?',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: Color(0xFF4B4B4B)),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(
                          color: state.name.isValid
                              ? Color(0xFF92C73D)
                              : Color(0xFFE5E5E5),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tên',
                          hintStyle: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Color(0xFFAFAFAF)),
                          suffixIcon: Icon(
                            color: Color(0xFF92C73D),
                            state.name.isValid
                                ? Icons.check_circle_rounded
                                : null,
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: state.name.isValid
                              ? Color(0xFF92C73D)
                              : Color(0xFF4B4B4B),
                        ),
                        onChanged: (value) {
                          context.read<SignupCubit>().nameChanged(value);
                        },
                      ),
                    ),
                    Expanded(child: Container()),
                    PrimaryButton(text: 'Tiếp tục', onPressed: () {context.push('/birth-selection');}, enabled: state.name.isValid ? true : false,),
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
