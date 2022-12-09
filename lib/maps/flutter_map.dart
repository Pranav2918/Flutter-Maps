import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapImpl extends StatefulWidget {
  const FlutterMapImpl({super.key});

  @override
  State<FlutterMapImpl> createState() => _FlutterMapImplState();
}

class _FlutterMapImplState extends State<FlutterMapImpl> {
  List<LatLng> locationList = [
    LatLng(23.0345837, 72.5032897),
    LatLng(23.0345837, 72.5032505),
  ];

  LatLng point = LatLng(23.0345837, 72.5032897);

  final MapController _mapController = MapController();
  List<Marker> _markers = [];

  @override
  void initState() {
    _markers = locationList
        .map((point) => Marker(
              point: point,
              width: 60,
              height: 60,
              builder: (context) => const Icon(
                Icons.pin_drop_outlined,
                size: 60,
                color: Colors.red,
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Map"),
        centerTitle: true,
      ),
      body: _showMap(),
    );
  }

  Widget _showMap() {
    return FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: locationList[0],
          zoom: 7,
        ),
        children: [
          TileLayer(
            minZoom: 6,
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: _markers,
          )
        ],
       );
  }
}
