import 'package:flutter/cupertino.dart';

class SizeReporterWidget extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeChange;

  const SizeReporterWidget(
      {Key? key, required this.child, required this.onSizeChange})
      : super(key: key);

  @override
  _SizeReporterWidgetState createState() => _SizeReporterWidgetState();
}

class _SizeReporterWidgetState extends State<SizeReporterWidget> {
  Size? _oldSize;

  void _notifySize() {
    if (!mounted) return;

    final size = context.size;
    if (size != null && _oldSize != size) {
      _oldSize = size;
      widget.onSizeChange(size);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    return widget.child;
  }
}