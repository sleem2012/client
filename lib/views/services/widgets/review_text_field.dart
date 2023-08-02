import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../logic/reviews/reviews_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../widgets/text_field.dart';

class ReviewWidget extends StatelessWidget {
  ReviewWidget({Key? key, required this.id}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final int id;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RatingBar.builder(
            initialRating: 0,
            allowHalfRating: false,
            itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
            onRatingUpdate: (rating) => ReviewsBloc.of(context).setRate(rating),
            // ignoreGestures: true,
            itemSize: 30,
          ),
          const SizedBox(height: 20),
          Form(
            key: formKey,
            child: Row(
              children: [
                Expanded(
                  child: KTextFormField(
                    controller: controller,
                    hintText: Tr.get.write_a_review,
                    validator: (p0) {
                      if(p0!.isEmpty){
                        return Tr.get.write_a_review;
                      }
                      return null ;
                    },
                  ),
                ),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: KColors.of(context).fabBackground,
                  onPressed: () {
                   if(formKey.currentState!.validate()){
                     ReviewsBloc.of(context).crate(id: id, comment: controller.text);
                   }
                  },
                  child: const Icon(Icons.send, size: KHelper.iconSize, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
