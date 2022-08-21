import 'package:ecocotask/presentation/pages/home/widgets/actions_home.dart';
import 'package:ecocotask/presentation/pages/home/widgets/banner_gallery.dart';
import 'package:ecocotask/presentation/pages/home/widgets/grid_shop.dart';
import 'package:ecocotask/presentation/pages/home/widgets/search.dart';
import 'package:ecocotask/presentation/pages/home/widgets/spoiler_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/category.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 22.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ActionHome(),
                SpoilerContainer(child: Category(), title: "view all", subtitle: "Select Category",),
                Search(),
                SpoilerContainer(child: BannerGallery(), title: "Hot sales", subtitle: "see more"),
                SpoilerContainer(child: GridShop(), title: "Best Seller", subtitle: "see more"),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}