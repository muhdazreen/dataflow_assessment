import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Footer({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final List<String> _labels = const ["HOME", "MALL", "DISCOVER", "INBOX", "ACCOUNT"];

  final List<String> _inactiveIcons = const [
    "assets/res/Nav Icon - Home.png",
    "assets/res/Nav Icon - Mall.png",
    "assets/res/Nav Icon - Discover.png",
    "assets/res/Nav Icon - Inbox.png",
    "assets/res/Nav Icon - Account.png",
  ];

  final List<String> _activeIcons = const [
    "assets/res/Nav Icon - Home Green.png",
    "assets/res/Nav Icon - Mall Green.png",
    "assets/res/Nav Icon - Discover Green.png",
    "assets/res/Nav Icon - Inbox Green.png",
    "assets/res/Nav Icon - Account Green.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_labels.length, (index) {
          final bool isActive = currentIndex == index;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    isActive ? _activeIcons[index] : _inactiveIcons[index],
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _labels[index],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      color: isActive ? Colors.green[800] : Colors.grey,
                      letterSpacing: 1,
                    ),
                  ),
                  if (isActive)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 2,
                      width: 20,
                      color: Colors.green[800],
                    )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
