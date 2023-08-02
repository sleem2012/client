import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/orders/request_quote_.dart';
import '../../../data/repository/orders/orders_repo.dart';
import '../../../packages/shared/error/failures.dart';
import 'get_request_quoet_state.dart';

class GetRequestQuoteBloc extends Cubit<GetRequestQuoteState> {
  GetRequestQuoteBloc({required this.ordersRepoImp}) : super(const GetRequestQuoteState.loading());

  static GetRequestQuoteBloc of(BuildContext context) => BlocProvider.of<GetRequestQuoteBloc>(context);

  final OrdersRepoImp ordersRepoImp;
  RequestQuoteResponse? quotes;

  get() async {
    try {
      emit(const GetRequestQuoteState.loading());
      final result = await ordersRepoImp.get_request_quotes();
      result.fold(
        (l) {
          debugPrint('================= GetRequestQuoet Bloc : ${KFailure.toError(l)}');
          emit(GetRequestQuoteState.error(error: l));
        },
        (r) {
          debugPrint('================= GetRequestQuoet Bloc : ${r.toString()}  ');
          quotes = r;
          emit(GetRequestQuoteState.success(r));
        },
      );
    } catch (e) {
      debugPrint('================= GetRequestQuoet Bloc (Catch): ${e.toString()} ');
      emit(const GetRequestQuoteState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  List<RequestQuoteModel> getFiltered(String state) {
    return quotes?.data?.where((element) => element.state == state).toList() ?? [];
  }
}
