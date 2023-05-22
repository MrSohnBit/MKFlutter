import 'package:flutter/material.dart';


final double fixedWidth =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

// double pageWidth =
//     MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

// 모바일 화면 가로 사이즈
const double mobileWidth = 730;
// PC화면 기준 최대 가로 사이즈
const double breakPointWidth = 1200;

final isMobile = fixedWidth < mobileWidth;
final isPC = fixedWidth > mobileWidth;

// bool get isTablet => fixedWidth > 730;
// bool get isPC => fixedWidth > 1200;
// bool get isMobile => !isTablet && !isPC;


bool isWeb = true;

// 좌우 패딩
const double paddingHorizontal = 20;


extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 730;
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}