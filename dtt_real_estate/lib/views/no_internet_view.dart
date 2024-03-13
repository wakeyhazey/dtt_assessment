import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_dtt/blocs/root_page_bloc.dart';
import 'package:real_estate_dtt/utils/custom_textstyle.dart';

class NoInternetView extends StatelessWidget {
  final bool thereisCached;

  const NoInternetView({super.key, required this.thereisCached});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No internet connection',
              style: CustomTextStyle.title01,
            ),
            if (thereisCached)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: const Color(0xffE65541),
                  onPressed: () {
                    context.read<RootPageBloc>().add(ShowSearchView());
                  },
                  child: const Text(
                    'Do offline search',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
