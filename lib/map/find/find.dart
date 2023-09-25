import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../map_style.dart';


class FindTeachersScreen extends StatefulWidget {
  const FindTeachersScreen({ Key? key }) : super(key: key);

  @override
  _FindTeachersScreenState createState() => _FindTeachersScreenState();
}

class _FindTeachersScreenState extends State<FindTeachersScreen> {
  static const CameraPosition _kGooglePlex =   CameraPosition(
    target:  LatLng(31.0425, 30.4728),
    zoom: 14.4746,
  );

  final Set<Marker> _markers = {};
  late GoogleMapController _controller;

  final List<dynamic> _contacts = [
    {
      "name": "Mr.Ahmed",
      "position": const LatLng(31.0425, 30.4728),
      "marker": 'assets/markers/marker-1.png',
      "image": 'assets/avatars/avatar-1.png',
    },
    {
      "name": "Mrs.Sara",
      "position": const LatLng(31.05, 30.48),
      "marker": 'assets/markers/marker-2.png',
      "image": 'assets/avatars/avatar-2.png',
    },
    {
      "name": "Mr.Khaled",
      "position": const LatLng(31.1425, 30.5728),
      "marker": 'assets/markers/marker-3.png',
      "image": 'assets/avatars/avatar-3.png',
    },
    {
      "name": "Mrs.Soad",
      "position": const LatLng(31.0525, 30.4628),
      "marker": 'assets/markers/marker-4.png',
      "image": 'assets/avatars/avatar-4.png',
    },
    {
      "name": "Mr.Ayman",
      "position": const LatLng(31.7425, 30.5728),
      "marker": 'assets/markers/marker-5.png',
      "image": 'assets/avatars/avatar-5.png',
    },
    {
      "name": "Mrs.Hend",
      "position": const LatLng(31.2425, 30.0728),
      "marker": 'assets/markers/marker-6.png',
      "image": 'assets/avatars/avatar-6.png',
    },
    {
      "name": "Mr.Saad",
      "position": const LatLng(31.3425, 30.7728),
      "marker": 'assets/markers/marker-7.png',
      "image": 'assets/avatars/avatar-7.png',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    createMarkers(context);

    return Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _kGooglePlex,
              markers: _markers,
              myLocationButtonEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                controller.setMapStyle(MapStyle().aubergine);
              },
            ),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _contacts.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _controller.moveCamera(CameraUpdate.newLatLng(_contacts[index]["position"]));
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(_contacts[index]['image'], width: 60,),
                              const SizedBox(height: 10,),
                              Text(_contacts[index]["name"], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                      );
                    },
                  )
              ),
            )
          ],
        )
    );
  }

  createMarkers(BuildContext context) {
    Marker marker;

    _contacts.forEach((contact) async {
      marker = Marker(
        markerId: MarkerId(contact['name']),
        position: contact['position'],
        icon: await _getAssetIcon(context, contact['marker']).then((value) => value),
        infoWindow: InfoWindow(
          title: contact['name'],
          snippet: 'Street 6 . 2min ago',
        ),
      );

      setState(() {
        _markers.add(marker);
      });
    });
  }

  Future<BitmapDescriptor> _getAssetIcon(BuildContext context, String icon) async {
    final Completer<BitmapDescriptor> bitmapIcon = Completer<BitmapDescriptor>();
    final ImageConfiguration config = createLocalImageConfiguration(context, size: const Size(5, 5));

    AssetImage(icon)
        .resolve(config)
        .addListener(ImageStreamListener((ImageInfo image, bool sync) async {
      final ByteData? bytes = await image.image.toByteData(format: ImageByteFormat.png);
      final BitmapDescriptor bitmap = BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
      bitmapIcon.complete(bitmap);
    })
    );

    return await bitmapIcon.future;
  }
}