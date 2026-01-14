import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'button_primary.dart';

class BottomActionSection extends StatelessWidget {
  final VoidCallback onContinue;
  final VoidCallback onChangedSign;
  final String textButton;
  final String text;
  final String button;

  const BottomActionSection({super.key, required this.onContinue, required this.textButton, required this.text, required this.button, required this.onChangedSign});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(text: button, onPressed: onContinue, enabled: true),
        const SizedBox(height: 37),
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Hoặc $text với',
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
        SizedBox(height: 28),
        SizedBox(
          height: 51,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tôi đã có tài khoản.',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: Color(0xFF777777)),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero
                ),
                onPressed: onChangedSign,
                child: Text(
                  textButton,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Color(0xFF3393FF),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF3393FF),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
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