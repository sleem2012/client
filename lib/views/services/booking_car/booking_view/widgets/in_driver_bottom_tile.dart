import 'package:flutter/material.dart';
import '../../../../../shared/theme/helper.dart';
import '../../../../../shared/theme/text_theme.dart';
import '../../../../map/logic/model/destination_model.dart';
import 'package:get/get.dart';

class InDriverBottomTile extends StatelessWidget {
  const InDriverBottomTile(
      {Key? key,
      this.location,
      required this.placeHolder,
      required this.point,
      required this.color,
      this.isDestination = false,
      this.onPlusTapped,
      this.destinations})
      : super(key: key);
  final String? location;
  final String placeHolder;
  final String point;
  final Color color;
  final bool isDestination;
  final VoidCallback? onPlusTapped;
  final List<DestinationModel>? destinations;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: KHelper.of(context).elevatedBox,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 7),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                  child: FittedBox(
                    child: Text(
                      textAlign: TextAlign.center,
                      point,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                if (destinations!.isNotEmpty)
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: Get.width / 1.5,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Text(
                                (location?.split(',').length ?? 0) > 1 ? location?.split(',')[1] ?? '' : location?.split(',').firstOrNull ?? placeHolder,
                                style: KTextStyle.of(context).body.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Center(
                            child: Text(
                              ' - ',
                              style: KTextStyle.of(context).body.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          itemCount: destinations!.length,
                        ),
                      ),
                    ],
                  )
                else
                  Expanded(
                    child: Text(
                      (location?.split(',').length ?? 0) > 1 ? location?.split(',')[1] ?? '' : location?.split(',').firstOrNull ?? placeHolder,
                      style: KTextStyle.of(context).body.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
          if (isDestination) InkWell(onTap: onPlusTapped ?? () {}, child: const Icon(Icons.add))
        ],
      ),
    );
  }
}
