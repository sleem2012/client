import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';
import '../../models/products/get_pro_attr_model.dart';
import '../../models/products/products_model.dart';

abstract class ProductsRepoAbs {
  Future<Either<KFailure, ProductsSysModel>> get_products({required int catId, required int count, required int page, int? companyId});

  Future<Either<KFailure, HotelsProductResponse>> get_hotels_products(Map<String, dynamic> map);

  Future<Either<KFailure, GetProAttrsFieldsModel>> get_pro_attrs_menu(int? catId);

  Future<Either<KFailure, ProductsMenuModel>> get_pro_menu(int? pro_sys_id);

  Future<Either<KFailure, List<ProductColor>?>> get_colors();
}

class ProductsRepoImp implements ProductsRepoAbs {
  @override
  Future<Either<KFailure, ProductsSysModel>> get_products({required int? catId, required int count, required int page, int? companyId}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.getProducts, params: {
      if (catId != null) "category_id": catId,
      if (companyId != null) "company_id": companyId,
      "page_count": count,
      "page": page,
    });
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(ProductsSysModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, HotelsProductResponse>> get_hotels_products(Map<String, dynamic> map) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.getHotelsProducts, data: FormData.fromMap(map));

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(HotelsProductResponse.fromJson(r)));
  }

  @override
  Future<Either<KFailure, GetProAttrsFieldsModel>> get_pro_attrs_menu(int? catId) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.get_category_attr_fields, params: {"category_id": catId});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(GetProAttrsFieldsModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, ProductsMenuModel>> get_pro_menu(int? pro_sys_id) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.productMenu, params: {"product_id": pro_sys_id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(ProductsMenuModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, List<ProductColor>>> get_colors() async {
    Future<Response<dynamic>> func = Di.dioClient.get(
      KEndPoints.product_colors,
    );
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) {
      List<ProductColor> colors = [];

      if (r['data'] != null) {
        r['data'].forEach((v) {
          colors.add(ProductColor.fromJson(v));
        });
      }
      return right(colors);
    });
  }
}
