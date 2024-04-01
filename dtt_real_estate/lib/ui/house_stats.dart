import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_dtt/utils/constants.dart';
import 'package:real_estate_dtt/utils/custom_textstyle.dart';
import 'package:sizer/sizer.dart';

class HouseStats extends StatelessWidget {
  final int bedrooms;
  final int bathrooms;
  final int size;
  final double? distance;

  const HouseStats(
      {super.key,
      required this.bedrooms,
      required this.bathrooms,
      required this.size,
      required this.distance});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/Icons/ic_bed.svg',
                colorFilter: greySvgColor,
                width: 2.2.w,
                height: 2.2.h,
              ),
              Text(
                bedrooms.toString(),
                style: CustomTextStyle.subtitle,
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/Icons/ic_bath.svg',
                colorFilter: greySvgColor,
                width: 2.2.w,
                height: 2.2.h,
              ),
              Text(
                bathrooms.toString(),
                style: CustomTextStyle.subtitle,
              )
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/Icons/ic_layers.svg',
                colorFilter: greySvgColor,
                width: 2.2.w,
                height: 2.2.h,
              ),
              Text(
                size.toString(),
                style: CustomTextStyle.subtitle,
              )
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/Icons/ic_location.svg',
                colorFilter: greySvgColor,
                width: 2.2.w,
                height: 2.2.h,
              ),
              Text(
                distance != null
                    ? '${distance!.toStringAsFixed(2)} km'
                    : 'null',
                style: CustomTextStyle.subtitle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
