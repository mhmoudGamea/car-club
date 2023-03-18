import 'package:car_club/core/widgets/tabs_view.dart';
import 'package:car_club/features/auth/presentation/views/reset_password_view.dart';
import 'package:car_club/features/auth/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/home_view_details.dart';
import '../../features/post/presentation/views/post_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../cache_helper.dart';
import '../constants.dart';

class AppRoutes {
  static late String path;

  static GoRouter get getRouter {
    remember = CacheHelper.getData('remember');

    if (remember == false || remember == null) {

      path =  '/';

    } else {

      path = TabsView.rn;

    }

    return _router;
  }

  static final _router = GoRouter(
    initialLocation: path,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.rn,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: TabsView.rn,
        builder: (context, state) => const TabsView(),
      ),
      GoRoute(
        path: ProfileView.rn,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: HomeViewDetails.rn,
        builder: (context, state) => const HomeViewDetails(),
      ),
      GoRoute(
        path: PostView.rn,
        builder: (context, state) => const PostView(),
      ),
      GoRoute(
        path: LoginScreen.rn,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RegisterScreen.rn,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AuthenticationView.rn,
        builder: (context, state) => const AuthenticationView(),
      ),
      GoRoute(
        path: ResetPasswordPage.rn,
        builder: (context, state) => const ResetPasswordPage(),
      )
    ],
  );
}
