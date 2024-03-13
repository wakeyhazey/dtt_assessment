import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_dtt/blocs/root_page_bloc.dart';
import 'package:real_estate_dtt/utils/constants.dart';
import 'package:real_estate_dtt/utils/custom_textstyle.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DTT REAL ESTATE',
                  style: CustomTextStyle.title02,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: context.read<RootPageBloc>().searchTerm,
                    decoration: InputDecoration(
                        suffixIcon: Container(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            'assets/Icons/ic_search.svg',
                            colorFilter: greySvgColor,
                            // height: 20.h,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Search for a home',
                        hintStyle: CustomTextStyle.hint,
                        filled: true,
                        fillColor: const Color(0xffEBEBEB)),
                    onChanged: (value) {
                      context.read<RootPageBloc>().add(SearchListings(
                          searchString:
                              context.read<RootPageBloc>().searchTerm.text));
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
