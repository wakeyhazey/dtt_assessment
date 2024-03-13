import 'package:flutter/material.dart';
import 'package:real_estate_dtt/ui/bottom_navigation_bar.dart';
import 'package:real_estate_dtt/utils/constants.dart';
import 'package:real_estate_dtt/utils/custom_textstyle.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DttInformationWidget extends StatelessWidget {
  const DttInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ABOUT',
                style: CustomTextStyle.title01,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                aboutText,
                style: CustomTextStyle.body,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Design and Development',
                style: CustomTextStyle.title01,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/Images/dtt_banner/hdpi/dtt_banner.png',
                    width: 30.w,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('by DTT'),
                          TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () async {
                                if (await canLaunchUrl(
                                    Uri.parse('http://www.d-tt.nl/'))) {
                                  await launchUrl(
                                    Uri.parse('http://www.d-tt.nl/'),
                                  );
                                } else {
                                  throw 'Could not launch http://www.d-tt.nl/';
                                }
                              },
                              child: const Text('d-tt.nl'))
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const RootBottomNavigation(),
    );
  }
}
