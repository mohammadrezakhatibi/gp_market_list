import 'package:flutter/material.dart';
import 'package:gp_market_list/widgets/size_reporter_widget.dart';

class DynamicPageView extends StatefulWidget {
  final ValueChanged<int> onChange;
  final List<Widget> item;
  final TabController controller;

  const DynamicPageView(
      {Key? key,
      required this.onChange,
      required this.item,
      required this.controller})
      : super(key: key);

  @override
  _DynamicPageViewState createState() => _DynamicPageViewState();
}

class _DynamicPageViewState extends State<DynamicPageView>
    with SingleTickerProviderStateMixin {
  double get _currentHeight => _height[_currentPage];
  int _currentPage = 0;
  late final List<double> _height =
      List.generate(widget.item.length, (index) => 0.0).toList();

  @override
  void initState() {
    widget.controller.addListener(() {
      final newPage = widget.controller.index.round();
      if (_currentPage != newPage) {
        setState(() => _currentPage = newPage);
      }
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: _currentHeight),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) => SizedBox(height: value, child: child),
      child: TabBarView(
        controller: widget.controller,
        children: _getItems(),
      ),
    );
  }

  List<Widget> _getItems() {
    List<Widget> widgets = [];
    for (var i = 0; i < widget.item.length; i++) {
      widgets.add(OverflowBox(
          alignment: Alignment.topLeft,
          minHeight: 0,
          maxHeight: double.infinity,
          child: SizeReporterWidget(
              child: widget.item[i],
              onSizeChange: (size) =>
                  setState(() => _height[i] = size.height))));
    }
    return widgets;
  }
}
