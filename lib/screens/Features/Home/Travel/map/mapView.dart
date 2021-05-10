import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:wave_mobile_app/Shared/SizeConfig.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:wave_mobile_app/Shared/const.dart' as Constants;
import 'package:wave_mobile_app/screens/Features/Home/Travel/map/customMapTypeSelectWidget.dart';
import 'package:wave_mobile_app/screens/Features/Home/Travel/map/mapViewModel.dart';

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
                  mapType: model.mapType,
                  markers: model.markers,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SpeedDial(
                    marginEnd: 5 * blockWidth,
                    marginBottom: 20 * blockHeight,
                    icon: Icons.map,
                    activeIcon: Icons.map,
                    buttonSize: 12.5 * blockWidth,
                    closeManually: false,
                    renderOverlay: false,
                    curve: Curves.bounceIn,
                    overlayColor: Colors.black12,
                    overlayOpacity: 0.5,
                    backgroundColor: Colors.blueAccent[200],
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shape: CircleBorder(),
                    children: [
                      CustomMapTypeSelect().customMapTypeSelectWidget(
                        title: "Normal",
                        img: "assets/icons/normal.jpg",
                        callback: () {
                          model.onTapChangeViewButton(MapType.normal);
                        },
                      ),
                      CustomMapTypeSelect().customMapTypeSelectWidget(
                        title: "Satellite",
                        img: "assets/icons/satelite.jpg",
                        callback: () {
                          model.onTapChangeViewButton(MapType.satellite);
                        },
                      ),
                      CustomMapTypeSelect().customMapTypeSelectWidget(
                        title: "Terrain",
                        img: "assets/icons/terrain.jpg",
                        callback: () {
                          model.onTapChangeViewButton(MapType.terrain);
                        },
                      ),
                      CustomMapTypeSelect().customMapTypeSelectWidget(
                        title: "Hybrid",
                        img: "assets/icons/hybrid.jpg",
                        callback: () {
                          model.onTapChangeViewButton(MapType.hybrid);
                        },
                      ),
                    ],
                  ),
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
