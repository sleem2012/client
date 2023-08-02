import 'package:flutter/material.dart';
import '../../shared/theme/colors.dart';
import '../../packages/widgets/icon_button.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key, required this.icon, this.onTap}) : super(key: key);
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
        radius: 15,
        backgroundColor:
        KColors.of(context).activeIcons,
        child: KIconButton(
          onPressed: onTap,
          child:  Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ));
  }
}
