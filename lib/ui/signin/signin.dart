import 'package:cash_back_infor/di/setup.dart';
import 'package:cash_back_infor/domain/usecase/get_user_use_case.dart';
import 'package:cash_back_infor/ui/signin/cubit/signin_cubit.dart';
import 'package:cash_back_infor/ui/signin/cubit/signin_state.dart';
import 'package:cash_back_infor/ui/signin/form/phone_input.dart';
import 'package:cash_back_infor/ui/utils/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../utils/bottom_action_section.dart';

class SigninWidget extends StatefulWidget {
  const SigninWidget({super.key});

  @override
  State<SigninWidget> createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getUserUseCase: getIt<GetUserUseCase>()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(leading: Icon(Icons.arrow_back_ios_new_rounded)),
        body: BlocBuilder<SigninCubit, SigninState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                child: Form(
                  child: Column(
                    children: [
                      _HeaderSectionWidget(
                        state: state,
                        onPhoneChanged: (value) {
                          setState(() {
                            context.read<SigninCubit>().phoneChanged(value);
                          });
                        },
                      ),
                      PrimaryButton(
                        text: 'Đăng nhập',
                        onPressed: () {},
                        enabled: true,
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nếu bạn có mã kích hoạt,',
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(color: Color(0xFF777777)),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Nhập tại đây',
                              style: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(
                                    color: Color(0xFF3393FF),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF3393FF),
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      BottomActionSection(
                        textButton: 'Đăng ký',
                        text: 'đăng nhập',
                        onChangedSign: () {
                          context.push('/sign-up');
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

class _HeaderSectionWidget extends StatefulWidget {
  final SigninState state;
  final ValueChanged<String> onPhoneChanged;
  const _HeaderSectionWidget({
    required this.onPhoneChanged,
    required this.state,
  });

  @override
  State<_HeaderSectionWidget> createState() => _HeaderSectionWidgetState();
}

class _HeaderSectionWidgetState extends State<_HeaderSectionWidget> {
  String deviceId = (100600).toString();
  bool _isObscured = true;
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _hasPasswordText = false;
  bool _hasPhoneText = false;

  @override
  void initState() {
    super.initState();
    _phoneTextController.addListener(() {
      setState(() {
        _hasPhoneText = _phoneTextController.text.isNotEmpty;
      });
    });
    _passwordTextController.addListener(() {
      setState(() {
        _hasPasswordText = _passwordTextController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _phoneTextController.dispose();
    _passwordTextController.dispose();
  }

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
        Container(
          height: 62,
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  (widget.state.phone.displayError ==
                          PhoneValidationError.short ||
                      widget.state.phone.displayError ==
                          PhoneValidationError.invalid)
                  ? Color(0xFFFF4B4B)
                  : Color(0xFFAFAFAF),
            ),

            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: _phoneTextController,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Số điện thoại/Tên đăng nhập',
              errorStyle: TextStyle(height: 0),
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
              suffixIcon: IconButton(
                constraints: const BoxConstraints(minHeight: 24, minWidth: 24),
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(_hasPhoneText ? Icons.cancel : null),
              ),
            ),
            onChanged: widget.onPhoneChanged,
          ),
        ),
        if (widget.state.phone.displayError == PhoneValidationError.short)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Số điện thoại cần nhập 6 - 15 chữ số',
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: Color(0xFFFF4B4B)),
            ),
          ),
        if (widget.state.phone.displayError == PhoneValidationError.invalid)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Số điện thoại không đúng',
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: Color(0xFFFF4B4B)),
            ),
          ),
        SizedBox(height: 12),
        Container(
          height: 62,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFAFAFAF)),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          alignment: Alignment.centerLeft,
          child: TextFormField(
            controller: _passwordTextController,
            obscureText: _isObscured,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Mật khẩu',
              errorStyle: TextStyle(height: 0),
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
              suffixIconConstraints: const BoxConstraints(
                minHeight: 24,
                minWidth: 24,
              ),
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                icon: Icon(
                  _hasPasswordText
                      ? (_isObscured ? Icons.visibility_off : Icons.visibility)
                      : null,
                ),
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "ID thiết bị: $deviceId",
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Color(0xFFAFAFAF)),
            ),
            Expanded(child: Container()),
            TextButton(
              child: Text(
                'Quên mật khẩu?',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Color(0xFF777777)),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
