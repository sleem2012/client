// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_client/data/models/helpers_models.dart';
import 'package:forall_client/data/models/user_info/user_model.dart';
import 'package:forall_client/data/repository/search/search.dart';
import 'package:forall_client/packages/extensions.dart';
import 'package:forall_client/packages/shared/error/failures.dart';
import 'package:forall_client/shared/localization/trans.dart';

import 'search_company_event.dart';

class SearchCompanyBloc extends Bloc<SearchEvent, SearchState> {
  SearchCompanyBloc({required this.searchRepoImpl}) : super(const SearchState.initial()) {
    on<SearchEventSearch>(_handelSearch);
    on<SearchEventApi>(_search);
  }

  static SearchCompanyBloc of(context) => BlocProvider.of(context);

  final SearchRepoImpl searchRepoImpl;

  List<BlocEventState<SearchEvent, SearchState>> stateEvents = [];

  List<UserCompany> data = [];

  final _deBouncer = DeBouncer(200);

  FutureOr<void> _handelSearch(SearchEvent event, Emitter<SearchState> emit) async {
    if (event.qry.isEmpty) {
      emit(const SearchState.initial());
      return;
    }

    final exist = stateEvents.firstWhereOrNull((element) => element.event.qry == event.qry);
    if (exist != null) {
      emit(exist.state);
      return;
    }
    _deBouncer.run(() => add(SearchEventApi(qry: event.qry, srvId: event.srvId)));
  }

  FutureOr<void> _search(SearchEvent event, Emitter<SearchState> emit) async {
    try {
      emit(const SearchState.loading());
      final result = await searchRepoImpl.search(text: event.qry, type: 'company', companyTypeId: event.srvId);
      result.fold(
        (l) {
          emit(SearchState.error(error: KFailure.toError(l)));
          debugPrint('================= getSchedule (Bloc) : $l');
        },
        (r) {
          data = r;
          emit(SearchState.success(data: data));
          stateEvents.add(BlocEventState(event, state));
        },
      );
    } catch (e) {
      debugPrint('================= getSchedule (Bloc) (catch) : $e  ');
      emit(SearchState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }
}
