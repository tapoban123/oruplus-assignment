import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:oruplus_demo_app/data_model/brand_model.dart';
import 'package:oruplus_demo_app/data_model/faq_model.dart';
import 'package:oruplus_demo_app/data_model/product_model.dart';

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

  Future<List<ProductModel>> fetchAllProducts() async {
    final List<ProductModel> products = [];

    try {
      final response = await http.post(
        Uri.parse("http://40.90.224.241:5000/filter"),
        headers: {
          HttpHeaders.cookieHeader:
              "session=s%3A67a737ad7fca4dd2c99801c4.np%2FXficYhw7YzQ%2BCOge3GhoBtL%2F%2BAt49gB1I%2Fp1ElzU",
          HttpHeaders.cacheControlHeader: "no-cache",
          HttpHeaders.connectionHeader: "keep-alive",
          HttpHeaders.acceptEncodingHeader: "gzip, deflate, br",
          HttpHeaders.acceptHeader: "*/*",
          HttpHeaders.userAgentHeader: "PostmanRuntime/7.43.0",
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode({
          "filter": {},
        }),
      );

      if (response.statusCode != 200) {
        throw const HttpException("Failed to fetch all products.");
      }
      final productsJson = jsonDecode(response.body)["data"]["data"] as List;

      for (final product in productsJson) {
        products.add(ProductModel.fromMap(product));
      }

      debugPrint(products.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return products;
  }
}
