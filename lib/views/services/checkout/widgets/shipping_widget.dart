// import 'package:flutter/material.dart';
// import 'package:forall_client/data/models/cart/cart_model.dart';
// import 'package:forall_client/shared/theme/helper.dart';
//
// class ShippingBottomSheet extends StatelessWidget {
//   const ShippingBottomSheet({Key? key, required this.shipping}) : super(key: key);
//   final List<CartBranch> shipping;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: KHelper.of(context).elevatedBox,
//       child: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: const [Expanded(child: Text("Branch",textAlign: TextAlign.center,)), Expanded(child: Text('duration',textAlign: TextAlign.center)), Expanded(child: Text('cost',textAlign: TextAlign.center))],
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             SingleChildScrollView(
//               child: ListView.builder(
//                 itemCount: shipping.length,
//                 shrinkWrap: true,
//                 physics: const BouncingScrollPhysics(),
//                 itemBuilder: (context, i) {
//                   final x = shipping[i].shippers;
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Expanded(child: Text('${x?.weight?.total.toString()??''} ${x?.weight?.unit.toString()??''}',textAlign: TextAlign.center)),
//                       Expanded(child: Text('${x?.duration?.total.toString() ?? ''} ${x?.duration?.unit.toString() ?? ''}',textAlign: TextAlign.center)),
//                       Expanded(child: Text('${x?.distance?.total.toString() ?? ''} ${x?.distance?.unit.toString() ?? ''}',textAlign: TextAlign.center)),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
