import 'package:flutter/material.dart';
import 'package:green_egypt/screens/home_page/home_page_components/components/home_page_actions.dart';
import 'package:green_egypt/screens/home_page/home_page_components/components/home_page_title.dart';

final homePageAppBar = AppBar(
    /**
               * Bill Icon that in Appbar .
               */
    actions: [HomePageActions()],
    elevation: 0,
    title: HomePageTitle());
