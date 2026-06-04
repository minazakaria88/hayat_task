import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sizes {
  static SizedBox verticalSpace(final double height) =>
      SizedBox(height: height.h);

  static SizedBox horizontalSpace(final double width) =>
      SizedBox(width: width.w);

  static double getWidth(final BuildContext context) =>
      MediaQuery.of(context).size.width.w;

  static double getHeight(final BuildContext context) =>
      MediaQuery.of(context).size.height.h;

  static double get pagePadding => 16.0.w;

  /// Calculates the number of shimmer items needed to fill a horizontal list
  /// with a partial overflow effect.
  ///
  /// This ensures the shimmer list extends slightly beyond the screen width,
  /// creating a visual hint that more content exists.
  ///
  /// Example:
  /// ```dart
  /// final itemCount = Sizes.calculateShimmerItemCount(
  ///   screenWidth: MediaQuery.sizeOf(context).width,
  ///   cardWidth: 92.w,
  ///   spacing: AppSpacing.lg,
  /// );
  /// ```
  static int calculateShimmerItemCount({
    required double screenWidth,
    required double cardWidth,
    required double spacing,
  }) {
    return (screenWidth / (cardWidth + spacing)).ceil() + 1;
  }
}


class AppSpacing {
  static const double xs = 4.0;    // 4PX
  static const double sm = 8.0;    // 8PX
  static const double md = 12.0;   // 12PX
  static const double lg = 16.0;   // 16PX
  static const double xl = 18.0;   // 18PX
  static const double xxl = 24.0;  // 24PX
  static const double xxxl = 32.0; // 32PX
  static const double huge = 40.0; // 40PX
  static const double massive = 52.0; // 52PX
  static const double giant = 64.0;   // 64PX
  static const double colossal = 72.0; // 72PX
  static const double enormous = 80.0; // 80PX
}

class AppRadius {
  static const double xs = 4.0;    // 4PX
  static const double sm = 8.0;    // 8PX
  static const double md = 12.0;   // 12PX
  static const double lg = 16.0;   // 16PX
  static const double xl = 18.0;   // 18PX
  static const double xxl = 24.0;  // 24PX
  static const double xxxl = 32.0; // 32PX
  static const double huge = 40.0; // 40PX
  static const double massive = 52.0; // 52PX
  static const double giant = 64.0;   // 64PX
  static const double colossal = 72.0; // 72PX
  static const double enormous = 80.0; // 80PX
}
