import 'package:flutter/material.dart';
import 'package:gp_market_list/models/market_header_item.dart';

class MarketHeader extends StatelessWidget {
  final List<MarketListPageHeader> items;

  const MarketHeader({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: _setItems(),
      ),
    );
  }

  List<Widget> _setItems() {
    List<Widget> widgets = [];
    for (var i = 0; i < items.length; i++) {
      widgets.add(
        Row(
          children: [
            items[i].icon ?? const SizedBox.shrink(),
            Text(
              items[i].title,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            )
          ],
        ),
      );
      if(i != items.length - 1) {
        widgets.add(const Spacer());
      }
      if(i == 0) {
        widgets.add(const Spacer());
      }
    }
    return widgets;
  }
}