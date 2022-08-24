/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 21:45
 *
 */

import 'dart:async';

import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/presentation/bloc/cart/bloc_cart.dart';
import 'package:ecocotask/presentation/bloc/home/bloc_home.dart';
import 'package:ecocotask/presentation/bloc/nav_bottom/cubit_bottom_nav.dart';
import 'package:ecocotask/presentation/pages/base/base.dart';
import 'package:ecocotask/presentation/pages/home/home.dart';
import 'package:ecocotask/presentation/pages/splash/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => BlocOverrides.runZoned(
            () => runApp(const MyApp()),
            blocObserver: AppBlocObserver(),
          ));
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CubitBottomNav>(
              create: (context) => di.sl<CubitBottomNav>()),
          BlocProvider<BlocHome>(
              create: (context) => di.sl<BlocHome>()),
          BlocProvider<BlocCart>(
              create: (context) => di.sl<BlocCart>()),
        ],
        child: ScreenUtilInit(
            designSize: Size(414, 896),
            builder: (BuildContext context, Widget? child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: themeData(context),
                title: 'Ecо excirse',
                home: Splash())));
  }
}
