import 'package:flutter/cupertino.dart';
import '../../../logic/orders/review_order/review_order_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/text_field.dart';

class ReviewComment extends StatelessWidget {
  const ReviewComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: KHelper.of(context).elevatedBox,
      child: Column(
        children: [
          Text(Tr.get.what_did_you_like_the_most_about_it, style: KTextStyle.of(context).names.copyWith(fontSize: 13)),
          const SizedBox(
            height: 40,
          ),
          KTextFormField(
            controller: ReviewOrderBloc.of(context).noteCtrl,
            maxLines: 6,
            hintText: Tr.get.write_a_review,
          ),
        ],
      ),
    );
  }
}
