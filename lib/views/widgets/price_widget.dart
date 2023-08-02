import 'package:flutter/material.dart';
import '../../shared/theme/text_theme.dart';
import 'package:get/get.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key, required this.price, required this.currency, this.color, this.size, this.style, this.dotStyle}) : super(key: key);
  final String price;
  final String currency;
  final Color? color;
  final double? size;
  final TextStyle? style;
  final TextStyle? dotStyle;

  @override
  Widget build(BuildContext context) {
    final price = double.tryParse(this.price)?.toPrecision(3).toString();
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: price?.split('.').firstOrNull, style: style ?? KTextStyle.of(context).names),
          TextSpan(text: '.', style: style ?? KTextStyle.of(context).names),
          TextSpan(text: price?.split('.').lastOrNull, style: dotStyle ?? KTextStyle.of(context).names),
          TextSpan(text: " $currency", style: style ?? KTextStyle.of(context).names),
        ],
      ),
    );
  }
}
