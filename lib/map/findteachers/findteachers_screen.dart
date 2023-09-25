import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:classroom/utils/assets.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/map_style.dart';


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
      "marker": marker1,
      "image": avatar1,
    },
    {
      "name": "Mrs.Sara",
      "position": const LatLng(31.05, 30.48),
      "marker": marker2,
      "image": avatar2,
    },
    {
      "name": "Mr.Khaled",
      "position": const LatLng(31.1425, 30.5728),
      "marker": marker3,
      "image": avatar3,
    },
    {
      "name": "Mrs.Soad",
      "position": const LatLng(31.0525, 30.4628),
      "marker": marker4,
      "image": avatar4,
    },
    {
      "name": "Mr.Ayman",
      "position": const LatLng(31.7425, 30.5728),
      "marker": marker5,
      "image": avatar5,
    },
    {
      "name": "Mrs.Hend",
      "position": const LatLng(31.2425, 30.0728),
      "marker": marker6,
      "image": avatar6,
    },
    {
      "name": "Mr.Saad",
      "position": const LatLng(31.3425, 30.7728),
      "marker": marker7,
      "image": avatar7,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    createMarkers(context);
    double h=MediaQuery.sizeOf(context).height;
    double w=MediaQuery.sizeOf(context).width;
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
                  width: w,
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
                              Text(_contacts[index]["name"], style: hb2,)
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