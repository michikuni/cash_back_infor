import 'package:cash_back_infor/features/ui/signin/components/loading_screen.dart';
import 'package:cash_back_infor/features/ui/signin/cubit/signin_cubit.dart';
import 'package:cash_back_infor/features/ui/signin/cubit/signin_state.dart';
import 'package:cash_back_infor/features/ui/signin/form/phone_input.dart';
import 'package:cash_back_infor/features/ui/utils/bottom_action_section.dart';
import 'package:cash_back_infor/features/ui/utils/button_primary.dart';
import 'package:cash_back_infor/features/theme/color_theme.dart';
import 'package:cash_back_infor/features/theme/text_decoration.dart';
import 'package:cash_back_infor/utils/text_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class SigninWidget extends StatefulWidget {
  const SigninWidget({super.key});

  @override
  State<SigninWidget> createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninCubit, SigninState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(leading: Icon(Icons.arrow_back_ios_new_rounded)),
          body: SafeArea(
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
                    BlocListener<SigninCubit, SigninState>(
                      listenWhen: (previous, current) =>
                          previous.status != current.status,
                      listener: (context, state) {
                        if (state.status == FormzSubmissionStatus.inProgress) {
                          // context.push('/loading-signin');
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const LoadingWidget(),
                          );
                        }
                        if (state.status == FormzSubmissionStatus.success) {
                          context.go('/home', extra: state.userData);
                        }
                        if (state.status == FormzSubmissionStatus.failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(AppString.signinFailure),
                            ),
                          );
                          context.go('/cash-back');
                        }
                      },
                      child: PrimaryButton(
                        text: AppString.signinPrimaryButton,
                        onPressed: () {
                          context.read<SigninCubit>().submit();
                        },
                        enabled: true,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppString.signinActiveCodeText,
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium?.signinActiveCodeText,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          child: Text(
                            AppString.signinActiveCodeTextButton,
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium?.signinActiveCodeTextButton,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    BottomActionSection(
                      textButton: AppString.signinBottomTextButton,
                      text: AppString.signinBottomText,
                      onChangedSign: () {
                        context.push('/sign-up');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
          child: Image.asset(AssetString.signinHeaderAsset, width: 151),
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
                  ? AppColor.signinDisplayError
                  : AppColor.signinDisplayDefault,
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
              hintText: AppString.signinPhoneHintText,
              errorStyle: TextStyle(height: 0),
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.signinHintText,
              suffixIcon: IconButton(
                constraints: const BoxConstraints(minHeight: 24, minWidth: 24),
                padding: EdgeInsets.zero,
                onPressed: () {
                  _phoneTextController.text = '';
                },
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
              AppString.signinPhoneErrorShortText,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.signinErrorText,
            ),
          ),
        if (widget.state.phone.displayError == PhoneValidationError.invalid)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppString.signinPhoneErrorInvalidText,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.signinErrorText,
            ),
          ),
        SizedBox(height: 12),
        Container(
          height: 62,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.signinDisplayDefault),
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
              hintText: AppString.signinPasswordHintText,
              errorStyle: TextStyle(height: 0),
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.signinHintText,
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
              '${AppString.signinIdHintText}$deviceId',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.signinIdText,
            ),
            Expanded(child: Container()),
            TextButton(
              child: Text(
                AppString.signinForgotPasswordText,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.signinForgotPasswordText,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
