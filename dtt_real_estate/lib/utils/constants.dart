import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

String aboutText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere. Sed adipiscing diam donec adipiscing tristique risus nec. Adipiscing elit ut aliquam purus sit amet luctus venenatis. Bibendum est ultricies integer quis auctor elit sed vulputate mi. Feugiat nibh sed pulvinar proin. Tortor posuere ac ut consequat semper viverra nam libero. Tempus quam pellentesque nec nam aliquam. Quisque id diam vel quam elementum. Consectetur lorem donec massa sapien faucibus et molestie ac. Sed ullamcorper morbi tincidunt ornare massa eget egestas purus. Venenatis lectus magna fringilla urna porttitor. Vestibulum sed arcu non odio euismod lacinia. Condimentum vitae sapien pellentesque habitant. Tristique et egestas quis ipsum suspendisse. Lectus vestibulum mattis ullamcorper velit. Nibh tellus molestie nunc non blandit. Nibh sit amet commodo nulla facilisi nullam vehicula ipsum a. Lectus mauris ultrices eros in cursus turpis massa tincidunt. Sit amet volutpat consequat mauris nunc congue nisi vitae. Vel turpis nunc eget lorem dolor. Velit ut tortor pretium viverra suspendisse potenti.';

List<List<String>> listsDataTest = [
  ['Item 1', 'Item 2', 'Item 3'],
  ['Item A', 'Item B', 'Item C', 'Item D'],
  ['Item X', 'Item Y', 'Item Z'],
  ['Item P', 'Item Q', 'Item R'],
  ['Item M', 'Item N', 'Item O'],
];

List validConnections = [
  ConnectivityResult.mobile,
  ConnectivityResult.wifi,
  ConnectivityResult.ethernet
];

ColorFilter greySvgColor = ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn);
ColorFilter likeColor = const ColorFilter.mode(Colors.red, BlendMode.srcIn);
ColorFilter whiteSvgColor =
    const ColorFilter.mode(Colors.white, BlendMode.srcIn);
