import 'package:flutter/material.dart';
import '../../../../packages/extensions.dart';
import '../../../../shared/theme/text_theme.dart';

class KeyValueText extends StatelessWidget {
  final String title, value;
  const KeyValueText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            title,
            style: KTextStyle.of(context).grey_white.S(1.2),
          ),
          Expanded(
            child: Text(
              value,
              style: KTextStyle.of(context).black_grey_bold.S(1.2),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
