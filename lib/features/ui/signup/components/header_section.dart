import 'package:cash_back_infor/features/ui/signup/cubit/signup_state.dart';
import 'package:cash_back_infor/features/theme/color_theme.dart';
import 'package:cash_back_infor/utils/text_define.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class PhoneInputSection extends StatelessWidget {
  final bool isValid;
  final ValueChanged<String> onChanged;

  const PhoneInputSection({
    super.key,
    required this.isValid,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.signupPhoneText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 21),
        Container(
          height: 62,
          decoration: BoxDecoration(
            border: Border.all(
              color: isValid ? AppColor.signupHeaderValid : AppColor.signupHeaderInvalid,
            ),
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
              const SizedBox(width: 6),

              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppString.signupPhoneHint,
                    errorStyle: TextStyle(height: 0),
                    hintStyle: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: AppColor.signupHeaderInvalid),
                    suffixIcon: isValid
                        ? const Icon(Icons.check_circle, color: AppColor.signupHeaderValid)
                        : null,
                  ),
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
        if (isValid)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                AppString.signupPhoneValid,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColor.signupHeaderValid),
              ),
            ),
          ),
      ],
    );
  }
}

class PasswordInputSection extends StatefulWidget {
  final bool isValid;
  final ValueChanged<String> onChanged;

  const PasswordInputSection({
    super.key,
    required this.isValid,
    required this.onChanged,
  });

  @override
  State<PasswordInputSection> createState() => _PasswordInputSectionState();
}

class _PasswordInputSectionState extends State<PasswordInputSection> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppString.signupPasswordText, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 21),
        Container(
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.isValid ? AppColor.signupHeaderValid : AppColor.signupHeaderInvalid,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.fromLTRB(8, 0, 4, 0),
          child: TextFormField(
            obscureText: _isObscured,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppString.signupPasswordHint,
              errorStyle: TextStyle(height: 0),
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColor.signupHeaderInvalid),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            onChanged: widget.onChanged,
          ),
        ),
        if (widget.isValid)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppString.signupPasswordValid,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColor.signupHeaderValid),
            ),
          ),
        if (!widget.isValid) SizedBox(height: 14),
      ],
    );
  }
}

class ConfirmPasswordInputSection extends StatefulWidget {
  final SignupState state;
  final ValueChanged<String> onChanged;

  const ConfirmPasswordInputSection({
    super.key,
    required this.state,
    required this.onChanged,
  });

  @override
  State<ConfirmPasswordInputSection> createState() =>
      _ConfirmPasswordInputSectionState();
}

class _ConfirmPasswordInputSectionState
    extends State<ConfirmPasswordInputSection> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.fromLTRB(8, 0, 4, 0),
          child: TextFormField(
            obscureText: _isObscured,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppString.signupConfirmPasswordHint,
              errorStyle: TextStyle(height: 0),
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColor.signupHeaderInvalid),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            onChanged: widget.onChanged,
          ),
        ),
        if (!widget.state.confirmPassword.isPure) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.state.confirmPassword.isValid
                  ? AppString.signupConfirmPasswordValid
                  : AppString.signupConfirmPasswordInvalid,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: widget.state.confirmPassword.isValid
                    ? AppColor.signupHeaderValid
                    : AppColor.signupHeaderError,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Color get borderColor {
    if (widget.state.confirmPassword.isValid &&
        !widget.state.confirmPassword.isPure) {
      return AppColor.signupHeaderValid;
    } else if (widget.state.confirmPassword.isNotValid &&
        !widget.state.confirmPassword.isPure) {
      return AppColor.signupHeaderError;
    } else {
      return AppColor.signupHeaderInvalid;
    }
  }
}
