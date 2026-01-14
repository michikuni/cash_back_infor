import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Container(
        width: double.infinity,
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: enabled ? const Color(0xFF36BFFA) : Color(0xFFE5E5E5),
          borderRadius: BorderRadius.circular(12),
          boxShadow: enabled
              ? [
                  const BoxShadow(
                    color: Color(0xFF00B2FF),
                    offset: Offset(0, 3),
                  )
                ]
              : [
                const BoxShadow(
                    color: Color(0xFFD6D6D6),
                    offset: Offset(0, 3),
                  )
              ],
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
