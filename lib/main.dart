import 'package:components/components/navigation_rail.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes:
          _components.map((key, value) => MapEntry(key, (context) => value)),
    );
  }
}

Map<String, Widget> _components = {
  '/': const _HomePage(),
  '/nav-rail': const NavigationRailPage()
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
