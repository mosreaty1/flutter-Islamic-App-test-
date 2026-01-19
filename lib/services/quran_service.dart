import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:shared_preferences/shared_preferences.dart';

class QuranService extends ChangeNotifier {
  Set<String> _bookmarkedVerses = {};
  int _lastReadSurah = 1;
  int _lastReadAyah = 1;

  Set<String> get bookmarkedVerses => _bookmarkedVerses;
  int get lastReadSurah => _lastReadSurah;
  int get lastReadAyah => _lastReadAyah;

  QuranService() {
    _loadBookmarks();
    _loadLastRead();
  }

  // Bookmark functions
  Future<void> toggleBookmark(int surah, int ayah) async {
    final key = '$surah:$ayah';
    if (_bookmarkedVerses.contains(key)) {
      _bookmarkedVerses.remove(key);
    } else {
      _bookmarkedVerses.add(key);
    }
    await _saveBookmarks();
    notifyListeners();
  }

  bool isBookmarked(int surah, int ayah) {
    return _bookmarkedVerses.contains('$surah:$ayah');
  }

  Future<void> _loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarks = prefs.getStringList('bookmarks') ?? [];
    _bookmarkedVerses = bookmarks.toSet();
    notifyListeners();
  }

  Future<void> _saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('bookmarks', _bookmarkedVerses.toList());
  }

  // Last read functions
  Future<void> setLastRead(int surah, int ayah) async {
    _lastReadSurah = surah;
    _lastReadAyah = ayah;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastReadSurah', surah);
    await prefs.setInt('lastReadAyah', ayah);
    notifyListeners();
  }

  Future<void> _loadLastRead() async {
    final prefs = await SharedPreferences.getInstance();
    _lastReadSurah = prefs.getInt('lastReadSurah') ?? 1;
    _lastReadAyah = prefs.getInt('lastReadAyah') ?? 1;
    notifyListeners();
  }

  // Quran data functions
  String getVerse(int surah, int ayah, {bool withBasmala = false}) {
    return quran.getVerse(surah, ayah, verseEndSymbol: true);
  }

  String getVerseTranslation(int surah, int ayah) {
    return quran.getVerseTranslation(surah, ayah, translation: quran.Translation.enSaheeh);
  }

  String getSurahName(int surah) {
    return quran.getSurahName(surah);
  }

  String getSurahNameArabic(int surah) {
    return quran.getSurahNameArabic(surah);
  }

  String getSurahNameEnglish(int surah) {
    return quran.getSurahNameEnglish(surah);
  }

  int getVerseCount(int surah) {
    return quran.getVerseCount(surah);
  }

  int getTotalSurahs() {
    return quran.totalSurahCount;
  }

  String getPlaceOfRevelation(int surah) {
    return quran.getPlaceOfRevelation(surah);
  }

  // Juz functions
  int getJuzNumber(int surah, int ayah) {
    return quran.getJuzNumber(surah, ayah);
  }

  // Search function
  List<Map<String, dynamic>> searchQuran(String query) {
    List<Map<String, dynamic>> results = [];

    for (int surah = 1; surah <= quran.totalSurahCount; surah++) {
      final verseCount = quran.getVerseCount(surah);
      for (int ayah = 1; ayah <= verseCount; ayah++) {
        final translation = getVerseTranslation(surah, ayah);
        if (translation.toLowerCase().contains(query.toLowerCase())) {
          results.add({
            'surah': surah,
            'ayah': ayah,
            'text': translation,
          });
        }
      }
    }

    return results;
  }
}
