import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DttApi {
  final String _urlHouse = 'https://intern.d-tt.nl/api/house';
  final String _accessKey = '98bww4ezuzfePCYFxJEWyszbUXc7dxRx';

  Future<List?> getListings() async {
    // var url =
    //     Uri.https('intern.d-tt.nl', '/api/house', {'Access-Key': _accessKey});
    try {
      // var response = await http.get(url);
      return await http.get(Uri.parse(_urlHouse), headers: {
        'Access-Key': _accessKey,
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials":
            'true', // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS"
      }).then((res) => jsonDecode(res.body));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
