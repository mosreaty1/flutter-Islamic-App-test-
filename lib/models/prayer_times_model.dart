class PrayerTimesModel {
  final DateTime fajr;
  final DateTime sunrise;
  final DateTime dhuhr;
  final DateTime asr;
  final DateTime maghrib;
  final DateTime isha;
  final String location;
  final DateTime date;

  PrayerTimesModel({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.location,
    required this.date,
  });

  Map<String, DateTime> get allPrayers => {
        'Fajr': fajr,
        'Sunrise': sunrise,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Maghrib': maghrib,
        'Isha': isha,
      };

  String? getNextPrayer() {
    final now = DateTime.now();
    for (var entry in allPrayers.entries) {
      if (entry.value.isAfter(now)) {
        return entry.key;
      }
    }
    return 'Fajr'; // Next day's Fajr
  }

  DateTime? getNextPrayerTime() {
    final now = DateTime.now();
    for (var entry in allPrayers.entries) {
      if (entry.value.isAfter(now)) {
        return entry.value;
      }
    }
    return fajr.add(const Duration(days: 1));
  }
}
