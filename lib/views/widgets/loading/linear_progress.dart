import 'dart:async';

import 'package:flutter/material.dart';
import '../../../shared/theme/colors.dart';

class LinearProgress extends StatefulWidget {
  final int timeStamp;

  const LinearProgress({Key? key, required this.timeStamp}) : super(key: key);

  @override
  State<LinearProgress> createState() => _LinearProgressState();
}

class _LinearProgressState extends State<LinearProgress> {
  double value = 0.0;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 250), (Timer timer) {
      if (value == 1) {
        timer.cancel();
      } else {
        setState(() {});
        value = value + 0.025;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: KColors.of(context).elevatedBox,
      backgroundColor: KColors.of(context).error,
      value: (DateTime.now().millisecondsSinceEpoch - widget.timeStamp ) / 10000,

    );
  }
}
