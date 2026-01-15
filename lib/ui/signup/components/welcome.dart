import 'package:cash_back_infor/ui/utils/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 45,),
            Text(
              'Chào mừng bạn đến\nMonkey Stories',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Color(0xFF36BFFA)),
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/image/welcome.png'),
            SizedBox(height: 60,),
            PrimaryButton(text: 'Tiếp tục', onPressed: (){context.push('/name-input');})
          ],
        ),
      ),
    );
  }
}
