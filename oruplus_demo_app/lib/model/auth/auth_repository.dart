import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<void> createOtp({
    required int countryCode,
    required int mobileNumber,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("http://40.90.224.241:5000/login/otpCreate"),
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
          "countryCode": countryCode,
          "mobileNumber": mobileNumber,
        }),
      );

      if (response.statusCode == 200) {
        debugPrint("OTP Created");
      } else {
        throw HttpException("${response.statusCode}: ${response.body}");
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception("An error occurred.");
    }
  }

  Future<void> validateOtp({
    required int countryCode,
    required int phoneNumber,
    required int otp,
  }) async {
    // OTP is the last 4 digits of the phone number.
    try {
      final response = await http.post(
        Uri.parse("http://40.90.224.241:5000/login/otpValidate"),
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
          "countryCode": countryCode,
          "mobileNumber": phoneNumber,
          "otp": otp,
        }),
      );

      if (response.statusCode == 200) {
        debugPrint("OTP Validated.");
      } else {
        throw const HttpException("Failed to validate OTP.");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
