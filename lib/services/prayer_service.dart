import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../models/prayer_times_model.dart';

class PrayerService extends ChangeNotifier {
  PrayerTimesModel? _prayerTimes;
  String? _locationName;
  bool _isLoading = false;
  String? _error;

  PrayerTimesModel? get prayerTimes => _prayerTimes;
  String? get locationName => _locationName;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> calculatePrayerTimes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Get current position
      final position = await _getCurrentPosition();

      // Get location name
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        _locationName = '${place.locality ?? ''}, ${place.country ?? ''}';
      }

      // Calculate prayer times using Adhan package
      final coordinates = Coordinates(position.latitude, position.longitude);
      final params = CalculationMethod.muslim_world_league.getParameters();
      params.madhab = Madhab.shafi;

      final prayerTimes = PrayerTimes.today(coordinates, params);

      _prayerTimes = PrayerTimesModel(
        fajr: prayerTimes.fajr,
        sunrise: prayerTimes.sunrise,
        dhuhr: prayerTimes.dhuhr,
        asr: prayerTimes.asr,
        maghrib: prayerTimes.maghrib,
        isha: prayerTimes.isha,
        location: _locationName ?? 'Unknown',
        date: DateTime.now(),
      );

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Duration? getTimeUntilNextPrayer() {
    if (_prayerTimes == null) return null;

    final nextPrayerTime = _prayerTimes!.getNextPrayerTime();
    if (nextPrayerTime == null) return null;

    return nextPrayerTime.difference(DateTime.now());
  }
}
