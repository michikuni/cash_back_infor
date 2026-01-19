import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFF000000).withValues(alpha: 0.5),
      ),
      child: Image.asset('assets/image/loading_signin.png'),
    );
  }
}
