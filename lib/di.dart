import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'logic/get_branches/branches_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'data/repository/ads/company_repo.dart';
import 'data/repository/auth/auth_repo.dart';
import 'data/repository/banks/banks_repo.dart';
import 'data/repository/cart/cart_repo.dart';
import 'data/repository/delivering/delivering_repo.dart';
import 'data/repository/favourite/favourite_repo.dart';
import 'data/repository/global/global_repo.dart';
import 'data/repository/in_drive/in_drive_repo.dart';
import 'data/repository/jobs/jobs_repo.dart';
import 'data/repository/orders/orders_repo.dart';
import 'data/repository/products/products_repo.dart';
import 'data/repository/reports/medical_service_repo.dart';
import 'data/repository/reviews/reviews_repo.dart';
import 'data/repository/schedule/schedule_repo.dart';
import 'data/repository/search/search.dart';
import 'data/repository/services/services_repo.dart';
import 'logic/auth/change_pass/change_pass_cubit.dart';
import 'logic/auth/forget_pass/forget_pass_bloc.dart';
import 'logic/auth/login/login_bloc.dart';
import 'logic/auth/logout/logout_bloc.dart';
import 'logic/auth/register/register_bloc.dart';
import 'logic/auth/reset_pass/reset_pass_bloc.dart';
import 'logic/auth/update_user/update_user_bloc.dart';
import 'logic/auth/user_info/user_info_bloc.dart';
import 'logic/auth/verfiy_code/verfiy_code_bloc.dart';
import 'logic/banks/bank_details_cubit.dart';
import 'logic/cart/cart_bloc.dart';
import 'logic/categories/get_category/get_categories_cubit.dart';
import 'logic/checkout/checkout_bloc.dart';
import 'logic/company/company_bloc.dart';
import 'logic/company/company_by_id/company_bloc_by_id.dart';
import 'logic/delivering/delivering_map/delivering_map_bloc.dart';
import 'logic/delivering/delivering_payment/delivering_payment_cubit.dart';
import 'logic/delivering/get_delivering_order/get_delivering_order_bloc.dart';
import 'logic/extra/extra_cubit.dart';
import 'logic/favourite/favorite_bloc.dart';
import 'logic/get_banks/get_banks_bloc.dart';
import 'logic/get_reports/get_reports_bloc.dart';
import 'logic/global/addresses/add_address_bloc/add_address_bloc.dart';
import 'logic/global/addresses/addresses_bloc.dart';
import 'logic/global/currencies/currencies_bloc.dart';
import 'logic/global/languages/langugese_bloc.dart';
import 'logic/global/location/location_bloc.dart';
import 'logic/global/settings/settings_bloc.dart';
import 'logic/hotels/hotel_extra_bloc.dart';
import 'logic/in_drive/find_driver/find_driver_cubit.dart';
import 'logic/in_drive/get/get_in_drive_bloc.dart';
import 'logic/in_drive/in_drive_bloc.dart';
import 'logic/in_drive/indriver_payment/delivering_payment_cubit.dart';
import 'logic/in_drive/rate_trip/rate_trip_cubit.dart';
import 'logic/in_drive/update_trip/update_trip_cubit.dart';
import 'logic/jobs/apply_to_job/apply_to_job_cubit.dart';
import 'logic/jobs/getCv/get_cv_bloc.dart';
import 'logic/jobs/get_jobs/get_jobs_bloc.dart';
import 'logic/jobs/uploadCv/upload_cv_cubit.dart';
import 'logic/main_view/main_view_bloc.dart';
import 'logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'logic/observer.dart';
import 'logic/orders/create_order/create_orders_bloc.dart';
import 'logic/orders/get_orders/get_orders_bloc.dart';
import 'logic/orders/get_request_quoet/get_request_quoet_bloc.dart';
import 'logic/orders/order_status/order_status_bloc.dart';
import 'logic/orders/review_order/review_order_bloc.dart';
import 'logic/orders/send_request_quote/send_request_quote_bloc.dart';
import 'logic/pick_image/pick_image_cubit.dart';
import 'logic/products/color/color_bloc.dart';
import 'logic/products/get_pro_attrs_fields/get_pro_attrs_fields_bloc.dart';
import 'logic/products/hotels_system/hotels_bloc.dart';
import 'logic/products/product_menu/product_menu_bloc.dart';
import 'logic/products/product_system_bloc/products_bloc.dart';
import 'logic/reviews/reviews_bloc.dart';
import 'logic/schedule/schedule_bloc.dart';
import 'logic/search_company/search_company_cubit.dart';
import 'logic/service_gate/service_gate_bloc.dart';
import 'logic/services/services_cubit.dart';
import 'logic/theme/theme_cubit.dart';
import 'main.dart';
import 'packages/chat/data/repo/chat_repo.dart';
import 'packages/chat/logic/msg_bloc/messages_bloc.dart';
import 'packages/chat/logic/rooms_bloc/chat_rooms_bloc.dart';
import 'packages/payment/logic/add_card_bloc/add_payment_card_bloc.dart';
import 'packages/payment/logic/add_payment_bloc/add_payment_bloc.dart';
import 'packages/payment/logic/get_my_payment_bloc/get_my_payment_bloc.dart';
import 'packages/payment/logic/get_tyeps_bloc/get_payment_type_bloc.dart';
import 'packages/shared/api_client/api_client_impl.dart';
import 'packages/shared/api_client/endpoints.dart';
import 'packages/shared/api_midleware_bloc/api_client_bloc.dart';
import 'shared/notifications_ctrl.dart/notifications_ctrl.dart';
import 'shared/socket/socket_ctrl.dart';
import 'views/map/logic/map_cubit/map_bloc.dart';
import 'views/map/logic/map_search_bloc/map_search_bloc.dart';
import 'views/map/logic/place_details_bloc/place_details_bloc.dart';
import 'views/notifications/bloc/get_notifications_bloc.dart';
import 'views/notifications/repo/notificaions_repo.dart';
import 'packages/shared/picker/logic/country_search_cubit/country_search_cubit.dart';

abstract class Di {
  static final GetIt _i = GetIt.instance;

  static reset(context) async {
    await _unReg();
    RestartWidget.restartApp(context);
    await _i.resetScope(dispose: true);
    _reg();
  }

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    Bloc.observer = MyBlocObserver();
    await NotificationCtrl.fcm_init('Forall Client');
    _reg();
  }

  static _reg() {
    _i.registerSingleton<SocketCtrl>(SocketCtrl(KEndPoints.socket)..init);
    _i.registerLazySingleton(() => DioClientImpl(apiClientBloc: _i()));
    _i.registerLazySingleton(() => Connectivity());
    _i.registerLazySingleton(() => ImagePicker());
    _i.registerLazySingleton(() => ThemeBloc());
    _i.registerLazySingleton(() => ApiClientBloc());
    _i.registerLazySingleton(() => EmojiParser());
    _i.registerFactory(() => MainViewBloc());
    _i.registerFactory(() => NavEnforcerBloc());
    _i.registerFactory(() => MapBloc());
    _i.registerFactory(() => PlaceDetailsBloc());
    _i.registerFactory(() => MapSearchBloc());
    _i.registerFactory(() => SearchCompanyBloc(searchRepoImpl: _i()));
    _i.registerFactory(() => NotificationsBloc(notificationsRepoImpl: _i()));
    _i.registerFactory(() => CheckoutBloc(cartRepoImp: _i()));
    _i.registerFactory(() => CurrenciesBloc(globalRepoImpl: _i()));
    _i.registerFactory(() => LanguagesBloc(globalRepoImpl: _i()));
    _i.registerFactory(() => SettingsBloc(globalRepoImpl: _i()));
    _i.registerFactory(() => ChangePassCubit(authRepoImpl: _i()));
    _i.registerFactory(() => LocationBloc(globalRepoImpl: _i()));
    _i.registerFactory(() => RegisterBloc());
    _i.registerFactory(() => LoginBloc());
    _i.registerFactory(() => VerfiyCodeBloc());
    _i.registerFactory(() => ForgetPasswordBloc());
    _i.registerFactory(() => LogoutBloc());
    _i.registerFactory(() => ResetPasswordBloc());
    _i.registerFactory(() => CompanyBlocById(compRepoImpl: _i()));
    _i.registerFactory(() => PickImageCubit());
    _i.registerFactory(() => CalculateInDriveBloc(inDriveRepoImp: _i()));
    _i.registerFactory(() => FindDriverBloc(inDriveRepoImp: _i()));
    _i.registerFactory(() => GetInDriveBloc(inDriveRepoImp: _i()));
    _i.registerFactory(() => UserInfoBloc());
    _i.registerFactory(() => UpdateUserBloc());
    _i.registerFactory(() => CompanyBloc(compRepoImpl: _i()));
    _i.registerFactory(() => ServicesCubit(servicesRepoImpl: _i()));
    _i.registerFactory(() => GetCategoriesBloc(servicesRepo: _i()));
    _i.registerFactory(() => ReviewsBloc(reviewsRepoImp: _i()));
    _i.registerFactory(() => FavoriteBloc(favouriteRepoImp: _i()));
    _i.registerFactory(() => CartBloc(cartRepoImp: _i()));
    _i.registerFactory(() => ExtraBloc(cartRepoImp: _i()));
    _i.registerFactory(() => ScheduleBloc(scheduleRepoImpl: _i()));
    _i.registerFactory(() => ChatRoomsBloc());
    _i.registerFactory(() => MessagesBloc());
    _i.registerFactory(() => GetCvsBloc(jobsRepoImp: _i()));
    _i.registerFactory(() => GetProAttrsFieldsBloc(productsRepoImpl: _i()));
    _i.registerFactory(() => CountrySearchCubit());

    _i.registerFactory(() => ApplyToJobCubit(jobsRepoImp: _i()));
    _i.registerFactory(() => UploadCvCubit(jobsRepoImp: _i()));
    _i.registerFactory(() => GetJobsBloc(jobsRepoImp: _i()));
    _i.registerFactory(() => DeliveringMapBloc(deliveringRepoImp: _i()));
    _i.registerFactory(() => InDrivePaymentCubit(inDriveRepoImp: _i()));
    _i.registerFactory(() => GetDeliveringOrderBloc(deliveringRepoImp: _i()));
    _i.registerLazySingleton(() => AddressesBloc(globalRepoImpl: _i()));
    _i.registerFactory(() => DeliveringPaymentCubit(deliveringRepoImp: _i()));
    _i.registerFactory(() => AddAddressCubit(globalRepoImpl: _i()));
    _i.registerFactory(() => AddPaymentTypeBloc());
    _i.registerFactory(() => MyPaymentsBloc());
    _i.registerFactory(() => OrderStatusBloc(ordersRepoImp: _i()));
    _i.registerFactory(() => ReviewOrderBloc(ordersRepoImp: _i()));
    _i.registerFactory(() => GetReportsBloc(getReportsRepoImp: _i()));
    _i.registerFactory(() => UpdateTripCubit(inDriveRepoImp: _i()));
    _i.registerFactory(() => RateTripCubit(inDriveRepoImp: _i()));
    _i.registerFactory(() => AddCardBloc());
    _i.registerFactory(() => GetPaymentTypeBloc());
    _i.registerFactory(() => HotelExtraBloc());
    _i.registerFactory(() => HotelsBloc(productsRepoImp: _i()));
    _i.registerFactory(() => BankDetailsCubit(banksRepoImpl: _i()));
    _i.registerFactory(() => GetProductsBloc(productsRepoImp: _i()));
    _i.registerFactory(() => SendRequestQuoteBloc(ordersRepo: _i()));
    _i.registerFactory(() => GetRequestQuoteBloc(ordersRepoImp: _i()));
    _i.registerFactory(() => ServiceGateBloc(productsRepo: _i()));
    _i.registerFactory(() => ProductMenuBloc(productsRepoImp: _i()));
    _i.registerFactory(() => GetBanksBloc());
    _i.registerFactory(() => BranchesBloc());

    _i.registerLazySingleton(() => GlobalRepoImpl());
    _i.registerLazySingleton(() => AuthRepoImpl.i);
    _i.registerLazySingleton(() => CompanyRepoImpl());
    _i.registerLazySingleton(() => DeliveringRepoImp());
    _i.registerLazySingleton(() => NotificationsRepoImpl());
    _i.registerLazySingleton(() => ReviewsRepoImp());
    _i.registerLazySingleton(() => ServicesRepoImpl());
    _i.registerLazySingleton(() => ProductsRepoImp());
    _i.registerLazySingleton(() => FavouriteRepoImp());
    _i.registerLazySingleton(() => CartRepoImp());
    _i.registerLazySingleton(() => ScheduleRepoImpl());
    _i.registerLazySingleton(() => JobsRepoImp());
    _i.registerLazySingleton(() => ReportServiceRepoImp());
    _i.registerLazySingleton(() => InDriveRepoImp());
    _i.registerLazySingleton(() => BanksRepoImpl());
    _i.registerLazySingleton(() => SearchRepoImpl());

    //order
    _i.registerFactory(() => CreateOrdersBloc(ordersRepoImp: _i()));
    _i.registerFactory(() => GetOrderBloc(ordersRepoImp: _i()));
    _i.registerFactory(() => ColorBloc(repo: _i()));
    _i.registerLazySingleton(() => OrdersRepoImp());
  }

  static _unReg() async {
    await _i.unregister<GetProAttrsFieldsBloc>();

    await _i.unregister<SocketCtrl>();
    await _i.unregister<DeliveringMapBloc>();
    await _i.unregister<CheckoutBloc>();
    await _i.unregister<CompanyBlocById>();
    await _i.unregister<DeliveringPaymentCubit>();
    await _i.unregister<DioClientImpl>();
    await _i.unregister<GetInDriveBloc>();
    await _i.unregister<NotificationsBloc>();
    await _i.unregister<Connectivity>();
    await _i.unregister<CreateOrdersBloc>();
    await _i.unregister<ThemeBloc>();
    await _i.unregister<UpdateTripCubit>();
    await _i.unregister<InDrivePaymentCubit>();
    await _i.unregister<RateTripCubit>();
    await _i.unregister<GetDeliveringOrderBloc>();
    await _i.unregister<ApiClientBloc>();
    await _i.unregister<AddCardBloc>();
    await _i.unregister<LanguagesBloc>();
    await _i.unregister<SettingsBloc>();
    await _i.unregister<GetBanksBloc>();
    await _i.unregister<LocationBloc>();
    await _i.unregister<MainViewBloc>();
    await _i.unregister<ChangePassCubit>();
    await _i.unregister<CurrenciesBloc>();
    await _i.unregister<RegisterBloc>();
    await _i.unregister<PickImageCubit>();
    await _i.unregister<CalculateInDriveBloc>();
    await _i.unregister<UserInfoBloc>();
    await _i.unregister<UpdateUserBloc>();
    await _i.unregister<GetPaymentTypeBloc>();
    await _i.unregister<LoginBloc>();
    await _i.unregister<VerfiyCodeBloc>();
    await _i.unregister<ReviewOrderBloc>();
    await _i.unregister<ForgetPasswordBloc>();
    await _i.unregister<LogoutBloc>();
    await _i.unregister<ProductMenuBloc>();
    await _i.unregister<ResetPasswordBloc>();
    await _i.unregister<NavEnforcerBloc>();
    await _i.unregister<CompanyBloc>();
    await _i.unregister<OrderStatusBloc>();
    await _i.unregister<ServicesCubit>();
    await _i.unregister<GetCategoriesBloc>();
    await _i.unregister<ReviewsBloc>();
    await _i.unregister<FavoriteBloc>();
    await _i.unregister<CartBloc>();
    await _i.unregister<ExtraBloc>();
    await _i.unregister<ScheduleBloc>();
    await _i.unregister<ImagePicker>();
    await _i.unregister<ChatRoomsBloc>();
    await _i.unregister<MessagesBloc>();
    await _i.unregister<AddressesBloc>();
    await _i.unregister<EmojiParser>();
    await _i.unregister<AddAddressCubit>();
    await _i.unregister<GetCvsBloc>();
    await _i.unregister<PlaceDetailsBloc>();
    await _i.unregister<MapSearchBloc>();
    await _i.unregister<SearchCompanyBloc>();
    await _i.unregister<HotelExtraBloc>();
    await _i.unregister<GetProductsBloc>();
    await _i.unregister<CountrySearchCubit>();
    await _i.unregister<ServiceGateBloc>();
    await _i.unregister<ColorBloc>();

    await _i.unregister<ApplyToJobCubit>();
    await _i.unregister<UploadCvCubit>();
    await _i.unregister<HotelsBloc>();
    await _i.unregister<GetJobsBloc>();
    await _i.unregister<GlobalRepoImpl>();
    await _i.unregister<AuthRepoImpl>();
    await _i.unregister<CompanyRepoImpl>();
    await _i.unregister<NotificationsRepoImpl>();
    await _i.unregister<InDriveRepoImp>();
    await _i.unregister<ReviewsRepoImp>();
    await _i.unregister<ServicesRepoImpl>();
    await _i.unregister<ProductsRepoImp>();
    await _i.unregister<CartRepoImp>();
    await _i.unregister<ScheduleRepoImpl>();
    await _i.unregister<JobsRepoImp>();
    await _i.unregister<OrdersRepoImp>();
    await _i.unregister<AddPaymentTypeBloc>();
    await _i.unregister<MyPaymentsBloc>();
    await _i.unregister<GetOrderBloc>();
    await _i.unregister<GetReportsBloc>();
    await _i.unregister<BankDetailsCubit>();
    await _i.unregister<BanksRepoImpl>();
    await _i.unregister<SearchRepoImpl>();
    await _i.unregister<SendRequestQuoteBloc>();
    await _i.unregister<GetRequestQuoteBloc>();
    await _i.unregister<BranchesBloc>();
  }

  // getters
  static DioClientImpl get dioClient => _i.get<DioClientImpl>();

  static CheckoutBloc get checkout => _i.get<CheckoutBloc>();

  static InDrivePaymentCubit get inDriverPayment => _i.get<InDrivePaymentCubit>();

  static NotificationsBloc get getNotifications => _i.get<NotificationsBloc>();

  static CreateOrdersBloc get createOrder => _i.get<CreateOrdersBloc>();

  static Connectivity get connectivity => _i.get<Connectivity>();

  static ThemeBloc get themeBloc => _i.get<ThemeBloc>();

  static ApiClientBloc get apiClientBloc => _i.get<ApiClientBloc>();

  static LanguagesBloc get languagesBloc => _i.get<LanguagesBloc>();

  static SettingsBloc get settingsBloc => _i.get<SettingsBloc>();

  static BranchesBloc get branchBloc => _i.get<BranchesBloc>();

  static LocationBloc get locationBloc => _i.get<LocationBloc>();

  static MainViewBloc get mainViewBloc => _i.get<MainViewBloc>();

  static MapSearchBloc get mapSearchBloc => _i.get<MapSearchBloc>();

  static ChangePassCubit get changePass => _i.get<ChangePassCubit>();

  static CurrenciesBloc get currenciesBloc => _i.get<CurrenciesBloc>();

  static RegisterBloc get registerBloc => _i.get<RegisterBloc>();

  static PickImageCubit get pickImageCubit => _i.get<PickImageCubit>();

  static UserInfoBloc get userInfoBloc => _i.get<UserInfoBloc>();

  static UpdateUserBloc get updateUserBloc => _i.get<UpdateUserBloc>();

  static LoginBloc get loginBloc => _i.get<LoginBloc>();

  static VerfiyCodeBloc get verfiyCodeBloc => _i.get<VerfiyCodeBloc>();

  static ForgetPasswordBloc get forgetPasswordBloc => _i.get<ForgetPasswordBloc>();

  static LogoutBloc get logoutBloc => _i.get<LogoutBloc>();

  static ResetPasswordBloc get resetPasswordBloc => _i.get<ResetPasswordBloc>();

  static NavEnforcerBloc get navEnforcerBloc => _i.get<NavEnforcerBloc>();

  static CompanyBloc get compBloc => _i.get<CompanyBloc>();

  static ServicesCubit get servicesBloc => _i.get<ServicesCubit>();

  static GetCategoriesBloc get setCategories => _i.get<GetCategoriesBloc>();

  static HotelsBloc get hotelsBloc => _i.get<HotelsBloc>();

  static AddPaymentTypeBloc get addPaymentTypeBloc => _i.get<AddPaymentTypeBloc>();

  static MyPaymentsBloc get myPaymentsBloc => _i.get<MyPaymentsBloc>();

  static ReviewsBloc get reviewsBloc => _i.get<ReviewsBloc>();

  static FavoriteBloc get favoriteBloc => _i.get<FavoriteBloc>();

  static CartBloc get cartBloc => _i.get<CartBloc>();

  static ExtraBloc get extraBloc => _i.get<ExtraBloc>();

  static ScheduleBloc get scheduleBloc => _i.get<ScheduleBloc>();

  static ImagePicker get imagePicker => _i.get<ImagePicker>();

  static ChatRoomsBloc get chatBloc => _i.get<ChatRoomsBloc>();

  static MessagesBloc get sendMsgBloc => _i.get<MessagesBloc>();

  static ChatRepoImp get chatRepo => _i.get<ChatRepoImp>();

  static EmojiParser get emojiParser => _i.get<EmojiParser>();

  static GetCvsBloc get cvBloc => _i.get<GetCvsBloc>();

  static ApplyToJobCubit get applyToJobCubit => _i.get<ApplyToJobCubit>();

  static GetBanksBloc get getBanksBloc => _i.get<GetBanksBloc>();

  static AddressesBloc get addressesBloc => _i.get<AddressesBloc>();

  static UploadCvCubit get uploadCvCubit => _i.get<UploadCvCubit>();

  static GetJobsBloc get getJobsBloc => _i.get<GetJobsBloc>();

  static AddAddressCubit get addAddressCubit => _i.get<AddAddressCubit>();

  static SocketCtrl get socket => _i.get<SocketCtrl>();

  static GetOrderBloc get getOrderBloc => _i.get<GetOrderBloc>();

  static MapBloc get mapBloc => _i.get<MapBloc>();

  static GetProAttrsFieldsBloc get getProAttrsFieldsBloc => _i.get<GetProAttrsFieldsBloc>();

  static PlaceDetailsBloc get placeDetailsBloc => _i.get<PlaceDetailsBloc>();

  static OrderStatusBloc get orderStatusBloc => _i.get<OrderStatusBloc>();

  static ReviewOrderBloc get reviewOrderBloc => _i.get<ReviewOrderBloc>();

  static DeliveringMapBloc get deliveringMapBloc => _i.get<DeliveringMapBloc>();

  static DeliveringPaymentCubit get deliveringPaymentCubit => _i.get<DeliveringPaymentCubit>();

  static GetDeliveringOrderBloc get getDeliveringOrderBloc => _i.get<GetDeliveringOrderBloc>();

  static GetReportsBloc get getReportsBloc => _i.get<GetReportsBloc>();

  static CalculateInDriveBloc get inDriveBloc => _i.get<CalculateInDriveBloc>();

  static FindDriverBloc get findDriverBloc => _i.get<FindDriverBloc>();

  static UpdateTripCubit get updateTripCubit => _i.get<UpdateTripCubit>();

  static GetInDriveBloc get getInDriveBloc => _i.get<GetInDriveBloc>();

  static RateTripCubit get rateTripCubit => _i.get<RateTripCubit>();

  static AddCardBloc get addCardBloc => _i.get<AddCardBloc>();

  static GetPaymentTypeBloc get getPaymentTypeBloc => _i.get<GetPaymentTypeBloc>();

  static GetProductsBloc get getProductsBloc => _i.get<GetProductsBloc>();

  static BankDetailsCubit get bankDetailsCubit => _i.get<BankDetailsCubit>();

  static SearchCompanyBloc get searchCubit => _i.get<SearchCompanyBloc>();

  static HotelExtraBloc get hotelExtraBloc => _i.get<HotelExtraBloc>();

  static CountrySearchCubit get countrySearchCubit => _i.get<CountrySearchCubit>();

  static SendRequestQuoteBloc get sendRequestQuoteBloc => _i.get<SendRequestQuoteBloc>();

  static GetRequestQuoteBloc get getRequestQuoteBloc => _i.get<GetRequestQuoteBloc>();

  static ColorBloc get getColor => _i.get<ColorBloc>();

  static ServiceGateBloc get serviceGateBloc => _i.get<ServiceGateBloc>();

  static CompanyBlocById get companyBlocById => _i.get<CompanyBlocById>();

  static ProductMenuBloc get productMenuBloc => _i.get<ProductMenuBloc>();
}
