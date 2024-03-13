import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_dtt/blocs/root_page_bloc.dart';
import 'package:real_estate_dtt/utils/constants.dart';

class RootBottomNavigation extends StatelessWidget {
  const RootBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      currentIndex: context.read<RootPageBloc>().navIndex,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Icons/ic_whatshot.svg',
              colorFilter: context.read<RootPageBloc>().navIndex != 0
                  ? greySvgColor
                  : null,
            ),
            label: 'llikes'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Icons/ic_home.svg',
              colorFilter: context.read<RootPageBloc>().navIndex != 1
                  ? greySvgColor
                  : null,
            ),
            label: 'listings'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/Icons/ic_info.svg',
              colorFilter: context.read<RootPageBloc>().navIndex != 2
                  ? greySvgColor
                  : null,
            ),
            label: 'information'),
      ],
      onTap: (index) {
        if (index == 0) {
          context.read<RootPageBloc>().add(ShowWishListView());
        } else if (index == 1) {
          context.read<RootPageBloc>().add(ShowSearchView());
        } else {
          context.read<RootPageBloc>().add(ShowInformationView());
        }
      },
    );
  }
}
