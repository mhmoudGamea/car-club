import 'package:car_club/core/models/user_model.dart';
import 'package:car_club/core/widgets/tabs_view.dart';
import 'package:car_club/features/auth/presentation/views/reset_password_view.dart';
import 'package:car_club/features/auth/presentation/views/splash_view.dart';
import 'package:car_club/features/chats/presentation/views/chat_view.dart';
import 'package:car_club/features/chats/presentation/views/users_chats_view.dart';
import 'package:car_club/features/chats/presentation/views/chat_search_view.dart';
import 'package:car_club/features/favourite/presentation/views/favourite_view.dart';
import 'package:car_club/features/reviews/presentation/view_models/review_cubit/review_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/Ahp/presentation/views/ahp_view.dart';
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
import '../../features/services/presentation/view_models/services_cubit/services_cubit.dart';
import '../../features/services/presentation/views/add_car_center_form.dart';
import '../../features/services/presentation/views/car_center_details.dart';
import '../../features/services/presentation/views/car_centers_view.dart';
import '../../features/services/presentation/views/services_view.dart';
import '../../features/reviews/presentation/views/widgets/add_review_screen.dart';
import '../../features/services/presentation/views/widgets/car_center_map.dart';
import '../../features/services/presentation/views/widgets/showImage.dart';
import '../../features/used/presentation/views/details_view.dart';
import '../../features/used/presentation/views/used_view.dart';
import '../cache_helper.dart';
import '../constants.dart';

class AppRoutes {
  static late String path;

  static GoRouter get getRouter {
    remember = CacheHelper.getData('remember');
    if (remember == false || remember == null) {
      path = '/';
    } else {
      // path = CarCenterItem.rn;
      path = '/TabsView';
    }
    return _router;
  }

  static final _router = GoRouter(
    initialLocation: path,
    routes: [
      GoRoute(
        path: AddReviewScreen.rn,
        builder: (context, state) {
          Map<String, dynamic> map = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: map["cubit1"] as CarCenterCubit),
              BlocProvider.value(value: map["cubit2"] as ReviewCubit),
            ],
            child: AddReviewScreen(
              doc: map["doc"] as String,
              // state.params["doc"]!
              carCenterModel: map["model"] as CarCenterModel,
              //  state.extra as CarCenterModel
            ),
          );
        },
      ),
      // GoRoute(
      //   path: CarCenterItem.rn,
      //   builder: (context, state) =>  CarCenterItem(),
      // ),
      GoRoute(
        path: CarCenterMap.rn,
        builder: (context, state) => CarCenterMap(
          carCenterModel: state.extra as CarCenterModel,
        ),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.rn,
        builder: (context, state) => const HomeView(),
      ),
      // GoRoute(
      //   path: ItemViewBody.rn,
      //   builder: (context, state) =>
      //       ItemViewBody(carCenterModel: state.extra as CarCenterModel),
      // ),
      GoRoute(
        path: UsedView.rn,
        builder: (context, state) => const UsedView(),
      ),
      GoRoute(
        path: ServicesView.rn,
        builder: (context, state) => const ServicesView(),
      ),
      GoRoute(
        path: FavouriteView.rn,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(HomeRepoImpl()),
          child: const FavouriteView(),
        ),
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
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: AhpView.rn,
        builder: (context, state) => const AhpView(),
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
        path: ChatSearchView.rn,
        builder: (context, state) => const ChatSearchView(),
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
        builder: (context, state) => BlocProvider.value(
          value: state.extra as CarCenterCubit,
          child: const CarCentersView(),
        ),
      ),
      GoRoute(
        path: CarCenterDetails.rn,
        builder: (context, state) {
          Map<String, dynamic> map = state.extra as Map<String, dynamic>;
          return BlocProvider.value(
            value: map["cubit1"] as CarCenterCubit,
            child: CarCenterDetails(
              doc: map["doc"] as String,
              //state.params["doc"]!
              carCenterModel: map["model"] as CarCenterModel,
              //state.extra as CarCenterModel
              // userModel: state.extra as UserModel,
            ),
          );
        },
      ),
      GoRoute(
        path: AddCarCenter.rn,
        builder: (context, state) => const AddCarCenter(),
      ),
      GoRoute(
        path: CarCentersView.rn,
        builder: (context, state) {
          return const CarCentersView();
        },
      ),
      GoRoute(
        path: ShowImage.rn,
        builder: (context, state) => ShowImage(image: state.extra as String),
      ),
    ],
  );
}
