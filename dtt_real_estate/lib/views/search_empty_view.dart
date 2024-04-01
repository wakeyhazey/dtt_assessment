import 'package:flutter/material.dart';
import 'package:real_estate_dtt/utils/custom_textstyle.dart';
import 'package:sizer/sizer.dart';

class SearchEmptyViewWidget extends StatelessWidget {
  const SearchEmptyViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                height: 30.h,
                width: 65.w,
                child: Image.asset('assets/Images/search_state_empty.png')),
          ),
          Text(
            'No results found!',
            style: CustomTextStyle.body,
          ),
          Text(
            'Perhaps try another search?',
            style: CustomTextStyle.body,
          )
        ],
      ),
    );
  }
}
