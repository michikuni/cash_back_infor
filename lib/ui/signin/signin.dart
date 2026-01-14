import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/bottom_action_section.dart';

class SigninWidget extends StatelessWidget {
  const SigninWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios_new_rounded),),
      body: SafeArea(child: Column(
        children: [
          Align(alignment: Alignment.center,),
          BottomActionSection(onContinue: (){}, textButton: 'Đăng ký', text: 'đăng nhập', button: 'Đăng nhập', onChangedSign: () {
            context.go('/sign-up');
          },)
        ],
      )),
    );
  }
}