import 'package:oruplus_demo_app/data_model/brand_model.dart';
import 'package:oruplus_demo_app/data_model/faq_model.dart';
import 'package:oruplus_demo_app/model/home/home_repository.dart';
import 'package:stacked/stacked.dart';

class GetFaqViewModel extends FutureViewModel {
  final HomeRepository homeRepository;

  GetFaqViewModel({
    required this.homeRepository,
  });
  @override
  Future<List<FaqModel>> futureToRun() {
    return fetchFaqs();
  }

  Future<List<FaqModel>> fetchFaqs() async {
    final faqs = await homeRepository.fetchFaqs();
    return faqs;
  }
}

class GetBrandsViewModel extends FutureViewModel {
  final HomeRepository homeRepository;

  GetBrandsViewModel({
    required this.homeRepository,
  });

  @override
  Future<List<BrandModel>> futureToRun() {
    return fetchBrandData();
  }

  Future<List<BrandModel>> fetchBrandData() async {
    final brandData = await homeRepository.fetchBrandData();
    return brandData;
  }
}
