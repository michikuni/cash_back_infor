import 'cubit/signup_state.dart';
import 'cubit/signup_cubit.dart';
import 'package:country_code_picker/country_code_picker.dart';
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
                      _HeaderSection(),
                      const SizedBox(height: 21),
                      _PhoneInputSection(
                        isValid: state.phone.isValid,
                      ),
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
        Text(
          'Nhập số điện thoại',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _PhoneInputSection extends StatelessWidget {
  final bool isValid;

  const _PhoneInputSection({
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        border: Border.all(color: isValid ? Color(0xFF92C73D) : Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: CountryCodePicker(
              initialSelection: 'VN',
              showFlag: true,
              flagWidth: 28,
              hideMainText: true,
              showDropDownButton: true,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
            ),
          ),
          const VerticalDivider(width: 1, indent: 16, endIndent: 16),
          const SizedBox(width: 4),

          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Số điện thoại',
                errorStyle: TextStyle(height: 0),
                hintStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                suffixIcon: isValid
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : null,
              ),
              onChanged: (value) {
                context.read<SignupCubit>().phoneChanged(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
