import 'package:car_club/core/cache_helper.dart';
import 'package:car_club/core/utils/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants.dart';
import 'features/auth/data/auth_services/login/login_cubit/bloc_observe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.initialObject();
  await Firebase.initializeApp();
  // var token = await FirebaseMessaging.instance.getToken();
  // print(token);
  await FirebaseMessaging.instance.getInitialMessage();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // FirebaseMessaging.onMessage.listen((event) {
  //   print(event.data.toString());
  // });

  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print(event.data.toString());
  // });

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
