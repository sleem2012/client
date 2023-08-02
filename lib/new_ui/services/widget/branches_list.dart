import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/branch/branch_model.dart';
import '../../../di.dart';
import '../../../logic/get_branches/branches_bloc.dart';
import '../../../logic/get_branches/branches_state.dart';
import 'branches_card.dart';
import '../../../shared/theme/colors.dart';
import '../../../views/widgets/loading/loading_overlay.dart';
import '../../../views/widgets/shimmer_box.dart';
import 'package:get/get.dart';

class BranchesList extends StatelessWidget {
  const BranchesList({Key? key, required this.company_id}) : super(key: key);
  final int company_id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.branchBloc..getBranches(company_id: company_id),
      child: BlocBuilder<BranchesBloc, BranchesState>(
        builder: (context, state) {
          final branch = BranchesBloc.of(context);
          return KRequestOverlay(
            isLoading: state is BranchesStateLoading,
            loadingWidget: ShimmerBox(width: Get.width, height: 120),
            error: state.whenOrNull(error: (error) => error),
            child: ListView.separated(
              itemCount: branch.branchesModel?.branchData?.length ?? 0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return BranchesCard(
                  data: branch.branchesModel?.branchData?[i] ?? BranchData(),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    color: KColors.accentColorD,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
