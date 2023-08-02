import 'package:flutter/material.dart';
import '../../../shared/theme/helper.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGrid extends StatelessWidget {
  final int? count;
  final double? aspectRatio;
  final double? padding;
  final bool? shrinkWrap;
  final Widget? child;
  const ShimmerGrid({Key? key, this.count = 2, this.shrinkWrap, this.aspectRatio, this.padding, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
      shrinkWrap: shrinkWrap ?? false,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisCount: count!,
        childAspectRatio: aspectRatio ?? 1.6,
      ),
      itemBuilder: (c, i) => Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade200,
        child: child ?? Container(margin: EdgeInsets.all(padding ?? 8), decoration: KHelper.of(context).shimmerBox),
      ),
      itemCount: count! * 9,
    );
  }
}

class SubCatShimmer extends StatelessWidget {
  const SubCatShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 60,
              height: 60,
              decoration: KHelper.of(context).shimmerCircle,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 10,
            width: 120,
            decoration: KHelper.of(context).shimmerBox,
          ),
          const SizedBox(height: 5),
          Container(
            height: 10,
            width: 100,
            decoration: KHelper.of(context).shimmerBox,
          )
        ],
      ),
    );
  }
}
