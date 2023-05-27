import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:give_n_go/ui/charity_detail/charity_detail_state.dart';
import 'package:give_n_go/ui/charity_detail/components/map_view_state.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MapViewState>();
    final charityDetailState = context.watch<CharityDetailState>();
    final latLng = LatLng(charityDetailState.charity.latitudeLongitude.latitude,
      charityDetailState.charity.latitudeLongitude.longitude,);

    return SizedBox(
      height: 150,
      width: 200,
      child: FlutterMap(
        mapController: state.mapController,
        options: MapOptions(
          interactiveFlags: InteractiveFlag.none,
          center: latLng,
          zoom: 17,
          minZoom: 7,
          maxZoom: 18,
        ),
        children: [
          TileLayer(
            minZoom: 1,
            maxZoom: 18,
            backgroundColor: Colors.white,
            urlTemplate:
            'https://{s}.tile.jawg.io/jawg-sunny/{z}/{x}/{y}{r}.png?access-token=WdQDiqGUjI4uwIVOFpp11bNpyin0ZxbRZ9FTxAB2b9Y0Fq6uFOARf8w297TPqGzJ',
            subdomains: const ['a', 'b', 'c', 'd'],
          ),
          MarkerLayer(markers: [
            Marker(
              point: latLng,
              builder: (context) =>
              const Icon(
                Icons.pin_drop_rounded,
                size: 45,
                color: Colors.black,
              ),
            )
          ])
        ],
      ),
    );
  }
}
