import 'package:flutter/material.dart';
import 'package:real_estate_dtt/models/house_detail_model.dart';
import 'package:real_estate_dtt/ui/house_details_banner.dart';
import 'package:real_estate_dtt/ui/house_stats.dart';
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
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.houseDetails.price}',
                style: CustomTextStyle.title01,
              ),
              HouseStats(
                bathrooms: widget.houseDetails.bathrooms,
                bedrooms: widget.houseDetails.bedrooms,
                size: widget.houseDetails.size,
                distance: widget.houseDetails.distance,
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: CustomTextStyle.title01,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                widget.houseDetails.description,
                style: CustomTextStyle.body,
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: CustomTextStyle.title01,
              ),
              SizedBox(
                height: 2.h,
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
      ),
    ]));
  }
}
