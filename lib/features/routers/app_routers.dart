import 'package:cash_back_infor/di/setup.dart';
import 'package:cash_back_infor/domain/entity/user.dart';
import 'package:cash_back_infor/domain/usecase/create_user_use_case.dart';
import 'package:cash_back_infor/domain/usecase/get_user_use_case.dart';
import 'package:cash_back_infor/features/ui/cashback/cash_back_info.dart';
import 'package:cash_back_infor/features/ui/home/home.dart';
import 'package:cash_back_infor/features/ui/signin/cubit/signin_cubit.dart';
import 'package:cash_back_infor/features/ui/signin/signin.dart';
import 'package:cash_back_infor/features/ui/signup/components/birth_selection.dart';
import 'package:cash_back_infor/features/ui/signup/components/english_level_selection.dart';
import 'package:cash_back_infor/features/ui/signup/components/name_input.dart';
import 'package:cash_back_infor/features/ui/signup/components/welcome.dart';
import 'package:cash_back_infor/features/ui/signup/cubit/signup_cubit.dart';
import 'package:cash_back_infor/features/ui/signup/signup.dart';
import 'package:cash_back_infor/features/ui/test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  AppRouters._();

  static final GoRouter appRouters = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/test',
        builder: (context, state) {
          final String name = state.extra as String;
          return TestWidget(name: name);
        },
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (_) => SigninCubit(getUserUseCase: getIt<GetUserUseCase>()),
          child: const SigninWidget(),
        ),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) {
          final List<UserEntity> userData = state.extra as List<UserEntity>;
          return HomeWidget(userData: userData);
        },
      ),
      GoRoute(
        path: '/cash-back',
        builder: (context, state) => const CashBackWidget(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (_) => SignupCubit(
              getUserUseCase: getIt<GetUserUseCase>(),
              createUserUseCase: getIt<CreateUserUseCase>(),
            ),
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
          GoRoute(
            path: '/english-level',
            builder: (context, state) => const EnglishLevelSelectionWidget(),
          ),
        ],
      ),
    ],
  );
}
