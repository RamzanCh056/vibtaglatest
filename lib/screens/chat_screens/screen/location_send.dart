import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
// ignore: must_be_immutable
class LocationSendUser extends StatefulWidget {
  String? time;
  String? lat;
  String? lng;
  String? adress;
  var showLocation;



  LocationSendUser(this.time, this.lat,this.lng,this.adress,this.showLocation,{Key? key}) : super(key: key);

  @override
  State<LocationSendUser> createState() => _LocationSendUserState();
}

class _LocationSendUserState extends State<LocationSendUser> {
  late GoogleMapController _googleMapController;
  final Set<Marker> markers = Set();
  LatLng addressLatLng = const LatLng(31.5204, 74.3587);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children:  [

            Text(
              DateFormat('hh:mm a').format(
                  DateTime.fromMillisecondsSinceEpoch(int.parse(
                    widget.time.toString(),
                  ) *
                      1000)),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: greyColor),
            ),
            const Spacer(),
            Icon(Icons.more_horiz,color: greyColor,)
          ],
        ),
        Text(widget.adress.toString(),),

        Container(
          height: 200.0,
            width: 240,
          alignment: Alignment.center,
          child: GoogleMap(
            zoomGesturesEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  double.parse(
                    widget.lat!,
                  ),
                  double.parse(
                    widget.lng!,
                  )),
              //showLocation,

              zoom: 15.151926040649414, //initial zoom level
            ),
            markers: getmarkers(), //Icon for Marker

            onMapCreated: (controller) =>
            _googleMapController = controller,
          )
        ),

        const SizedBox(
          height: 10,
        ),


      ],);
  }
  Set<Marker> getmarkers() {
    //setState(() {
    markers.add(Marker(
      //add first marker
      markerId: MarkerId(widget.showLocation.toString()),
      position: widget.showLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: widget.adress.toString(),
        snippet:
              widget.adress.toString(),
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    //  });
    //setState(() {});

    return markers;
  }
}
