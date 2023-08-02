import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/services/servise_gate_response.dart';
import '../../data/models/user_info/user_model.dart';
import '../../data/repository/banks/banks_repo.dart';
import '../../packages/shared/error/failures.dart';
import 'service_gate_state.dart';

class ServiceGateBloc extends Cubit<ServiceGateState> {
  ServiceGateBloc({required this.productsRepo}) : super(const ServiceGateState.loading());

  static ServiceGateBloc of(BuildContext context) => BlocProvider.of<ServiceGateBloc>(context);

  final BanksRepoImpl productsRepo;

  ServiceGatesResponse? serviceGatesModel = ServiceGatesResponse(data: []);

  bool get no_more => serviceGatesModel?.pagination?.meta?.total == serviceGatesModel?.data?.length;
  int page = 1;

  get_service_gate({bool loadMore = false, required int? catId}) async {
    if (no_more && loadMore) return;
    if (loadMore) {
      page++;
      emit(const ServiceGateState.loadMore());
    } else {
      page = 1;
      emit(const ServiceGateState.loading());
    }

    try {
      final result = await productsRepo.get_service_gate(catId);
      result.fold(
        (l) {
          debugPrint('================= ServiceGate Bloc : ${KFailure.toError(l)}');
          emit(ServiceGateState.error(error: l));
        },
        (r) {
          serviceGatesModel = loadMore ? serviceGatesModel?.copyWith(data: serviceGatesModel?.data?..addAll(r.data ?? []), pagination: r.pagination) : r;
          initialData = serviceGatesModel?.data ?? [];

          debugPrint('================= ServiceGate Bloc : ${r.toString()}  ');
          emit(const ServiceGateState.success());
        },
      );
    } catch (e) {
      debugPrint('================= ServiceGate Bloc (Catch): ${e.toString()} ');
      emit(const ServiceGateState.error(error: KFailure.someThingWrongPleaseTryAgain()));
      rethrow;
    }
  }

  List<UserCompany>? initialData = [];

  void search({required String v}) {
    if (v.isNotEmpty) {
      debugPrint('================= $v : ');
      serviceGatesModel = serviceGatesModel?.copyWith(data: initialData?.where((element) => element.name!.value!.contains(v.trim())).toList());
      debugPrint('================= ${serviceGatesModel?.data?.length} : ');
    } else {
      serviceGatesModel = serviceGatesModel?.copyWith(data: initialData);
    }
    emit(ServiceGateState.success(force: UniqueKey().toString()));
  }
}
