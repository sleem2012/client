import '../../data/models/card_info_model.dart';
import '../../data/models/products/products_model.dart';
import '../../shared/theme/helper.dart';

abstract class ProductHelper {
  static double reviewAvg(List<ProductMenu?> pros) {
    final list = <double>[];
    double sum = 0.0;

    for (var pro in pros) {
      for (var rev in pro?.review ?? <Review>[]) {
        list.add(rev.rate ?? 0.0);
      }
    }
    if (list.isNotEmpty) {
      final s = list.reduce((a, b) => a + b);
      sum += s / list.length;
    }
    return sum;
  }

  static double proReviewAvg(ProductMenu? pros) {
    final list = <double>[];
    double sum = 0.0;

    for (var rev in pros?.review ?? <Review>[]) {
      list.add(rev.rate ?? 0.0);
    }

    if (list.isNotEmpty) {
      final s = list.reduce((a, b) => a + b);
      sum += s / list.length;
    }
    return sum;
  }

  static CardDataModel modelToCardModel(ProductsSystemData model) {
    final List<ImageValues> images = [];
    for (var element in model.products!) {
      images.addAll(element.imageValues ?? []);
    }

    return CardDataModel(
      id: model.id!,
      isFav: model.isFav!,
      name: model.name?.value ?? '',
      brand: model.company?.name?.value ?? '',
      rate: reviewAvg(model.products ?? []),
      logo: images.firstOrNull?.s256px ?? dummyNetLogo,
      description: model.description?.value ?? '',
    );
  }

  static List<String> setPriceRang(ProductsSystemData data) {
    List<String> priceRang = [];
    List<double> priceInDouble = [];
    if ((data.products ?? []).isNotEmpty) {
      data.products?.forEach((e) {
        priceRang.add(e.price ?? '');
      });
      for (var price in priceRang) {
        double? parsedPrice = double.tryParse(price.split(' ').first);
        priceInDouble.add(parsedPrice ?? 0);
      }
      priceInDouble.sort();
      priceRang.clear();
      for (var price in priceInDouble) {
        priceRang.add('$price SAR');
      }
    }
    return priceRang;
  }
}
