import 'package:cash_back_infor/ui/signup/cubit/signup_state.dart';
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
          'Nhập số điện thoại',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 21),
        Container(
          height: 62,
          decoration: BoxDecoration(
            border: Border.all(
              color: isValid ? Color(0xFF92C73D) : Colors.grey,
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
                    hintText: 'Số điện thoại',
                    errorStyle: TextStyle(height: 0),
                    hintStyle: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    suffixIcon: isValid
                        ? const Icon(Icons.check_circle, color: Colors.green)
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
                'Số điện thoại khả dụng',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Color(0xFF92C73D)),
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
        Text('Tạo mật khẩu', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 21),
        Container(
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.isValid ? Color(0xFF92C73D) : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.fromLTRB(8, 0, 4, 0),
          child: TextFormField(
            obscureText: _isObscured,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Mật khẩu',
              errorStyle: TextStyle(height: 0),
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
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
              'Mật khẩu khả dụng',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Color(0xFF92C73D)),
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
              hintText: 'Nhập lại mật khẩu',
              errorStyle: TextStyle(height: 0),
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
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
                  ? 'Mật khẩu trùng khớp'
                  : 'Mật khẩu không trùng khớp',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: widget.state.confirmPassword.isValid
                    ? const Color(0xFF92C73D)
                    : const Color(0xFFFF4B4B),
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
      return const Color(0xFF92C73D);
    } else if (widget.state.confirmPassword.isNotValid &&
        !widget.state.confirmPassword.isPure) {
      return const Color(0xFFFF4B4B);
    } else {
      return Colors.grey;
    }
  }
}
