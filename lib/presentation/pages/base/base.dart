/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 20:56
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/presentation/bloc/cart/bloc_cart.dart';
import 'package:ecocotask/presentation/bloc/nav_bottom/cubit_bottom_nav.dart';
import 'package:ecocotask/presentation/bloc/nav_bottom/cubit_bottom_nav_state.dart';
import 'package:ecocotask/presentation/pages/about/about.dart';
import 'package:ecocotask/presentation/pages/cart/cart.dart';
import 'package:ecocotask/presentation/pages/home/home.dart';
import 'package:ecocotask/presentation/widgets/notif_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecocotask/di.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabNavigationItem {
  final Widget page;
  final String icon;
  final String title_text;
  final CubitBottomNavState? menuValue;

  TabNavigationItem(
      {required this.page,
      required this.icon,
      required this.title_text,
      this.menuValue});
}

List<TabNavigationItem> items(BuildContext context) => [
      TabNavigationItem(
          page: Home(),
          title_text: "Explorer",
          menuValue: CubitBottomNavState.Home(),
          icon: LocalIcons.m_explorer),
      TabNavigationItem(
          page: Cart(),
          title_text: "Cart",
          menuValue: CubitBottomNavState.Cart(),
          icon: LocalIcons.m_cart),
      TabNavigationItem(
          page: Home(),
          title_text: "Favorites",
          //menuValue: CubitBottomNavState.Favorites(),
          icon: LocalIcons.m_favorites),
      TabNavigationItem(
          page: About(),
          title_text: "Person",
          menuValue: CubitBottomNavState.About(),
          icon: LocalIcons.m_person),
    ];

class Base extends StatelessWidget {
  const Base({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseScreen();
  }
}

class _BaseScreen extends StatefulWidget {
  _BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<_BaseScreen> {
  final PageController controller = PageController();

  List<TabNavigationItem> item = [];

  ValueNotifier<int> _page = ValueNotifier<int>(0);

  @override
  void initState() {
    item.clear();
    item.addAll(items(context));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
          body: BlocBuilder<CubitBottomNav, CubitBottomNavState>(
            builder: (context, state) {
              return state.when(
                Home: () => item.elementAt(0).page,
                About: () => item.elementAt(3).page,
                Cart: () => item.elementAt(1).page,
                Favorites: () => item.elementAt(2).page,
              );
            },
          ),
          bottomNavigationBar: Container(
            height: 72.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: ConstColors.bluewDark,
                borderRadius: BorderRadius.circular(30.r)),
            child: ValueListenableBuilder<int>(
                valueListenable: _page,
                builder: (context, data, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _Item(
                        tab: item[0],
                        action: () {
                          _page.value = 0;
                        },
                        isActive: data == 0,
                      ),
                      _Item(
                        tab: item[1],
                        action: () {
                          _page.value = 1;
                        },
                        isActive: data == 1,
                      ),
                      _Item(
                        tab: item[2],
                        action: () {
                          _page.value = 2;
                        },
                        isActive: data == 2,
                      ),
                      _Item(
                        tab: item[3],
                        action: () {
                          _page.value = 3;
                        },
                        isActive: data == 3,
                      ),
                    ],
                  );
                }),
          )
          ),
    );
  }
}

class _Item extends StatelessWidget {
  TabNavigationItem tab;

  bool isActive;
  VoidCallback action;

  _Item({required this.tab, this.isActive = false, required this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        action();
        if (tab.menuValue != null) {
          context.read<CubitBottomNav>().setBaseMenuState(tab.menuValue!);
        }
        else{
          Utils.toast(context, "Еще не подвезли дизайн экранов(");
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          !isActive
              ? tab.title_text == "Cart" ? Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(tab.icon),
              BlocBuilder<BlocCart, BlocCartState>(
                builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () => SizedBox.shrink(),
                      fetchedCart: (cart) => cart.totalItemSize >= 1
                          ? NotifCart(cart: cart)
                          : SizedBox.shrink());
                },
              )
            ],
          ) : SvgPicture.asset(tab.icon)
              : SvgPicture.asset(LocalIcons.m_dot),
          isActive
              ? SizedBox(
                  width: 7.w,
                )
              : SizedBox.shrink(),
          isActive
              ? Text(
                  tab.title_text,
                  style: mark700(context, size: 15)
                      ?.copyWith(color: ConstColors.white),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
