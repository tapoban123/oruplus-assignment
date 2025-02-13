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
          "Cookie":
              "session=s%3A67a737ad7fca4dd2c99801c4.np%2FXficYhw7YzQ%2BCOge3GhoBtL%2F%2BAt49gB1I%2Fp1ElzU",
          "Cache-Control": "no-cache",
          "Connection": "keep-alive",
          "Accept-Encoding": "gzip, deflate, br",
          "Accept": "*/*",
          "User-Agent": "PostmanRuntime/7.43.0",
        },
        body: {
          "countryCode": countryCode,
          "mobileNumber": mobileNumber,
        },
      );

      if (response.statusCode == 200) {
        debugPrint("OTP Created");
      } else {
        throw const HttpException("Failed to create OTP.");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> validateOtp({
    required int countryCode,
    required int phoneNumber,
    required int otp,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("http://40.90.224.241:5000/login/otpValidate"),
        headers: {
          "Cookie":
              "session=s%3A67a737ad7fca4dd2c99801c4.np%2FXficYhw7YzQ%2BCOge3GhoBtL%2F%2BAt49gB1I%2Fp1ElzU",
          "Cache-Control": "no-cache",
          "Connection": "keep-alive",
          "Accept-Encoding": "gzip, deflate, br",
          "Accept": "*/*",
          "User-Agent": "PostmanRuntime/7.43.0",
        },
        body: {
          "countryCode": countryCode,
          "mobileNumber": phoneNumber,
          "otp": otp,
        },
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
