library gp_market_list;
import 'package:flutter/material.dart';
import 'package:gp_market_list/models/market_list_page.dart';
import 'package:gp_market_list/utilities/tab_configuration.dart';
import 'package:gp_market_list/widgets/dynamic_page_view.dart';

class MarketListWidget extends StatefulWidget {
  final List<MarketListPage> items;
  final MarketTabConfiguration configuration;
  const MarketListWidget({Key? key, required this.items, required this.configuration}) : super(key: key);

  @override
  MarketListState createState() => MarketListState();
}

class MarketListState extends State<MarketListWidget>
    with TickerProviderStateMixin {

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          height: 32,
          alignment: Localizations.localeOf(context).languageCode == "ar" ? Alignment.topRight : Alignment.topLeft,
          child: TabBar(
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            labelPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            labelColor: widget.configuration.tabLabel,
            labelStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: -0.5),
            isScrollable: true,
            controller: _controller,
            tabs: _tabs(),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: widget.configuration.tabBackground),
          ),
        ),
        DynamicPageView(
          controller: _controller,
          onChange: (page) {
            //_controller.animateTo(page);
          },
          item: _getPages(),
        )
      ],
    );
  }

  List<Tab> _tabs() {
    List<Tab> tabs = [];
    for (var i = 0; i < widget.items.length; i++) {
      tabs.add(Tab(
        text: widget.items[i].title,
        height: 23,
      ));
    }
    return tabs;
  }

  List<Widget> _getPages() {
    List<Widget> widgets = [];
    for (var i = 0; i < widget.items.length; i++) {
      widgets.add(widget.items[i].widget);
    }
    return widgets;
  }
}
