import 'package:cash_back_infor/utils/button_primary.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  String? phoneNumber;
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios_rounded)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          child: Column(
            children: [
              _HeaderSection(),
              const SizedBox(height: 21),
              _PhoneInputSection(),
              const Spacer(),
              _BottomActionSection(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
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
  const _PhoneInputSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
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
            child: TextField(
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Số điện thoại',
                hintStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomActionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(text: 'Tiếp tục', onPressed: () {}, enabled: true),
        const SizedBox(height: 37),
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Hoặc đăng ký với',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: const Color(0xFF777777)),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 43),
        Row(
          children: [
            Expanded(
              child: _SocialButton(
                bgColor: const Color(0xFF1877F2),
                child: const Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
                onTap: () {
                  print('Facebook tap');
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SocialButton(
                bgColor: Colors.white,
                border: Border.all(color: Colors.grey),
                child: Image.asset('assets/image/google.png', height: 20),
                onTap: () {
                  print('Google tap');
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SocialButton(
                bgColor: Colors.black,
                child: const Icon(FontAwesomeIcons.apple, color: Colors.white),
                onTap: () {
                  print('Apple tap');
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color bgColor;
  final BoxBorder? border;

  const _SocialButton({
    required this.child,
    required this.onTap,
    required this.bgColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: border,
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
