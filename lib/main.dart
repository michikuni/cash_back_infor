import 'package:cash_back_infor/ui/signin/signin.dart';
import 'package:cash_back_infor/ui/signup/components/birth_selection.dart';
import 'package:cash_back_infor/ui/signup/components/infor_header_section.dart';
import 'package:cash_back_infor/ui/signup/cubit/signup_cubit.dart';
import 'package:cash_back_infor/ui/test.dart';
import 'package:cash_back_infor/ui/signup/components/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'ui/cashback/cash_back_info.dart';
import 'ui/signup/signup.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MonkeyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/sign-up',
  routes: [
    GoRoute(
      path: '/test',
      builder: (context, state) {
        final String name = state.extra as String;
        return TestWidget(name: name);
      },
    ),
    GoRoute(path: '/', builder: (context, state) => const SigninWidget()),
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (_) => SignupCubit(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/sign-up',
          builder: (context, state) => const SignupWidget(),
        ),
        GoRoute(
          path: '/name-input',
          builder: (context, state) => const NameInputWidget(),
        ),
        GoRoute(
          path: '/birth-selection',
          builder: (context, state) => const BirthSelectionWidget(),
        ),
        GoRoute(
          path: '/welcome',
          builder: (context, state) => const WelcomeWidget(),
        ),
      ],
    ),
    GoRoute(
      path: '/cash-back',
      builder: (context, state) => const CashBackWidget(),
    ),
  ],
);

class MonkeyApp extends StatelessWidget {
  const MonkeyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(textTheme).copyWith(
          bodyLarge: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          bodyMedium: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          bodySmall: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          labelMedium: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          titleMedium: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
          ),
          titleSmall: GoogleFonts.nunito(
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
