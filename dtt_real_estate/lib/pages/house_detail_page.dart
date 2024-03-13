import 'package:flutter/material.dart';
import 'package:real_estate_dtt/models/house_detail_model.dart';
import 'package:real_estate_dtt/ui/house_details_banner.dart';
import 'package:real_estate_dtt/ui/location_map.dart';
import 'package:real_estate_dtt/utils/custom_textstyle.dart';
import 'package:sizer/sizer.dart';

class HouseDetailsPageWidget extends StatefulWidget {
  final HouseDetailModel houseDetails;
  const HouseDetailsPageWidget({super.key, required this.houseDetails});

  @override
  State<HouseDetailsPageWidget> createState() => _HouseDetailsPageWidgetState();
}

class _HouseDetailsPageWidgetState extends State<HouseDetailsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      HouseDetailsBanner(
        houseDetails: widget.houseDetails,
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                '\$${widget.houseDetails.price}',
                style: CustomTextStyle.title01,
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                'Description',
                style: CustomTextStyle.title01,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, right: 16, left: 16),
              child: Text(
                widget.houseDetails.description,
                style: CustomTextStyle.body,
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                'Location',
                style: CustomTextStyle.title01,
              ),
            ),
            SizedBox(
                height: 25.h,
                width: double.infinity,
                child: LocationMap(
                  latitude: widget.houseDetails.latitude,
                  longitude: widget.houseDetails.longitude,
                  title: widget.houseDetails.zipCode,
                )),
          ],
        )
      ]),
    ]));
  }
}
