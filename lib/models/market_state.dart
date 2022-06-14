import 'package:flutter/material.dart';
import 'package:gp_market_list/models/market_status.dart';
import 'package:gp_market_list/utilities/cell_configuration.dart';

class MarketState {

  static Color? statusColor(MarketStatus? status, MarketCellConfiguration config) {
    switch(status) {
      case MarketStatus.notChanged:
        return config.noChangingState;
      case MarketStatus.increased:
        return config.increasingState;
      case MarketStatus.decreased:
        return config.decreasingState;
      default:
        return config.noChangingState;
    }
  }
}