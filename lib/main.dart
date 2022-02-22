import 'package:components/components/flutter_basics/animation/hero_listview.dart';
import 'package:components/components/flutter_basics/tabs/custom_tabbars.dart';
import 'package:components/components/forms/sign_in/sign_in_page1.dart';
import 'package:components/components/forms/sign_in/sign_in_page2.dart';
import 'package:components/components/must_haves/content_feed/news_feed_1.dart';
import 'package:components/components/must_haves/profile_page/profile_page_1.dart';
import 'package:components/components/must_haves/settings_page/settings_page_1.dart';
import 'package:components/components/navigation/bottom_nav/material3_bottom.dart';
import 'package:components/components/navigation/bottom_nav/simple_bottom.dart';
import 'package:flutter/material.dart';

import 'components/flutter_basics/sliders/custom_sliders.dart';
import 'components/must_haves/content_feed/news_feed_2.dart';
import 'components/must_haves/settings_page/settings_page_2.dart';
import 'components/navigation/bottom_nav/persistent_bottom.dart';
import 'components/navigation/side_bar/navigation_rail.dart';
import 'components/navigation/nav_bar/responsive_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes:
          _components.map((key, value) => MapEntry(key, (context) => value)),
    );
  }
}

Map<String, Widget> _components = {
  '/': const _HomePage(),

  /// Navigation ----

  /// Sidebar
  'navigation_rail': const NavigationRailPage(),

  /// NavBar
  'responsive_nav_bar': ResponsiveNavBarPage(),

  /// BottomNav
  'persistent_bottom_nav': PersistentBottomNavPage(),
  'simple_bottom_nav': const SimpleBottomNavigation(),
  'material3_bottom_nav': const Material3BottomNav(),

  /// ----

  /// Forms ----

  /// SignIn
  'sign_in_page1': const SignInPage1(),
  'sign_in_page2': const SignInPage2(),

  /// ----

  /// Flutter Basics ----

  /// Animation
  'hero_list': const HeroListPage(),

  /// Sliders
  'custom_sliders': const CustomSlidersPage(),

  /// Tabs
  'custom_tab_bars': const CustomTabBarsPage(),

  /// ----

  /// Must Haves ----

  /// Profile Page
  'profile_page': const ProfilePage1(),

  /// Content Feed
  'news_feed_1': const NewsFeedPage1(),
  'news_feed_2': const NewsFeedPage2(),

  /// Settings Page
  'settings_page_1': const SettingsPage1(),
  'settings_page_2': const SettingsPage2(),

  /// ----
};

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _components.length,
              itemBuilder: (BuildContext context, int index) {
                final String routeName = _components.keys.elementAt(index);
                return ListTile(
                    title: Text(routeName),
                    onTap: () {
                      Navigator.pushNamed(context, routeName);
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}
