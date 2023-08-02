import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/branch/branch_model.dart';

import '../../../../shared/localization/trans.dart';
import '../../../data/repository/branches/branches_rep.dart';
import '../../packages/shared/error/failures.dart';
import 'branches_state.dart';

class BranchesBloc extends Cubit<BranchesState> {
  BranchesBloc() : super(const BranchesState.initial());

  static BranchesBloc of(BuildContext context) {
    return BlocProvider.of<BranchesBloc>(context);
  }

  BranchModel? branchesModel;

  Future getBranches({required int company_id}) async {
    emit(const BranchesState.loading());
    try {
      final result = await BranchesRepoImpl.i.getBranches(company_id: company_id);
      result.fold(
        (l) {
          emit(BranchesState.error(error: KFailure.toError(l)));
          debugPrint('================= Branches (Bloc) : $l  ');
        },
        (r) {
          branchesModel = r;
          emit(BranchesState.success(model: branchesModel!));
        },
      );
    } catch (e) {
      debugPrint('================= Branches (Bloc) (catch) : $e  ');
      emit(BranchesState.error(error: Tr.get.something_went_wrong));
    }
  }
}
