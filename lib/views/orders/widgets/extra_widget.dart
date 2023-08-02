import 'package:flutter/material.dart';
import '../../../data/models/cart/cart_model.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';

class ExtraWidget extends StatelessWidget {
  const ExtraWidget({Key? key, required this.extraCollection}) : super(key: key);
  final List<CartItemExtra> extraCollection;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KHelper.of(context).elevatedBox,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return Container(
              decoration: KHelper.of(context).elevatedBox,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        extraCollection[i].images?.firstOrNull?.s128px ?? dummyNetLogo,
                        fit: BoxFit.cover,
                        width: 102,
                        height: 97,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            extraCollection[i].name ?? '',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                '${Tr.get.amount} : ${extraCollection[i].quantity ?? ''}',
                                style: const TextStyle(fontSize: 10),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${Tr.get.price} : ${extraCollection[i].price ?? ''}',
                            style: const TextStyle(fontSize: 10),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, i) => const SizedBox(
                height: 8,
              ),
          itemCount: extraCollection.length),
    );
  }
}
