import 'package:flutter/material.dart';
import '../../../shared/theme/helper.dart';
import '../../../logic/company/company_by_id/company_bloc_by_id.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../packages/widgets/image_widget.dart';
import '../../../views/widgets/photo_viewer.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CompanyBlocById data = CompanyBlocById.of(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 6.0, // Spacing between rows
        crossAxisSpacing: 6.0, // Spacing between columns
        childAspectRatio: 1, // Width to height ratio of grid items
      ),
      itemCount: data.compGallery.length, // Number of
      padding:  EdgeInsets.symmetric(horizontal: KHelper.hPadding),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              Nav.to(KPhotoView(image: data.compGallery[index].s512px.toString()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: KImageWidget(
                imageUrl: data.compGallery[index].s256px.toString(),
                fit: BoxFit.cover,
              ),
            ));
      },
    );
  }
}
