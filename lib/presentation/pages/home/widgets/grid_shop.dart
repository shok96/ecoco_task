/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 22:03
 *
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/core/common/images.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/data/models/MHome.dart';
import 'package:ecocotask/presentation/bloc/home/bloc_home.dart';
import 'package:ecocotask/presentation/pages/detail/detail.dart';
import 'package:ecocotask/presentation/widgets/error_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocHome, BlocHomeState>(
      builder: (context, state) {
        return state.when(
            idle: () => SizedBox.shrink(),
            proceed: () => Center(
                  child: CircularProgressIndicator(),
                ),
            fetchedHome: (data) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (180 / 228).r,
                    crossAxisSpacing: 20.r,
                    mainAxisSpacing: 20.r,
                    crossAxisCount: 2),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: data.best_seller.length,
                itemBuilder: (context, index) => _Items(
                      action: () {
                        Utils.routerScreen(context, Detail());
                      },
                      mBestSeller: data.best_seller[index],
                    )),
            error: (e) => ErrorCard(
                action: () =>
                    context.read<BlocHome>().add(BlocHomeEvent.getHome())));
      },
    );
  }
}

class _Items extends StatelessWidget {
  VoidCallback action;

  MBestSeller mBestSeller;

  _Items({required this.action, required this.mBestSeller});

  ValueNotifier<bool> isFavorites = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Stack(
              children: [
                CachedNetworkImage(imageUrl: mBestSeller.picture, errorWidget: (context, _, __) => SvgPicture.asset(LocalImages.no_photo)),
                Positioned(
                  right: 16.w,
                  top: 11.h,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => isFavorites.value = !isFavorites.value,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: ConstColors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: ValueListenableBuilder<bool>(
                              valueListenable: isFavorites,
                              builder: (context, data, _) {
                                return SvgPicture.asset(data
                                    ? LocalIcons.heart_on
                                    : LocalIcons.heart_off);
                              }),
                        )),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          RichText(
            text: TextSpan(
              text: '\$${mBestSeller.price_without_discount}' + '  ',
              style: mark700(context, size: 16)
                  ?.copyWith(color: ConstColors.bluewDark, fontSize: 16.sp),
              children: <TextSpan>[
                TextSpan(
                    text: '\$${mBestSeller.discount_price}',
                    style: mark500(context, size: 10)?.copyWith(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        )),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text("${mBestSeller.title}",
              style: mark400(context, size: 10))
        ],
      ),
    );
  }
}
