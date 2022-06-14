import 'package:flutter/material.dart';

class MarketCellConfiguration {
  Color? increasingState = Colors.green.shade600;
  Color? decreasingState = Colors.red.shade600;
  Color? noChangingState = Colors.grey.shade600;

  Color? marketFromColor = Colors.grey.shade900;
  Color? marketToColor = Colors.grey.shade600;

  Color? divider = Colors.grey.shade200;

  MarketCellConfiguration(
      {this.increasingState,
      this.decreasingState,
      this.noChangingState,
      this.marketFromColor,
      this.marketToColor,
      this.divider,});

  MarketCellConfiguration.general()
      : increasingState = Colors.green.shade600,
        decreasingState = Colors.red.shade600,
        noChangingState = Colors.grey.shade600,
        marketFromColor = Colors.grey.shade900,
        marketToColor = Colors.grey.shade600,
        divider = Colors.grey.shade200;
}
