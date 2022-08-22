/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 20:45
 *
 */

import 'package:ecocotask/core/common/colors.dart';
import 'package:ecocotask/core/common/icons.dart';
import 'package:ecocotask/core/common/utils.dart';
import 'package:ecocotask/core/themes/base_theme.dart';
import 'package:ecocotask/domain/usecases/intf/UCDetail.dart';
import 'package:ecocotask/presentation/bloc/cart/bloc_cart.dart';
import 'package:ecocotask/presentation/bloc/cart/bloc_cart.dart';
import 'package:ecocotask/presentation/bloc/detail/bloc_detail.dart';
import 'package:ecocotask/presentation/pages/cart/cart.dart';
import 'package:ecocotask/presentation/pages/detail/widgets/detail_images.dart';
import 'package:ecocotask/presentation/pages/detail/widgets/detail_info.dart';
import 'package:ecocotask/presentation/widgets/button.dart';
import 'package:ecocotask/presentation/widgets/error_card.dart';
import 'package:ecocotask/presentation/widgets/notif_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecocotask/di.dart' as di;

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BlocDetail(di.sl<UCDetail>())..add(BlocDetailEvent.getDetail()),
      child: _DetailScreen(),
    );
  }
}

class _DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 39.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                    Text("Product Details", style: mark500(context, size: 18),),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Button(
                          action: () => Utils.routerScreen(context, Cart()),
                          color: ConstColors.orange,
                          svg: LocalIcons.cart,
                          padding: EdgeInsets.all(13.r),
                          radius: 10,
                        ),
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
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: BlocBuilder<BlocDetail, BlocDetailState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                        orElse: () => SizedBox.shrink(),
                        proceed: () => Center(
                              child: CircularProgressIndicator(),
                            ),
                        fetchedDetail: (data) => Column(
                              children: [
                                Expanded(
                                    child: DetailImages(pData: data.images)),
                                DetailInfo(
                                  mDetail: data,
                                )
                              ],
                            ),
                        error: (e) => Center(
                              child: SizedBox(
                                height: 240.h,
                                child: ErrorCard(
                                    action: () => context
                                        .read<BlocDetail>()
                                        .add(BlocDetailEvent.getDetail())),
                              ),
                            ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
