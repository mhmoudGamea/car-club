import 'package:car_club/core/cache_helper.dart';
import 'package:car_club/core/utils/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants.dart';
import 'features/auth/data/auth_services/login/login_cubit/bloc_observe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.initialObject();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  uId = CacheHelper.getData('uId');
  email = CacheHelper.getData('email');

  runApp(const CarClub());
}

class CarClub extends StatelessWidget {
  const CarClub({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.getRouter,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      // darkTheme: darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
