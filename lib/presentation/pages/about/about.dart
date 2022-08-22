/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 22:01
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/presentation/widgets/photo_card_aurhor.dart';
import 'package:ecocotask/presentation/widgets/window_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("О авторе"),
        actions: [
          // CheckConnective(),
          // IconCircle(
          //   icon: Icons.logout,
          //   action: () async {
          //     Utils.logOut(context);
          //   },
          // )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PhotoCardAurhor(),
              GestureDetector(
                onTap: () async => await launchUrl(Uri.parse("http://andlancer.ru"), mode: LaunchMode.externalNonBrowserApplication,),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    "andlancer.ru",
                    style: mark700(context, size: 20)
                        ?.copyWith(color: ConstColors.bluewDark),
                  ),
                ),
              ),
              WindowBlock(
                title: "Привет",
                body:
                    "Я дружелюбный, целеустремленный, коммуникативный, мечтательный) Клише, но мне подходит))\n\nС 2008 класса увлекаюсь программированием(десктопные приложения на Delphi).\nИзучение Android SDK на java с 2013 года.\nв 2015 году работал python программистом. Поддерживал работу портала написанного на Python + Django. Параллельно разрабатывал мобильное приложение для университета.\nC 2019 года, изучаю Kotlin.\nПрименяемый стэк в нативной разработке: Room, Retrofit2, Dagger2, RxJava, Firebase, AppMetrica, AppsFlayer, Appodeal, MVVM\n\n\nC 2020 года изучаю flutter.\nСамостоятельное изучение +2 законченных онлайн курса.\nИзучаемый стэк:\nBloc, Retrofit, Drift, Firebase, Google/Yandex Map, DI, Clean code.\nОпыт работы с figma.\n\n\nОтличаюсь исполнительностью, стрессоустойчивостью. С готовностью берусь за новые проекты. Хорошо работаю в команде, умею решать конфликты и идти на компромисс.",
              )
            ],
          ),
        ),
      ),
    );
  }
}
