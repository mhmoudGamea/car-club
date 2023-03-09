import 'package:car_club/core/cache_helper.dart';
import 'package:car_club/core/utils/app_routes.dart';
import 'package:car_club/core/widgets/tabs_view.dart';
import 'package:car_club/features/test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants.dart';
import 'features/auth/data/auth_services/login/login_cubit/bloc_observe.dart';
import 'features/auth/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.initialObject();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  late Widget widget;
  remember = CacheHelper.getData('remember');
  if (remember == false || remember == null) {
    widget = const SplashView();
  } else {
    widget = const Test();
  }
  runApp(CarClub(widget));
}

class CarClub extends StatelessWidget {
  const CarClub(this.widget, {Key? key}) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.getRouter,
      debugShowCheckedModeBanner: false,
      //home: const TabsView(),
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
