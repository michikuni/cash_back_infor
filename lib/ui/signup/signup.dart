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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(leading: Icon(Icons.arrow_back_ios_rounded)),
        body: BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _HeaderSection(isValid: state.isValid,onChanged: (value) {
                        context.read<SignupCubit>().phoneChanged(value);
                      },),
                      if (state.phone.isValid)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Số điện thoại khả dụng',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Color(0xFF92C73D)),
                            ),
                          ),
                        ),
                      Expanded(child: Container()),
                      BottomActionSection(
                        button: 'Tiếp tục',
                        text: 'đăng ký',
                        textButton: 'Đăng nhập',
                        onContinue: () {},
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
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final bool isValid;
  final ValueChanged<String> onChanged;

  const _HeaderSection({required this.isValid, required this.onChanged});
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
        PhoneInputSection(isValid: isValid, onChanged: onChanged)
      ],
    );
  }
}
