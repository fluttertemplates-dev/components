import 'package:flutter/material.dart';

class CollapsingAppbarPage extends StatelessWidget {
  const CollapsingAppbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  title: const Text("Collapsing Appbar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text("Item $index", textAlign: TextAlign.center));
          },
        ),
      ),
    );
  }
}
