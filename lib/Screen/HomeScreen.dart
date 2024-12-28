import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Controller/Riverpod/currentLocation.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  Position? position;
  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  void _fetchLocation() async {
    await ref.read(locationProvider.notifier).fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    final _postion = ref.watch(locationProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('lat:${_postion!.latitude}'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: btnclick, child: Text('get Location')),
      ),
    );
  }

  void btnclick() async {}
}
