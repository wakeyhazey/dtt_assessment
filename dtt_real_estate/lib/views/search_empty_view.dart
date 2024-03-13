import 'package:flutter/material.dart';

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
                height: 300,
                width: 300,
                child: Image.asset('assets/Images/search_state_empty.png')),
          ),
          const Text('No results found!'),
          const Text('Perhaps try another search?')
        ],
      ),
    );
  }
}
