import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:wave_mobile_app/Shared/const.dart' as Constants;
import 'package:wave_mobile_app/screens/Features/Home/Travel/map/mapViewModel.dart';

// class MapViewScreen extends StatefulWidget {
//   @override
//   _MapViewScreenState createState() => _MapViewScreenState();
// }

// class _MapViewScreenState extends State<MapViewScreen> {
//   double blockHeight = SizeConfig.safeBlockVertical;
//   double blockWidth = SizeConfig.safeBlockHorizontal;

//   GoogleMapController mapController;
//   Position currentPosition;
//   LatLng currentLatLng;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: Stack(
//           children: <Widget>[
//             GoogleMap(
//               onMapCreated: (GoogleMapController googleMapController) {
//                 setState(() {
//                   mapController = googleMapController;
//                 });
//               },
//               onLongPress: (argument) {},
//               initialCameraPosition: CameraPosition(
//                 zoom: 15.0,
//                 target: LatLng(6.9271, 79.8612),
//               ),
//               mapType: MapType.normal,
//             ),
//             Container(
//               padding: EdgeInsets.only(top: blockHeight * 2.5),
//               alignment: Alignment.topCenter,
//               child: SearchMapPlaceWidget(
//                 apiKey: Constants.Const.GOOGLE_MAP_API_KEY,
//                 placeholder: "Enter Location",
//                 language: "en",
//                 hasClearButton: true,
//                 placeType: PlaceType.address,
//                 onSelected: (Place place) async {
//                   Geolocation geolocation = await place.geolocation;
//                   mapController.animateCamera(
//                     CameraUpdate.newLatLng(geolocation.coordinates),
//                   );
//                   mapController.animateCamera(
//                     CameraUpdate.newLatLngBounds(geolocation.bounds, 0),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MapViewScreen extends StatelessWidget {
  double blockHeight = SizeConfig.safeBlockVertical;
  double blockWidth = SizeConfig.safeBlockHorizontal;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MapViewModel>.reactive(
      viewModelBuilder: () => MapViewModel(),
      builder: (_, model, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                GoogleMap(
                  onMapCreated: (GoogleMapController googleMapController) {
                    model.onMapCreated(googleMapController);
                  },
                  onLongPress: (LatLng markerPosition) {
                    model.addMarker(markerPosition);
                  },
                  initialCameraPosition: CameraPosition(
                    zoom: 15.0,
                    target: LatLng(6.9271, 79.8612),
                  ),
                  mapType: MapType.normal,
                  markers: model.markers,
                ),
                Positioned(
                  top: 2.5 * blockHeight,
                  child: SingleChildScrollView(
                    child: SearchMapPlaceWidget(
                      apiKey: Constants.Const.GOOGLE_MAP_API_KEY,
                      placeholder: "Enter Location",
                      language: "en",
                      hasClearButton: true,
                      placeType: PlaceType.address,
                      onSelected: (Place place) async {
                        await model.onSelected(place);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
