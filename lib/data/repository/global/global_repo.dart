import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../models/global/currencies/currencies_model.dart';
import '../../models/global/languages/languages_model.dart';
import '../../models/global/location/adresses/add_address_model.dart';
import '../../models/global/location/adresses/adress_model.dart';
import '../../models/global/location/cities/cities_model.dart';
import '../../models/global/location/countries/countries_model.dart';
import '../../models/global/settings/settings_model.dart';
import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';

abstract class _GlobalRepoAbs {
  Future<Either<KFailure, SettingsModel>> getSettings();

  Future<Either<KFailure, CountriesModel>> getCountries();

  Future<Either<KFailure, CitiesModel>> getCities(String countryId);

  Future<Either<KFailure, LanguagesModel>> getLanguages();

  Future<Either<KFailure, CurrenciesModel>> getCurrencies();

  Future<Either<KFailure, AddressModel>> getAddresses();

  Future<Either<KFailure, AddressData>> addAddresses(AddAddressModel addressModel);

  Future<Either<KFailure, String>> deleteAddress(int? id);
}

class GlobalRepoImpl implements _GlobalRepoAbs {
  @override
  Future<Either<KFailure, SettingsModel>> getSettings() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.settings);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(SettingsModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CountriesModel>> getCountries() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.countries);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CountriesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CitiesModel>> getCities(String countryId) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.cities, params: {"country_id": countryId});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CitiesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, LanguagesModel>> getLanguages() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.lang);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(LanguagesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CurrenciesModel>> getCurrencies() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.currencies);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CurrenciesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, AddressModel>> getAddresses() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.addresses);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(AddressModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, AddressData>> addAddresses(AddAddressModel AddAddressModel) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.addresses, data: AddAddressModel.toJson());

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(AddressData.fromJson(r['data'])));
  }

  @override
  Future<Either<KFailure, String>> deleteAddress(int? id) async {
    Future<Response<dynamic>> func = Di.dioClient.delete(KEndPoints.addresses, params: {"id": id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(r['message']),
    );
  }
}
