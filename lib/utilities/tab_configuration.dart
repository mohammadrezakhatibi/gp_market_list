import 'package:flutter/material.dart';

class MarketTabConfiguration {
  Color? tabBackground = Colors.grey.shade200;
  Color? tabLabel = Colors.grey.shade200;

  MarketTabConfiguration(
      {this.tabBackground,
        this.tabLabel});

  MarketTabConfiguration.general()
      : tabBackground = Colors.grey.shade200,
        tabLabel = Colors.grey.shade200;
}
