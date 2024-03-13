import 'package:flutter/material.dart';
import 'package:real_estate_dtt/models/house_detail_model.dart';
import 'package:real_estate_dtt/ui/bottom_navigation_bar.dart';
import 'package:real_estate_dtt/ui/listing_container.dart';
import 'package:real_estate_dtt/utils/custom_textstyle.dart';

class WishListViewWidget extends StatelessWidget {
  final List<HouseDetailModel> listings;
  const WishListViewWidget({super.key, required this.listings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wish List', style: CustomTextStyle.title02)),
      body: ListView.builder(
          itemCount: listings.length,
          itemBuilder: (BuildContext context, int index) {
            return ListingContainer(house: listings[index]);
          }),
      bottomNavigationBar: const RootBottomNavigation(),
    );
  }
}
