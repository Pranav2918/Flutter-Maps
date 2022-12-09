import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_street_map/maps/flutter_map.dart';
import 'package:open_street_map/maps/osm_impl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Maps"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showMapOptions(() => Navigator.push(context, MaterialPageRoute(builder: (context) => const OpenStreetMapImpl())), "OSM"),
            _showMapOptions(() => Navigator.push(context, MaterialPageRoute(builder: (context) => const FlutterMapImpl())), "Flutter Map")
          ],
        ),
      ),
    );
  }


  Widget _showMapOptions(GestureTapCallback onTap, String mapName){
    return TextButton(onPressed: onTap, child: Text(mapName));
  }
}