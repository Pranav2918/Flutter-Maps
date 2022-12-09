import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class OpenStreetMapImpl extends StatefulWidget {
  const OpenStreetMapImpl({super.key});

  @override
  State<OpenStreetMapImpl> createState() => _OpenStreetMapImplState();
}

class _OpenStreetMapImplState extends State<OpenStreetMapImpl> {
  late MapController _controller;
  List<GeoPoint> latlngList = [
    GeoPoint(latitude: 23.0345837, longitude: 72.5032897),
    GeoPoint(latitude: 23.0537, longitude: 72.4933),
    GeoPoint(latitude: 23.0154, longitude: 72.4915),
  ];

  List<StaticPositionGeoPoint> markers = [];

  @override
  void initState() {
    _controller = MapController(
      initMapWithUserPosition: true,
    );
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < latlngList.length; i++) {
      markers.add(StaticPositionGeoPoint(
          i.toString(),
          MarkerIcon(
              iconWidget: InkWell(
            onTap: () {
              print("Marker Tapped");
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.pink),
            ),
          )),
          latlngList));
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Open Sreet Map"),
      ),
      body: _showMap(),
    );
  }

  Widget _showMap() {
    return OSMFlutter(
      mapIsLoading: const Center(child: Text("Loading....")),
      controller: _controller,
      trackMyPosition: false,
      initZoom: 12,
      minZoomLevel: 14,
      stepZoom: 1.0,
      showZoomController: true,
      staticPoints: markers,
    );
  }
}
