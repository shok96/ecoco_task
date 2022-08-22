

/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 21:36
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/core/common/images.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/data/models/MCart.dart';
import 'package:ecocotask/presentation/bloc/cart/bloc_cart.dart';
import 'package:ecocotask/presentation/pages/cart/widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartItem extends StatelessWidget{

  MBasket mBasket;

  CartItem({required this.mBasket});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45.h, left: 33.w, right: 33.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Container(
              width: 88.r,
              height: 88.r,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(mBasket.images),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(mBasket.title, style: mark500(context, size: 20)?.copyWith(color: ConstColors.white),),
                Text("\$${mBasket.price}", style: mark500(context, size: 20)?.copyWith(color: ConstColors.orange),)
              ],
              ),
            ),
          ),
          Counter(id: mBasket.id, count: mBasket.count),
          SizedBox(width: 18.w,),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
              onTap: () => context.read<BlocCart>().add(BlocCartEvent.removeItem(mBasket)),
              child: SvgPicture.asset(LocalIcons.trash))
        ],
      ),
    );
  }

}