import 'package:dataflow_assessment/pages/inbox.dart';
import 'package:dataflow_assessment/pages/mall.dart';
import 'package:dataflow_assessment/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:dataflow_assessment/widgets/footer.dart';
import 'pages/home.dart';

class Navigationator extends StatefulWidget {
  const Navigationator({super.key});

  @override
  State<Navigationator> createState() => NavigationatorState();

  static NavigationatorState of(BuildContext context) {
    final state = context.findAncestorStateOfType<NavigationatorState>();
    assert(state != null, "No Navigation state found in context");
    return state!;
  }
}

class NavigationatorState extends State<Navigationator> {
  int _currentIndex = 0;
  int _previousIndex = 0;

  void goBackToPrevious() {
    setState(() {
      // final temp = _currentIndex;
      _currentIndex = _previousIndex;
      _previousIndex = _currentIndex; 
    });
  }
    // Center(child: HomeSPage()),

  final List<Widget> _pages = [
    Center(child: HomeSPage()),
    Center(child: MallPage()),
    Center(child: Text("Discover Page Coming Soon")),
    Center(child: NotificationInboxPage()),
    Center(child: ProfilePage()),
  ];

  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void setPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: List.generate(_pages.length, (index) {
          return Offstage(
            offstage: _currentIndex != index,
            child: Navigator(
              key: _navigatorKeys[index],
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (_) => _pages[index],
                );
              },
            ),
          );
        }),
      ),
      bottomNavigationBar: Footer(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _previousIndex = _currentIndex;
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
