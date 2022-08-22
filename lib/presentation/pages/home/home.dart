/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 21:19
 *
 */

import 'package:ecocotask/presentation/bloc/cart/bloc_cart.dart';
import 'package:ecocotask/presentation/bloc/home/bloc_home.dart';
import 'package:ecocotask/presentation/pages/home/widgets/actions_home.dart';
import 'package:ecocotask/presentation/pages/home/widgets/banner_gallery.dart';
import 'package:ecocotask/presentation/pages/home/widgets/grid_shop.dart';
import 'package:ecocotask/presentation/pages/home/widgets/search.dart';
import 'package:ecocotask/presentation/pages/home/widgets/spoiler_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/category.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<BlocHome>().add(BlocHomeEvent.getHome());
    context.read<BlocCart>().add(BlocCartEvent.refresh());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<BlocCart>().add(BlocCartEvent.getCart());
            context.read<BlocHome>().add(BlocHomeEvent.refresh());
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 22.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ActionHome(),
                  SizedBox(height: 18.h,),
                  SpoilerContainer(
                    child: Category(),
                    title: "Select Category",
                    subtitle: "view all",
                  ),
                  SizedBox(height: 9.h,),
                  Search(),
                  SpoilerContainer(
                      child: BannerGallery(),
                      title: "Hot sales",
                      subtitle: "see more"),
                  SizedBox(height: 18.h,),
                  SpoilerContainer(
                      child: GridShop(),
                      title: "Best Seller",
                      subtitle: "see more"),
                  SizedBox(height: 20.h,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
