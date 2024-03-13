import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_dtt/models/house_detail_model.dart';
import 'package:real_estate_dtt/repositories/root_repository.dart';
import 'package:real_estate_dtt/utils/constants.dart';

class RootPageBloc extends Bloc<RootPageEvents, RootPageStates> {
  final RootRepository _repo = RootRepository();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  List<HouseDetailModel> data = [];
  List<HouseDetailModel> filter = [];

  List<int> wishListIds = [];

  LatLng? userPosition;

  final TextEditingController searchTerm = TextEditingController();

  int navIndex = 0;

  @override
  Future<void> close() async {
    //cancel streams
    _connectivitySubscription?.cancel();
    super.close();
  }

  Future<void> toggleToWishList(HouseDetailModel house) async {
    wishListIds = await _repo.toggleToWishList(house.id);
    if (navIndex == 0) {
      add(ShowWishListView());
    }
  }

  RootPageBloc() : super(RootPageBootUp()) {
    on<BootUp>((event, emit) async {
      userPosition = await _repo.getCurrentPosition();
      wishListIds = await _repo.getWishList();
      // filter variable for searching through list
      filter = data = await _repo.getListings() ?? [];

      // app can still open up if downloaded on mobile, but will not load on
      // web browser if connection is gone
      if (kIsWeb) {
        add(ShowSearchView());
      } else {
        _connectivitySubscription = Connectivity()
            .onConnectivityChanged
            .listen((ConnectivityResult result) {
          if (validConnections.contains(result)) {
            data.sort((a, b) => a.price.compareTo(b.price));
            add(ShowSearchView());
          } else {
            add(ShowNoInternetConnectionView());
          }
        });
      }
    });

    on<ShowNoInternetConnectionView>((event, emit) async {
      filter = data = await _repo.getOfflineList() ?? [];
      // sort houses by increasing price
      data.sort((a, b) => a.price.compareTo(b.price));
      if (data.isEmpty) {
        emit(NoInternetConnectionView(thereisCached: false));
      } else {
        emit(NoInternetConnectionView(thereisCached: true));
      }
    });

    on<ShowWishListView>((event, emit) {
      navIndex = 0;

      // refresh wish list
      List<HouseDetailModel> wishList = [];

      for (HouseDetailModel house in data) {
        if (wishListIds.contains(house.id)) {
          wishList.add(house);
        }
      }

      emit(WishListView(wishlist: wishList));
    });

    on<ShowSearchView>((event, emit) {
      navIndex = 1;

      emit(SearchView(listings: filter));
    });

    on<ShowInformationView>((event, emit) {
      navIndex = 2;

      emit(InformationView());
    });

    on<SearchListings>((event, emit) {
      if (event.searchString.isNotEmpty) {
        filter = data
            .where((house) =>
                house.city
                    .toLowerCase()
                    .contains(event.searchString.toLowerCase()) ||
                house.zipCode
                    .toLowerCase()
                    .contains(event.searchString.toLowerCase()))
            .toList();
        // sort houses by increasing price
        filter.sort((a, b) => a.price.compareTo(b.price));
      } else {
        filter = data;
      }
      add(ShowSearchView());
    }, transformer: droppable());
  }
}

// ------------------- STATES --------------------

abstract class RootPageStates {}

class RootPageBootUp extends RootPageStates {}

class SearchView extends RootPageStates {
  final List<HouseDetailModel> listings;

  SearchView({required this.listings});
}

class InformationView extends RootPageStates {}

class WishListView extends RootPageStates {
  final List<HouseDetailModel> wishlist;

  WishListView({required this.wishlist});
}

class NoInternetConnectionView extends RootPageStates {
  final bool thereisCached;

  NoInternetConnectionView({required this.thereisCached});
}

// ------------------- EVENTS ------------------

abstract class RootPageEvents {}

class BootUp extends RootPageEvents {}

class SearchListings extends RootPageEvents {
  final String searchString;

  SearchListings({required this.searchString});
}

class AddToWishList extends RootPageEvents {
  final int id;

  AddToWishList({required this.id});
}

class ShowSearchView extends RootPageEvents {}

class ShowWishListView extends RootPageEvents {}

class ShowInformationView extends RootPageEvents {}

class ShowSplashView extends RootPageEvents {}

class ShowNoInternetConnectionView extends RootPageEvents {}
