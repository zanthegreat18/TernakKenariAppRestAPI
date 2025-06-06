import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:restapi/data/model/request/buyer/buyer_profile_request_model.dart';
import 'package:restapi/data/model/response/buyer/buyer_profile_reponse_model.dart';
import 'package:restapi/service/service_http_client.dart';

class ProfileBuyerRepository {
  final ServiceHttpClient _serviceHttpClient;
  
  ProfileBuyerRepository(this._serviceHttpClient);
  
  Future<Either<String, BuyerProfileResponseModel>> addProfileBuyer(
    BuyerProfileRequestModel requestModel,
  ) async {
    try {
      final response = await _serviceHttpClient.postWithToken(
        "buyer/profile",
        requestModel.toJson(),
      );
      
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final profileResponse = BuyerProfileResponseModel.fromJson(
          jsonResponse,
        );
        return Right(profileResponse);
      } else {
        final errorMessage = json.decode(response.body);
        return Left(errorMessage['message'] ?? 'Unknown error occurred');
      }
    } catch (e) {
      return Left("An error occurred while adding profile: $e");
    }
  }
  
  Future<Either<String, BuyerProfileResponseModel>> getProfileBuyer() async {
    try {
      final response = await _serviceHttpClient.get("buyer/profile");
      
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final profileResponse = BuyerProfileResponseModel.fromJson(
          jsonResponse,
        );
        print("Profile Response: $profileResponse");
        return Right(profileResponse);
      } else {
        final errorMessage = json.decode(response.body);
        return Left(errorMessage['message'] ?? 'Unknown error occurred');
      }
    } catch (e) {
      return Left("An error occurred while fetching profile: $e");
    }
  }
}