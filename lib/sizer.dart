import 'package:flutter/material.dart';


final double fixedWidth =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

// double pageWidth =
//     MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

// 모바일 화면 가로 사이즈
const double mobileWidth = 700;
// PC화면 기준 최대 가로 사이즈
const double breakPointWidth = 1100;

final isMobile = fixedWidth < mobileWidth;
final isPC = fixedWidth > mobileWidth;


bool isWeb = true;

// 좌우 패딩
const double paddingHorizontal = 20;
