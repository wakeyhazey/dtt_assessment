import 'package:flutter/material.dart';
import 'package:real_estate_dtt/models/house_detail_model.dart';
import 'package:real_estate_dtt/ui/bottom_navigation_bar.dart';
import 'package:real_estate_dtt/ui/listing_container.dart';
import 'package:real_estate_dtt/ui/search_app_bar.dart';
import 'package:real_estate_dtt/views/search_empty_view.dart';

class SearchViewWidget extends StatelessWidget {
  final List<HouseDetailModel> listings;

  const SearchViewWidget({super.key, required this.listings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffF7F7F7),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SearchAppBar(),
          if (listings.isNotEmpty)
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: listings.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListingContainer(house: listings[index]);
                },
              ),
            )
          else
            const SearchEmptyViewWidget()
        ],
      ),
      bottomNavigationBar: const RootBottomNavigation(),
    );
  }
}
