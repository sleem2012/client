import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app.dart';
import '../../logic/global/settings/settings_bloc.dart';
import '../../logic/global/settings/settings_state.dart';
import '../../shared/localization/trans.dart';
import 'widget/splash_body.dart';
import '../widgets/error/error_view.dart';
import '../widgets/update_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    _controller.addListener(() {
      if (_controller.value == 1.0) {
        _controller.repeat();
      }
    });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.maybeWhen(orElse: () {
          return SplashBody(animation: _animation);
        }, error: (error) {
          return KErrorView(
            error: error,
            onTryAgain: SettingsBloc.of(context).getSettings,
          );
        }, success: (model) {
          if (SettingsBloc.of(context).isUpdate!) {
            return const UpdateScreen();
          } else if(model.data?.first.isLock == true) {
            return KErrorView(error: Tr.get.fix,);

          }else{
            return const Wrapper();
          }
          });
        },
       );
  }
}
