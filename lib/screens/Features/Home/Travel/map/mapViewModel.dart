import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';

class MapViewModel extends ChangeNotifier {
  GoogleMapController mapController;
  Position currentPosition;
  LatLng markedLatLng;
  Set<Marker> markers = {};
  onMapCreated(GoogleMapController googleMapController) {
    mapController = googleMapController;
    notifyListeners();
  }

  onSelected(Place place) async {
    Geolocation geolocation = await place.geolocation;
    mapController.animateCamera(
      CameraUpdate.newLatLng(geolocation.coordinates),
    );
    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(geolocation.bounds, 0),
    );
    notifyListeners();
  }

  addMarker(LatLng markerPosition) {
    markers.add(
      Marker(
        markerId: MarkerId("2"),
        position: markerPosition,
        draggable: true,
        infoWindow: InfoWindow(
          onTap: () {},
          snippet: "snippet",
          title: "title",
        ),
        onDragEnd: (newPosition) {
          print("prev : " + markerPosition.toString());
          markerPosition = newPosition;
          print("new : " + markerPosition.toString());
          notifyListeners();
        },
      ),
    );
    notifyListeners();
    markedLatLng = markerPosition;
    mapController.animateCamera(
      CameraUpdate.newLatLng(markerPosition),
    );
  }
}
