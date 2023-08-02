import 'package:flutter/material.dart';
import '../../../../../shared/theme/helper.dart';
import '../../../../../shared/theme/text_theme.dart';
import '../../../../map/logic/model/destination_model.dart';

class DestinationTile extends StatelessWidget {
  const DestinationTile({Key? key, required this.index, required this.model, required this.onDelete}) : super(key: key);
  final int index;
  final DestinationModel model;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: KHelper.of(context).elevatedBox,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    model.address ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: KTextStyle.of(context).title2,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(onTap: onDelete, child: const Icon(Icons.clear)),
              const SizedBox(
                width: 10,
              ),
              ReorderableDragStartListener(index: index, child: const Icon(Icons.list)),
            ],
          ),
        ],
      ),
    );
  }
}
