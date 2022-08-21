import 'dart:async';


import 'package:easy_localization/easy_localization.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
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
  await EasyLocalization.ensureInitialized();
  await di.init();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
        .then((_) => BlocOverrides.runZoned(
          () => runApp(EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ru')],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale('en'),
          child: const MyApp())),
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
    return
      // MultiBlocProvider(
      //   providers: [
      //     // BlocProvider<AuthCubit>(create: (context) => di.sl<AuthCubit>()),
      //     // BlocProvider<BlocUser>(create: (context) => di.sl<BlocUser>()),
      //     // BlocProvider<BlocLevel>(create: (context) => di.sl<BlocLevel>()),
      //   ],
      //   child: MultiRepositoryProvider(
      //     providers: [
      //     //  RepositoryProvider(create: (context) => di.sl<UserRepository>())
      //     ],
      //     child:
          ScreenUtilInit(
              designSize: Size(414, 896),
              builder: (BuildContext context, Widget? child) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  theme: themeData(context),
                  title: 'Математика с Дино',
                  home: Home()));
        //));
  }
}