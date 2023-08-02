import 'package:flutter/material.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/text_theme.dart';
import 'package:get/get.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final String? image;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final void Function() onChange;
  final Color? backgroundColor;
  final double? elevation;

  const CustomBtn({
    Key? key,
    required this.text,
    this.height,
    this.width,
    this.elevation,
    this.image,
    this.textStyle,
    required this.onChange,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onChange,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          color: KColors.linearOne,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Container(
          width: width ?? Get.width / 1.2,
          height: height ?? 50,
          color: backgroundColor,
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(text, style: textStyle??KTextStyle.of(context).btntitle.copyWith(fontWeight: FontWeight.bold,)),
          ),
        ),
      ),
    );
  }
}

class KButton extends StatelessWidget {
  const KButton({super.key, required this.title, required this.onPressed, this.width, this.height, this.isLoading = false, this.kFillColor});

  final String title;
  final bool? isLoading;
  final Color? kFillColor;
  final Function() onPressed;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ?? false ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          color: KColors.linearOne,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Container(
          width: width ?? Get.width,
          height: height ?? 45,
          alignment: Alignment.center,
          child: isLoading!
              ? FittedBox(
                  child: SizedBox(
                    height: (height ?? 45) - 10,
                    child: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)),
                  ),
                )
              : FittedBox(
                  child: Text(
                  title,
                  style: KTextStyle.of(context).boldTitle1.copyWith(color: Colors.white, fontSize: 14),
                )),
        ),
      ),
    );
  }
}
