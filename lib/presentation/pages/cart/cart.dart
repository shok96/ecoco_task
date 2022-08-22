/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 21:33
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/presentation/bloc/cart/bloc_cart.dart';
import 'package:ecocotask/presentation/pages/cart/widgets/cart_item.dart';
import 'package:ecocotask/presentation/pages/cart/widgets/total.dart';
import 'package:ecocotask/presentation/pages/detail/widgets/detail_images.dart';
import 'package:ecocotask/presentation/pages/detail/widgets/detail_info.dart';
import 'package:ecocotask/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async{ context.read<BlocCart>().add(BlocCartEvent.getCart()); },
          child: Padding(
            padding: EdgeInsets.only(top: 36.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                        action: () => Navigator.of(context).pop(),
                        color: ConstColors.bluewDark,
                        icon: Icons.arrow_back_ios_new,
                        padding: EdgeInsets.all(8.r),
                        radius: 10,
                      ),
                      Spacer(),
                      Text("Add address", style: mark500(context, size: 15),),
                      SizedBox(
                        width: 9.w,
                      ),
                      Button(
                        action: () => Navigator.of(context).pop(),
                        color: ConstColors.orange,
                        icon: Icons.location_on_outlined,
                        padding: EdgeInsets.all(10.r),
                        radius: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 35.w),
                  child: Text(
                    "My Cart",
                    style: mark700(context, size: 35),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: ConstColors.bluewDark,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.r),
                            topLeft: Radius.circular(30.r))),
                    child: BlocBuilder<BlocCart, BlocCartState>(
                      builder: (context, state) {
                        return state.when(
                            idle: () => SizedBox.shrink(),
                            proceed: () => Center(
                                  child: CircularProgressIndicator(),
                                ),
                            fetchedCart: (data) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: data.basket.length,
                                        itemBuilder: (context, index) =>
                                            CartItem(mBasket: data.basket[index]),
                                        shrinkWrap: true,
                                      ),
                                    ),
                                    Total(
                                      mCart: data,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 27.h, horizontal: 44.w),
                                      child: Button(
                                        style: mark700(context, size: 20)
                                            ?.copyWith(
                                                color: ConstColors.white,),
                                        textAlign: TextAlign.center,
                                        isFullWidth: true,
                                        color: ConstColors.orange,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15.h),
                                        action: () {
                                          Utils.toast(context, "Покупка успешно совершена");
                                        },
                                        text: "Checkout",
                                        radius: 10.r,
                                      ),
                                    )
                                  ],
                                ),
                            error: (e) => Center(child: Text("Cart is Empty", style: mark500(context, size: 20)?.copyWith(color: ConstColors.white),)));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
