/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 22.08.2022, 22:08
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 22.08.2022, 15:16
 *
 */

import 'package:ecocotask/core/common/utils.dart';
import 'package:flutter/rendering.dart';
import "package:freezed_annotation/freezed_annotation.dart";

part 'MDetail.freezed.dart';

part 'MDetail.g.dart';

@freezed
class MDetail with _$MDetail {

  const MDetail._();

  const factory MDetail({
    required String CPU,
    required String camera,
    required List<String> capacity,
    required List<String> color,
    required String id,
    required List<String> images,
    required bool isFavorites,
    required int price,
    required num rating,
    required String sd,
    required String ssd,
    required String title,
  }) = _MDetail;

  List<Color> getColors(){
    return this.color.map((e) => HexColor.fromHex(e)).toList();
  }

  factory MDetail.fromJson(Map<String, dynamic> json) => _$MDetailFromJson(json);

}
