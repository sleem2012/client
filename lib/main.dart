import 'packages/cache/locale_storage.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'di.dart'; 

const bool test = false;
const String appName = 'client';
void main() async {
  await Di.init();
  // KStorage.i.erase;
  debugPrint('================= Token : ${KStorage.i.getToken}');
  runApp(const RestartWidget(child: MyApp()));
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) => context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() => setState(() => key = UniqueKey());

  @override
  Widget build(BuildContext context) => KeyedSubtree(key: key, child: widget.child);
}
