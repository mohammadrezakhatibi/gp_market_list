import 'package:gp_market_list/models/market_status.dart';

abstract class Market {
  String from;
  String to;
  double lastPrice;
  double changes;
  late MarketStatus? status;

  Market(this.from, this.to, this.lastPrice, this.changes, {this.status});
}