import 'package:car_club/core/models/user_model.dart';
import 'package:car_club/core/widgets/tabs_view.dart';
import 'package:car_club/features/auth/presentation/views/reset_password_view.dart';
import 'package:car_club/features/auth/presentation/views/splash_view.dart';
import 'package:car_club/features/chats/presentation/views/chat_view.dart';
import 'package:car_club/features/chats/presentation/views/users_chats_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/home/data/models/car_model.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/model_views/home_cubit/home_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/home_view_details.dart';
import '../../features/post/data/models/post_model.dart';
import '../../features/post/presentation/views/post_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/services/data/models/car_center_model.dart';
import '../../features/services/presentation/views/add_car_center_form.dart';
import '../../features/services/presentation/views/car_center_details.dart';
import '../../features/services/presentation/views/car_centers_view.dart';
import '../../features/services/presentation/views/services_view.dart';
import '../../features/services/presentation/views/widgets/car_center_item_body.dart';
import '../../features/services/presentation/views/widgets/car_center_map.dart';
import '../../features/services/presentation/views/widgets/showImage.dart';
import '../../features/used/presentation/views/details_view.dart';
import '../cache_helper.dart';
import '../constants.dart';

class AppRoutes {
  static late String path;

  static GoRouter get getRouter {
    remember = CacheHelper.getData('remember');
    if (remember == false || remember == null) {
      path = '/';
    } else {
      path = TabsView.rn;
    }
    return _router;
  }

  static final _router = GoRouter(
    initialLocation: path,
    routes: [
      // GoRoute(
      //   path: Test.rn,
      //   builder: (context, state) => Test(),
      // ),
      GoRoute(
        path: CarCenterMap.rn,
        builder: (context, state) => const CarCenterMap(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.rn,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: ItemViewBody.rn,
        builder: (context, state) =>
            ItemViewBody(carCenterModel: state.extra as CarCenterModel),
      ),
      GoRoute(
        path: ServicesView.rn,
        builder: (context, state) => const ServicesView(),
      ),
      GoRoute(
        path: TabsView.rn,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(HomeRepoImpl()),
          child: const TabsView(),
        ),
      ),
      GoRoute(
        path: ProfileView.rn,
        builder: (context, state) =>  ProfileView(),
      ),
      GoRoute(
        path: DetailsView.rn,
        builder: (context, state) =>
            DetailsView(model: state.extra as PostModel),
      ),
      GoRoute(
        path: UsersChatsView.rn,
        builder: (context, state) => const UsersChatsView(),
      ),
      GoRoute(
        path: ChatView.rn,
        builder: (context, state) =>
            ChatView(userModel: state.extra as UserModel),
      ),
      GoRoute(
        path: HomeViewDetails.rn,
        builder: (context, state) =>
            HomeViewDetails(car: state.extra as CarModel),
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
      ),
      GoRoute(
        path: CarCentersView.rn,
        builder: (context, state) => const CarCentersView(),
      ),
      GoRoute(
        path: CarCenterDetails.rn,
        builder: (context, state) => CarCenterDetails(
          carCenterModel: state.extra as CarCenterModel,
          // userModel: state.extra as UserModel,
        ),
      ),
      GoRoute(
        path: AddCarCenter.rn,
        builder: (context, state) => const AddCarCenter(),
      ),

      GoRoute(
        path: ShowImage.rn,
        builder: (context, state) => ShowImage(image: state.extra as String),
      ),
    ],
  );
}
