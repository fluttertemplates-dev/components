import 'package:flutter/material.dart';

class CustomTabBarsPage extends StatefulWidget {
  const CustomTabBarsPage({Key? key}) : super(key: key);

  @override
  _CustomTabBarsPageState createState() => _CustomTabBarsPageState();
}

class _CustomTabBarsPageState extends State<CustomTabBarsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = const Color(0xff1a73e8);
  final _unselectedColor = const Color(0xff5f6368);
  final _tabs = const [
    Tab(text: 'Tab1'),
    Tab(text: 'Tab2'),
    Tab(text: 'Tab3'),
  ];

  final _iconTabs = const [
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.search)),
    Tab(icon: Icon(Icons.settings)),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: _selectedColor,
          title: const Text("Custom Tab Bars")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            shrinkWrap: true,
            children: [
              ///Default Tabbar with full width tabbar indicator
              TabBar(
                controller: _tabController,
                tabs: _tabs,
                labelColor: _selectedColor,
                indicatorColor: _selectedColor,
                unselectedLabelColor: _unselectedColor,
              ),

              ///Default Tabbar with indicator width of the label
              TabBar(
                controller: _tabController,
                tabs: _tabs,
                labelColor: _selectedColor,
                indicatorColor: _selectedColor,
                unselectedLabelColor: _unselectedColor,
                indicatorSize: TabBarIndicatorSize.label,
              ),

              /// Custom Material Design tabbar used in google's products
              TabBar(
                controller: _tabController,
                labelColor: _selectedColor,
                unselectedLabelColor: _unselectedColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: MaterialDesignIndicator(
                    indicatorHeight: 4, indicatorColor: _selectedColor),
                tabs: _tabs,
              ),

              /// Custom Tabbar with solid selected bg and transparent tabbar bg
              Container(
                height: kToolbarHeight - 8.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: _selectedColor),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: _tabs,
                ),
              ),

              /// Custom Tabbar with solid selected bg and transparent tabbar bg
              Container(
                height: kToolbarHeight + 8.0,
                padding:
                    const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
                decoration: BoxDecoration(
                  color: _selectedColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      color: Colors.white),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  tabs: _tabs,
                ),
              ),

              /// Custom Tabbar with transparent selected bg and solid selected text
              TabBar(
                controller: _tabController,
                tabs: _iconTabs,
                unselectedLabelColor: Colors.black,
                labelColor: _selectedColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  color: _selectedColor.withOpacity(0.2),
                ),
              ),

              TabBar(
                controller: _tabController,
                tabs: _tabs,
                unselectedLabelColor: Colors.black,
                labelColor: _selectedColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  color: _selectedColor.withOpacity(0.2),
                ),
              ),
            ]
                .map((item) => Column(
                      /// Added a divider after each item to let the tabbars have room to breathe
                      children: [
                        item,
                        const Divider(color: Colors.transparent)
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class MaterialDesignIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;

  const MaterialDesignIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
  });

  @override
  _MaterialDesignPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MaterialDesignPainter(this, onChanged);
  }
}

class _MaterialDesignPainter extends BoxPainter {
  final MaterialDesignIndicator decoration;

  _MaterialDesignPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Rect rect = Offset(
          offset.dx,
          configuration.size!.height - decoration.indicatorHeight,
        ) &
        Size(configuration.size!.width, decoration.indicatorHeight);

    final Paint paint = Paint()
      ..color = decoration.indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: const Radius.circular(8),
        topLeft: const Radius.circular(8),
      ),
      paint,
    );
  }
}
