import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../data/models/products/products_model.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../shared/theme/text_theme.dart';
import '../../../../packages/widgets/image_widget.dart';

class HotelTile extends StatelessWidget {
  const HotelTile({Key? key, required this.data}) : super(key: key);
  final ProductMenu data;

  @override
  Widget build(BuildContext context) {
    //final price = ProHelper.setPriceRang(data);
    return InkWell(
      onTap: () {
        // Nav.to(HotelDetailsScreen(data: data));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: LayoutBuilder(builder: (context, si) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Stack(
                  children: [
                    KImageWidget(
                      imageUrl: data.imageValues?.firstOrNull?.s128px ?? dummyNetLogo,
                      fit: BoxFit.cover,
                      height: 120,
                      width: si.maxWidth * 0.3,
                    ),
                    Positioned(
                      child: Container(
                        width: si.maxWidth * 0.22,
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            data.ribbon ?? '',
                            style: const TextStyle(color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: si.maxWidth * 0.7,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.start,
                    spacing: 8,
                    children: [
                      Text((data.product?.name?.value ?? '') * 5, maxLines: 1, overflow: TextOverflow.ellipsis, style: KTextStyle.of(context).title2),
                      IgnorePointer(
                        child: RatingBar.builder(
                          ///TODO review
                          initialRating: 1.5,
                          allowHalfRating: true,
                          itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
                          onRatingUpdate: (rating) {},
                          itemSize: 10,
                        ),
                      ),
                      Text(
                        data.product?.smallDescription?.value ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: KTextStyle.of(context).hint,
                      ),
                      Text('${data.price}', style: KTextStyle.of(context).title2)
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
