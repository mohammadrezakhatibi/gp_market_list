import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gp_market_list/models/market_state.dart';
import 'package:gp_market_list/models/market.dart';
import 'package:gp_market_list/models/market_status.dart';
import 'package:gp_market_list/utilities/cell_configuration.dart';

class MarketListTableWidget extends StatefulWidget {
  final List<Market> items;
  final Widget? header;
  final Widget? footer;
  final MarketCellConfiguration configuration;
  const MarketListTableWidget({Key? key, required this.items, this.header, this.footer, required this.configuration}) : super(key: key);
  // const MarketListTableWidget(
  //     {Key? key, required this.items, this.header, this.footer, this.configuration })
  //     : super(key: key);

  @override
  MarketListTableState createState() => MarketListTableState();
}

class MarketListTableState extends State<MarketListTableWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.header ?? const SizedBox.shrink(),
        CustomScrollView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _cell(widget.items[index]);
                },
                childCount: widget.items.length,
              ),
            ),
          ],
        ),
        widget.footer ?? const SizedBox.shrink(),
      ],
    );
  }

  Widget _cell(Market market) {
    return SizedBox(
      height: 59,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      market.from,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: widget.configuration.marketFromColor,
                      ),
                    ),
                    Text(
                      " /${market.to}",
                      style: TextStyle(
                        fontSize: 12,
                        color: widget.configuration.marketToColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  market.lastPrice.toString(),
                  style: TextStyle(
                      color: MarketState.statusColor(market.status, widget.configuration),
                      fontWeight: FontWeight.normal),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: MarketState.statusColor(market.status, widget.configuration),
                  ),
                  padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                  child: Text(
                    market.status == MarketStatus.increased
                        ? "+${market.changes.toString()}"
                        : "-${market.changes.toString()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            const Spacer(),
            Divider(
              height: 1,
              color: widget.configuration.divider,
            )
          ],
        ),
      ),
    );
  }
}
