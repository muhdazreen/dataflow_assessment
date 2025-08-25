import 'package:dataflow_assessment/component/home_banner.dart';
import 'package:dataflow_assessment/component/location_section.dart';
import 'package:dataflow_assessment/component/new_service.dart';
import 'package:dataflow_assessment/component/shop_plant_slider.dart';
import 'package:dataflow_assessment/component/trending_discoveries.dart';
import 'package:dataflow_assessment/global.dart';
import 'package:flutter/material.dart';
import 'home/header.dart'; 

class HomeSPage extends StatelessWidget {
  const HomeSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    HomeBanner(),
                    // NewServicesProduct(),
                    NewServicesProduct(key: newServicesKey),
                    ShopPlantsSlider(key: shopPlantsKey),
                    // ShopPlantsSlider(),
                    TrendingDiscoveries(),
                    LocationSection()
                  ],
                ),
              )
            )
          ),

        ],
      ),
    );
  }
}
