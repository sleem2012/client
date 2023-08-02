import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../data/models/card_info_model.dart';
import '../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../orders/request_quote/request_quote_dialog.dart';
import '../../hotels/widget/gallery_dialog.dart';
import '../../../../packages/widgets/icon_button.dart';
import '../../../../packages/widgets/image_widget.dart';
import 'package:get/get.dart';

class CompaniesCard extends StatelessWidget {
  const CompaniesCard({Key? key, required this.data, required this.onTap ,required this.onCompanyViewTap}) : super(key: key);
  final Function() onTap;
  final Function() onCompanyViewTap;
  final CardDataModel data;

  @override
  Widget build(BuildContext context) {
    final bool isAr = Directionality.of(context) == TextDirection.rtl;
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: DecoratedBox(
              decoration: KHelper.of(context).elevatedBox,
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: 120,
                    child: KImageWidget(
                      imageUrl: data.cover!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 58),
                            Expanded(
                              child: Text(data.name.capitalize ?? "", style: KTextStyle.of(context).title4, overflow: TextOverflow.ellipsis),
                            ),
                            RatingBar.builder(
                              initialRating: data.rate.toDouble(),
                              allowHalfRating: true,
                              itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
                              onRatingUpdate: (rating) {},
                              ignoreGestures: true,
                              itemSize: 9,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                data.description.capitalize ?? "",
                                style: KTextStyle.of(context).tilePropsValues,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 93,
            child: Container(
              decoration: KHelper.of(context).elevatedBox.copyWith(borderRadius: BorderRadius.circular(50), boxShadow: []),
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: KImageWidget(
                  imageUrl: data.logo!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: isAr ? 10 : null,
            right: isAr ? null : 10,
            width: Get.width - 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (data.covers!.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      Nav.to(GalleryViewer(images: data.covers!.map((e) => e.s512px ?? "").toList()));
                    },
                    child: Transform.scale(
                      scaleY: -1,
                      child: const KIconButton(
                        radius: 15,
                        child: Icon(Icons.photo_library, color: Colors.white, size: 20),
                      ),
                    ),
                  )
                else
                  const SizedBox(),
                Container(
                  decoration: KHelper.of(context).elevatedBox,
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: Text(data.category?.capitalize ?? '', style: KTextStyle.of(context).body2),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -15,
            left: isAr ? 10 : null,
            right: isAr ? null : 10,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.dialog(RequestForQuoteDialog(companyId: data.id));
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: KColors.of(context).activeIcons,
                    child: const IgnorePointer(
                        child: Icon(
                      Icons.email,
                      color: Colors.white,
                      size: 20,
                    )),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: onCompanyViewTap,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: KColors.of(context).activeIcons,
                    child: const IgnorePointer(child: Icon(Icons.account_balance, color: Colors.white, size: 20)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
