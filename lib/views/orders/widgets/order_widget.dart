// import 'package:flutter/material.dart';
// import 'package:forall_client/shared/theme/text_theme.dart';
// import 'package:forall_client/views/orders/widgets/order_card.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
//
// class OrderWidget extends StatelessWidget {
//   const OrderWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             children: [
//               Text(
//                  'Shopping',
//                 style: KTextStyle.of(context).title.copyWith(fontSize: 12),
//               ),
//               const SizedBox(
//                 width: 4,
//               ),
//               Text(
//                 '1',
//                 style: KTextStyle.of(context).title.copyWith(fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         ListView.separated(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           separatorBuilder: (context, i) => SizedBox(
//             height: Get.height * .01,
//           ),
//           itemBuilder: (context, i) =>  OrderProductCard(shippingData: [],),
//           itemCount: 5,
//         )
//       ],
//     );
//   }
// }
