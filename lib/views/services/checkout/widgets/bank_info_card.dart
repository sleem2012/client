// import 'package:flutter/material.dart';
// import 'package:forall_client/shared/theme/colors.dart';
// import 'package:forall_client/shared/theme/text_theme.dart';
// import 'package:get/get.dart';
//
// class BankInfoCard extends StatelessWidget {
//   const BankInfoCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Card Information',
//                 style: KTextStyle.of(context).title2.copyWith(fontSize: 11, color: KColors.of(context).text),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: Get.height * .01,
//         ),
//         Container(
//           padding: const EdgeInsets.all(10),
//           width: double.infinity,
//           decoration: BoxDecoration(color: KColors.of(context).bluish),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildSummaryText(context, 'Bank Name', 'AL-Ahly Bank'),
//               const SizedBox(
//                 height: 5,
//               ),
//               _buildSummaryText(context, 'Account Name', 'Yacob M'),
//               const SizedBox(
//                 height: 5,
//               ),
//               _buildSummaryText(context, 'Account Number', '12312312312312312'),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// Widget _buildSummaryText(context, String text, String info) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         text,
//         style: KTextStyle.of(context).body.copyWith(fontSize: 12, color: KColors.of(context).text),
//       ),
//       Text(info,
//           style: KTextStyle.of(context).body.copyWith(
//                 fontSize: 12,
//                 color: KColors.of(context).text,
//               ))
//     ],
//   );
// }
