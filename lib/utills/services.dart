import 'package:flutter/material.dart';
import 'package:trelloapps/features/home/search/customsearch.dart';

mixin Services {
  signUp(BuildContext context) {
    if (context.mounted) {
      Navigator.pushNamed(context, 'home');
    }
  }

  logIn(BuildContext context) {
    if (context.mounted) {
      Navigator.pushNamed(context, 'home');
    }
  }

  search(BuildContext context,List searchList) {
    showSearch(context: context, delegate: CustomSearchDelegate(searchList));
  }

}
