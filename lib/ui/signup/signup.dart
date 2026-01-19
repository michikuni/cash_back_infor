import 'package:cash_back_infor/ui/utils/button_primary.dart';

import 'cubit/signup_state.dart';
import 'cubit/signup_cubit.dart';
import 'components/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../utils/bottom_action_section.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});
  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Form(
                child: Column(
                  children: [
                    _HeaderSection(
                      state: state,
                      onPhoneChanged: (value) {
                        context.read<SignupCubit>().phoneChanged(value);
                      },
                      onPasswordChanged: (value) {
                        context.read<SignupCubit>().passwordChanged(value);
                      },
                      onCfPasswordChanged: (value) {
                        context.read<SignupCubit>().confirmPasswordChanged(
                          value,
                        );
                      },
                    ),
                    Expanded(child: Container()),
                    PrimaryButton(
                      text: 'Tiếp tục',
                      onPressed: () {
                        if (state.step == SignupStep.password) {
                          context.push('/welcome');
                        } else {
                          context.read<SignupCubit>().nextStep();
                        }
                      },
                      enabled: context.read<SignupCubit>().buttonState(),
                    ),
                    const SizedBox(height: 27),
                    BottomActionSection(
                      text: 'đăng ký',
                      textButton: 'Đăng nhập',
                      onChangedSign: () {
                        context.go('/');
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final SignupState state;
  final ValueChanged<String> onPhoneChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<String> onCfPasswordChanged;

  const _HeaderSection({
    required this.state,
    required this.onPhoneChanged,
    required this.onPasswordChanged,
    required this.onCfPasswordChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset('assets/image/monkey.png', width: 151),
        ),
        const SizedBox(height: 11),
        _buildInput(
          state,
          onPhoneChanged,
          onPasswordChanged,
          onCfPasswordChanged,
        ),
      ],
    );
  }
}

Widget _buildInput(
  SignupState state,
  ValueChanged<String> onPhoneChanged,
  ValueChanged<String> onPasswordChanged,
  ValueChanged<String> onCfPasswordChanged,
) {
  switch (state.step) {
    case SignupStep.phone:
      return PhoneInputSection(
        isValid: state.phone.isValid,
        onChanged: onPhoneChanged,
      );
    case SignupStep.password:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PasswordInputSection(
            isValid: state.password.isValid,
            onChanged: onPasswordChanged,
          ),
          ConfirmPasswordInputSection(
            state: state,
            onChanged: onCfPasswordChanged,
          ),
        ],
      );
  }
}
