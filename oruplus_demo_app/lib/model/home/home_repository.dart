import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:oruplus_demo_app/data_model/brand_model.dart';
import 'package:oruplus_demo_app/data_model/faq_model.dart';

class HomeRepository {
  Future<String> _fetchData({required String url}) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) {
        throw const HttpException("Not Found Requested Data.");
      }

      return response.body;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FaqModel>> fetchFaqs() async {
    List<FaqModel> faqsList = [];
    try {
      final response = await _fetchData(url: "http://40.90.224.241:5000/faq");

      final faqs = jsonDecode(response)["FAQs"];

      for (final faq in faqs) {
        faqsList.add(FaqModel.fromMap(faq));
      }

      debugPrint(faqsList.length.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return faqsList;
  }

  Future<List<BrandModel>> fetchBrandData() async {
    List<BrandModel> brandsList = [];
    try {
      final response =
          await _fetchData(url: "http://40.90.224.241:5000/makeWithImages");

      final brands = jsonDecode(response)["dataObject"];
      for (final brand in brands) {
        brandsList.add(BrandModel.fromMap(brand));
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return brandsList;
  }
}
