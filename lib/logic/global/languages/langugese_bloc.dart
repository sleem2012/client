import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/global/languages/languages_model.dart';
import '../../../data/repository/global/global_repo.dart';
import 'languages_states.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';

class LanguagesBloc extends Cubit<LanguagesState> {
  LanguagesBloc({required this.globalRepoImpl}) : super(const LanguagesState.loading());

  static LanguagesBloc of(BuildContext context) {
    return BlocProvider.of<LanguagesBloc>(context);
  }

  final GlobalRepoImpl globalRepoImpl;

  LangDatum? seletedLang;
  LanguagesModel? languagesModel;

  Future getAllLangs() async {
    emit(const LanguagesState.loading());
    try {
      final result = await globalRepoImpl.getLanguages();
      result.fold(
        (l) {
          debugPrint('================= Lang Bloc $l : ');
          emit(LanguagesState.error(erorr: KFailure.toError(l)));
        },
        (r) {
          languagesModel = r;
          final selLang = languagesModel?.data?.where((element) => element.id == seletedLang?.id).toList() ?? [];
          seletedLang = selLang.firstOrNull;
          emit(LanguagesState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= Lang Bloc Ex : $e : ');
      emit(LanguagesState.error(erorr: Tr.get.something_went_wrong));
    }
  }

  selectLang(LangDatum langDatum) {
    KStorage.i.setLang(langDatum.symbols ?? 'en');
    seletedLang = langDatum;
    // emit(LanguagesState.success(model: languagesModel!));
    saveLangId(languagesModel?.data?.where((element) => element.symbols == langDatum.symbols).first.id ?? 2);
    // _update;

    // getAllLangs();
  }

  saveLangId(int id) {
    KStorage.i.setLangId(id);
  }
}
