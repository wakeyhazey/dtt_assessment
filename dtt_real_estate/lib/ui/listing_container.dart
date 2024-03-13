import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_dtt/models/house_detail_model.dart';
import 'package:real_estate_dtt/pages/house_detail_page.dart';
import 'package:real_estate_dtt/utils/constants.dart';
import 'package:real_estate_dtt/utils/custom_textstyle.dart';

class ListingContainer extends StatelessWidget {
  final HouseDetailModel house;
  const ListingContainer({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      HouseDetailsPageWidget(houseDetails: house)));
        },
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[350]!,
                blurRadius: 5.0,
              )
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    "https://intern.d-tt.nl${house.image}",
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Center(child: Icon(Icons.error_outline));
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${house.price.toString()}',
                              style: CustomTextStyle.title02,
                            ),
                            Text(
                              '${house.zipCode} ${house.city}',
                              style: CustomTextStyle.subtitle,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/Icons/ic_bed.svg',
                                    colorFilter: greySvgColor),
                                Text(house.bedrooms.toString()),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/Icons/ic_bath.svg',
                                    colorFilter: greySvgColor),
                                Text(house.bathrooms.toString())
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/Icons/ic_layers.svg',
                                    colorFilter: greySvgColor),
                                Text(house.size.toString())
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/Icons/ic_location.svg',
                                    colorFilter: greySvgColor),
                                Text(house.distance != null
                                    ? house.distance!.toStringAsFixed(2)
                                    : 'null')
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
