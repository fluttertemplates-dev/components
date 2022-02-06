import 'package:components/components/flutter_basics/animation/hero_listview.dart';
import 'package:components/components/flutter_basics/tabs/custom_tabbars.dart';
import 'package:components/components/forms/sign_in/sign_in_page1.dart';
import 'package:components/components/forms/sign_in/sign_in_page2.dart';
import 'package:components/components/navigation/bottom_nav/simple_bottom.dart';
import 'package:flutter/material.dart';

import 'components/flutter_basics/sliders/custom_sliders.dart';
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
  'navigation/side_bar/navigation_rail': const NavigationRailPage(),
  'navigation/nav_bar/responsive_nav_bar': ResponsiveNavBarPage(),
  'navigation/bottom_nav/persistent_bottom_nav': PersistentBottomNavPage(),
  'navigation/bottom_nav/simple_bottom_nav': const SimpleBottomNavigation(),
  'forms/sign_in/sign_in_page1': const SignInPage1(),
  'forms/sign_in/sign_in_page2': const SignInPage2(),
  'basics/animation/hero_list': const HeroListPage(),
  'basics/tabs/custom_tab_bars': const CustomTabBarsPage(),
  'basics/sliders/custom_sliders': const CustomSlidersPage(),
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
            constraints: const BoxConstraints(maxWidth: 200),
            child: ListView.builder(
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
