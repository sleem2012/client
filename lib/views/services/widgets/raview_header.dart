import 'package:flutter/material.dart';
import '../../../shared/theme/colors.dart';

class ReviewBar extends StatelessWidget {
  const ReviewBar({Key? key, required this.value, required this.rate}) : super(key: key);
  final double value;
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rate,
          style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 7,
                child: LinearProgressIndicator(
                  value: value,
                  valueColor: AlwaysStoppedAnimation(KColors.of(context).activeIcons),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
