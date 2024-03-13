import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_dtt/blocs/root_page_bloc.dart';
import 'package:real_estate_dtt/views/dtt_information_view.dart';
import 'package:real_estate_dtt/views/no_internet_view.dart';
import 'package:real_estate_dtt/views/search_view.dart';
import 'package:real_estate_dtt/views/splash_screen_view.dart';
import 'package:real_estate_dtt/views/wish_list_view.dart';

class RootPageWidget extends StatelessWidget {
  const RootPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootPageBloc, RootPageStates>(builder: (context, state) {
      if (state is SearchView) {
        return SearchViewWidget(
          listings: state.listings,
        );
      } else if (state is InformationView) {
        return const DttInformationWidget();
      } else if (state is WishListView) {
        return WishListViewWidget(
          listings: state.wishlist,
        );
      } else if (state is NoInternetConnectionView) {
        return NoInternetView(
          thereisCached: state.thereisCached,
        );
      } else {
        return const SplashScreenView();
      }
    });
  }
}
