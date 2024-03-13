import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_dtt/api/dtt_api.dart';
import 'package:real_estate_dtt/api/location_api.dart';
import 'package:real_estate_dtt/models/house_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootRepository {
  final DttApi _dttApi = DttApi();
  final LocationApi _locationApi = LocationApi();

  // Futureb fhmn.gkjshkj/gbaenrj/gbna
  Future<List<HouseDetailModel>?> getListings() async {
    List? response = await _dttApi.getListings();
    if (response != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('listings', jsonEncode(response));
      List<HouseDetailModel> data = [];
      // TO DO: get user location
      LatLng? userPosition = await _locationApi.getCurrentPosition();
      for (var element in response) {
        HouseDetailModel houseModel = HouseDetailModel();
        houseModel.toModel(element);
        if (userPosition != null) {
          houseModel.distance = _locationApi.distance(
                  userPosition,
                  LatLng(element['latitude'].toDouble(),
                      element['longitude'].toDouble())) /
              1000;
        }
        data.add(houseModel);
      }
      return data;
    } else {
      return null;
    }
  }

  Future<List<HouseDetailModel>?> getOfflineList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedData = prefs.getString('listings');

    if (cachedData != null) {
      dynamic dataTransformed = jsonDecode(cachedData);
      List<HouseDetailModel> data = [];
      for (var element in dataTransformed) {
        HouseDetailModel houseModel = HouseDetailModel();
        houseModel.toModel(element);
        data.add(houseModel);
      }
      return data;
    } else {
      return null;
    }
  }

  Future<List<int>> getWishList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> wishList = prefs.getStringList('wishlist') ?? [];

    return wishList.map(int.parse).toList();
  }

  Future<LatLng?> getCurrentPosition() async {
    return _locationApi.getCurrentPosition();
  }

  Future<List<int>> toggleToWishList(int id) async {
    String idString = id.toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishList = prefs.getStringList('wishlist') ?? [];
    if (wishList.contains(idString)) {
      wishList.remove(idString);
    } else {
      wishList.add(idString);
    }
    await prefs.setStringList('wishlist', wishList);
    return wishList.map(int.parse).toList();
  }
}
