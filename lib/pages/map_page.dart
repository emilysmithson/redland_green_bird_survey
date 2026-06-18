import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:redland_green_bird_survey/pages/leave_app_dialog.dart';

import '../config/app_secrets.dart';
import '../models/bird_box.dart';
import '../widgets/current_location_layer.dart';
import 'bird_box_page/bird_box_page.dart';

class MapPage extends StatefulWidget {
  final int? birdBox;

  const MapPage({super.key, this.birdBox});
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<Marker> _markers = [];
  final MapController mapController = MapController();
  late final LatLngBounds _bounds;
  late final MapOptions _mapOptions;
  final PopupController _popupController = PopupController();
  bool _mapSatellite = false;

  void _onMapTap(TapPosition position, LatLng point) {
    _popupController.hideAllPopups();
  }

  @override
  void initState() {
    _bounds = LatLngBounds.fromPoints(
      BirdBox.birdBoxesList.map((birdBox) => birdBox.location).toList(),
    );
    _mapOptions = MapOptions(
      maxZoom: 18,
      onTap: _onMapTap,
      initialCenter: widget.birdBox != null
          ? BirdBox.birdBoxesList[widget.birdBox!].location
          : const LatLng(51.474508, -2.608220),
      initialZoom: 17.0,
      initialCameraFit: CameraFit.insideBounds(
        bounds: _bounds,
        padding: const EdgeInsets.only(
          top: 38.0,
          left: 20,
          right: 20,
          bottom: 8,
        ),
      ),
      cameraConstraint: CameraConstraint.contain(bounds: _bounds),
    );

    if (widget.birdBox != null) {
      int i = widget.birdBox!;
      final Marker marker = MapMarker(birdBox: BirdBox.birdBoxesList[i]);
      _markers.add(marker);
    } else {
      for (int i = 0; i < BirdBox.birdBoxesList.length; i++) {
        final Marker marker = MapMarker(birdBox: BirdBox.birdBoxesList[i]);
        _markers.add(marker);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final googleMap = PopupScope(
      popupController: _popupController,
      child: FlutterMap(
        mapController: mapController,
        options: _mapOptions,
        children: [
          TileLayer(
            urlTemplate: _mapSatellite
                ? 'https://api.mapbox.com/styles/v1/emilysmithson/ckpwmhnk55h4118ntjfm8rnm3/tiles/256/{z}/{x}/{y}@2x?access_token=$mapboxAccessToken'
                : 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'redland_green_bird_survey',
          ),
          const CurrentLocationLayer(),
          MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              maxClusterRadius: 0,
              markers: _markers,
              popupOptions: PopupOptions(
                popupController: _popupController,
                popupBuilder: (BuildContext context, Marker marker) {
                  return PopUp(marker: marker as MapMarker);
                },
              ),
              builder: (context, markers) {
                return FloatingActionButton(
                  heroTag: null,
                  onPressed: null,
                  child: Text(markers.length.toString()),
                );
              },
            ),
          ),
          RichAttributionWidget(
            attributions: [
              // Suggested attribution for the OpenStreetMap public tile server
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => showLeaveAppDialogAndLaunchUrl(
                  context,
                  'https://openstreetmap.org/copyright',
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[100],
        onPressed: () {
          setState(() {
            _mapSatellite = !_mapSatellite;
          });
        },
        child: Icon(
          _mapSatellite ? Icons.map_outlined : Icons.satellite,
          color: Colors.black,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green[100]!.withValues(alpha: 0.6),
        title: const Text('Map'),
      ),
      extendBodyBehindAppBar: Platform.isIOS,
      body: googleMap,
    );
  }
}

class MapMarker extends Marker {
  final BirdBox birdBox;
  MapMarker({required this.birdBox})
    : super(
        alignment: Alignment.topCenter,
        width: 40,
        height: 40,
        point: birdBox.location,
        child: Icon(Icons.location_pin, color: Colors.black),
      );
}

class PopUp extends StatefulWidget {
  final MapMarker marker;

  const PopUp({super.key, required this.marker});
  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BirdBoxPage(birdBox: widget.marker.birdBox),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.green[50],
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ListTile(
            leading: Hero(
              tag: 'starling',
              child: ClipOval(
                child: Image.asset(widget.marker.birdBox.boxType.image),
              ),
            ),
            title: Text('Bird Box ${widget.marker.birdBox.id}'),
            subtitle: Text(widget.marker.birdBox.locationDescription),
          ),
        ),
      ),
    );
  }
}
