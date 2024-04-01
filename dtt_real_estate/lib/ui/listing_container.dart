import 'package:flutter/material.dart';
import 'package:real_estate_dtt/models/house_detail_model.dart';
import 'package:real_estate_dtt/pages/house_detail_page.dart';
import 'package:real_estate_dtt/ui/house_stats.dart';
import 'package:real_estate_dtt/utils/custom_textstyle.dart';
import 'package:sizer/sizer.dart';

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
          height: 13.h,
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
                  height: 12.h,
                  width: 25.w,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                      HouseStats(
                        bathrooms: house.bathrooms,
                        bedrooms: house.bedrooms,
                        size: house.size,
                        distance: house.distance,
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
