import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/orders/orders_repo.dart';
import '../../../packages/shared/error/failures.dart';
import 'send_request_quote_state.dart';

class SendRequestQuoteBloc extends Cubit<SendRequestQuoteState> {
  SendRequestQuoteBloc({required this.ordersRepo}) : super(const SendRequestQuoteState.initial());

  static SendRequestQuoteBloc of(BuildContext context) => BlocProvider.of<SendRequestQuoteBloc>(context);
  final OrdersRepoImp ordersRepo;

  post({String? company_id, String? paragraph}) async {
    try {
      emit(const SendRequestQuoteState.loading());
      final result = await ordersRepo.request_for_quote({"company_id": company_id, "paragraph": paragraph});
      result.fold(
        (l) {
          debugPrint('================= SendRequestQuote Bloc : ${KFailure.toError(l)}');
          emit(SendRequestQuoteState.error(error: l));
        },
        (r) {
          debugPrint('================= SendRequestQuote Bloc : ${r.toString()}  ');
          emit(const SendRequestQuoteState.success());
        },
      );
    } catch (e) {
      debugPrint('================= SendRequestQuote Bloc (Catch): ${e.toString()} ');
      emit(const SendRequestQuoteState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
