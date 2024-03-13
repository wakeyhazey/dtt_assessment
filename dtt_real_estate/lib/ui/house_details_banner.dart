import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_dtt/blocs/root_page_bloc.dart';
import 'package:real_estate_dtt/models/house_detail_model.dart';
import 'package:real_estate_dtt/utils/constants.dart';
import 'package:sizer/sizer.dart';

class HouseDetailsBanner extends StatefulWidget {
  final HouseDetailModel houseDetails;
  const HouseDetailsBanner({super.key, required this.houseDetails});

  @override
  State<HouseDetailsBanner> createState() => _HouseDetailsBannerState();
}

class _HouseDetailsBannerState extends State<HouseDetailsBanner> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          color: Colors.black,
        )),
      );
    }
    return SizedBox(
      height: 30.h,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              "https://intern.d-tt.nl${widget.houseDetails.image}",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 64),
                child: SvgPicture.asset(
                  'assets/Icons/ic_back.svg',
                  colorFilter: whiteSvgColor,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  loading = true;
                });
                await context
                    .read<RootPageBloc>()
                    .toggleToWishList(widget.houseDetails);
                setState(() {
                  loading = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 32.0, top: 64),
                child: SvgPicture.asset(
                  'assets/Icons/ic_whatshot.svg',
                  colorFilter: context
                          .read<RootPageBloc>()
                          .wishListIds
                          .contains(widget.houseDetails.id)
                      ? likeColor
                      : whiteSvgColor,
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
