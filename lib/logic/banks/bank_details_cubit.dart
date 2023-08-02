import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/user_info/user_model.dart';

import '../../data/repository/banks/banks_repo.dart';
import 'bank_details_state.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';

class BankDetailsCubit extends Cubit<BankDetailsState> {
  BankDetailsCubit({required this.banksRepoImpl}) : super(const BankDetailsState.loading());

  UserCompany? userCompany;

  final BanksRepoImpl banksRepoImpl;

  static BankDetailsCubit of(BuildContext context) => BlocProvider.of<BankDetailsCubit>(context);

  getBanks({required int? id}) async {
    try {
      emit(const BankDetailsState.loading());
      final result = await banksRepoImpl.getBanks(id: id!);
      result.fold(
        (l) {
          debugPrint('================= getBanks $l : ');
          emit(BankDetailsState.error(error: KFailure.toError(l)));
        },
        (r) {
          userCompany = r;
          emit(BankDetailsState.success(model: userCompany!));
        },
      );
    } catch (e) {
      debugPrint('================= getBanks Ex : $e : ');
      emit(BankDetailsState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }
}
