import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/home_view_details.dart';
import '../../features/post/presentation/views/post_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../widgets/tabs_view.dart';

abstract class AppRoutes {
  static GoRouter get getRouter {
    return _router;
  }

  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const TabsView(),
      ),
      GoRoute(
        path: HomeView.rn,
        builder: (context, state) => const HomeView(),
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
      )
    ],
  );
}
