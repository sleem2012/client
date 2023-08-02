import 'products/products_model.dart';
import 'user_info/user_model.dart';
import '../../shared/theme/helper.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CardDataModel {
  final String? price;
  final String? currency;
  final int id;
  final bool isFav;
  final String name;
  final String brand;
  final String description;
  final String? logo;
  final String? cover;
  final List<Logo>? covers;
  final String? category;
  final num rate;
  final ProductsSystemData? productsData;

  CardDataModel(
      {this.currency,
      this.price,
      required this.id,
      required this.isFav,
      required this.name,
      required this.brand,
      required this.description,
      this.category,
      this.cover,
      this.logo,
      this.covers,
      required this.rate,
      this.productsData});

  factory CardDataModel.fromProData(ProductsSystemData productsData) {
    final List<ImageValues> images = [];
    for (var element in productsData.products!) {
      images.addAll(element.imageValues ?? []);
    }

    return CardDataModel(
        price: productsData.products?.firstOrNull != null ? (productsData.products?.firstOrNull?.price?.split(' ').firstOrNull ?? '') : '',
        currency: productsData.products?.firstOrNull != null ? (productsData.products?.firstOrNull?.price?.split(' ').lastOrNull ?? '') : '',
        id: productsData.id!,
        isFav: productsData.isFav ?? false,
        name: productsData.name?.value ?? '',
        brand: productsData.category?.name ?? '',
        rate: 9,
        description: productsData.description?.value ?? "",
        logo: images.firstOrNull?.s256px ?? dummyNetLogo,
        covers: images.map((e) => Logo.fromJson(e.toMap())).toList(),
        productsData: productsData);
  }

  factory CardDataModel.fromUserCompany(UserCompany model) {
    return CardDataModel(
      id: model.id!,
      isFav: (model.companyReview ?? 0) == 0,
      name: model.name?.value ?? '',
      brand: model.description?.value ?? '',
      rate: model.companyReview ?? 0.0,
      logo: model.logo?.s256px ?? dummyNetLogo,
      description: model.description?.value ?? '',
      category: model.category_name ?? '',
      cover: model.coverPhotos?.firstOrNull?.s256px ?? dummyNetCover,
      covers: model.coverPhotos ?? [],
    );
  }
}
