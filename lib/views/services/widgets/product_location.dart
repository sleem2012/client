// import 'package:flutter/material.dart';
// import 'package:forall_client/shared/theme/colors.dart';
// import 'package:forall_client/shared/theme/helper.dart';
// import 'package:forall_client/shared/theme/text_theme.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
//
// class ProductLocation extends StatelessWidget {
//   const ProductLocation({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//          Padding(
//            padding: const EdgeInsets.all(KHelper.hPading),
//            child: Align(
//              alignment: Alignment.topLeft,
//              child: Text('Choose your Location',
//               style: KTextStyle.of(context).title.copyWith(fontSize: 11),
//         ),
//            ),
//          ),
//
//         SizedBox(
//           height:300,
//           child: ListView.separated(
//             // physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, i) => Container(
//                     padding: const EdgeInsets.all(10),
//                     width: double.infinity,
//                     decoration: BoxDecoration(color: KColors.of(context).bluish),
//                     child: Align(
//                       alignment: Alignment.topLeft,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                               'Fitted T-shirt in ribbed cotton jersey with a wide neckline, placket and sleeves that finish above the elbow.',
//                               style: KTextStyle.of(context).title.copyWith(
//                                   fontSize: 10, fontWeight: FontWeight.normal)),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                               'Fitted T-shirt in ribbed cotton jersey with a wide neckline, placket and sleeves that finish above the elbow.',
//                               style: KTextStyle.of(context).title.copyWith(
//                                   fontSize: 10, fontWeight: FontWeight.normal)),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Text('Art. No. 1057822002',
//                               style: KTextStyle.of(context).title.copyWith(
//                                   fontSize: 10, fontWeight: FontWeight.normal)),
//                         ],
//                       ),
//                     ),
//                   ),
//               separatorBuilder: (context, i) => const SizedBox(
//                 height: 10,
//               ),
//               itemCount: 4),
//         ),
//       ],
//     );
//   }
// }
