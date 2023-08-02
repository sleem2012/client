// import 'package:flutter/material.dart';
// import 'package:forall_client/shared/theme/colors.dart';
// import 'package:forall_client/shared/theme/text_theme.dart';
// import 'package:forall_client/views/services/checkout/widgets/address_card.dart';
// import 'package:forall_client/views/services/checkout/widgets/bank_info_card.dart';
// import 'package:forall_client/views/services/checkout/widgets/summary_card.dart';
//
// class SummaryScreen extends StatelessWidget {
//   const SummaryScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children:  [
//             const SummaryCard(),
//             const SizedBox(height: 10,),
//             const AddressCard(),
//             const SizedBox(height: 10,),
//             const BankInfoCard(),
//             SizedBox(
//               width: double.infinity,
//               child: Padding(
//                 padding:  const EdgeInsets.all(8.0),
//                 child: RawMaterialButton(
//                   onPressed: () {
//                   },
//                   fillColor: KColors.of(context).activeIcons,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Confirm',
//                         style: KTextStyle.of(context).editBTN.copyWith(
//                             fontSize: 12,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
