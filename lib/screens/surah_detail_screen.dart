import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/quran_service.dart';
import '../utils/app_theme.dart';

class SurahDetailScreen extends StatefulWidget {
  final int surahNumber;
  final int? initialAyah;

  const SurahDetailScreen({
    super.key,
    required this.surahNumber,
    this.initialAyah,
  });

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  late ScrollController _scrollController;
  bool _showTranslation = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quranService = Provider.of<QuranService>(context);
    final surahName = quranService.getSurahName(widget.surahNumber);
    final surahNameArabic = quranService.getSurahNameArabic(widget.surahNumber);
    final verseCount = quranService.getVerseCount(widget.surahNumber);
    final revelation = quranService.getPlaceOfRevelation(widget.surahNumber);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              surahNameArabic,
              style: GoogleFonts.amiri(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              surahName,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_showTranslation ? Icons.translate : Icons.translate_outlined),
            onPressed: () {
              setState(() {
                _showTranslation = !_showTranslation;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSurahHeader(surahName, revelation, verseCount),
          Expanded(
            child: _buildVersesList(quranService, verseCount),
          ),
        ],
      ),
    );
  }

  Widget _buildSurahHeader(String surahName, String revelation, int verseCount) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryGreen.withOpacity(0.1),
            AppTheme.creamWhite,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
            style: GoogleFonts.amiri(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryGreen,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '$revelation • $verseCount Verses',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVersesList(QuranService quranService, int verseCount) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: verseCount,
      itemBuilder: (context, index) {
        final ayahNumber = index + 1;
        final verse = quranService.getVerse(widget.surahNumber, ayahNumber);
        final translation = quranService.getVerseTranslation(widget.surahNumber, ayahNumber);
        final isBookmarked = quranService.isBookmarked(widget.surahNumber, ayahNumber);

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        ayahNumber.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                            color: AppTheme.primaryGreen,
                          ),
                          onPressed: () {
                            quranService.toggleBookmark(widget.surahNumber, ayahNumber);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.share, color: AppTheme.primaryGreen),
                          onPressed: () {
                            // Share functionality
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  verse,
                  style: GoogleFonts.amiri(
                    fontSize: 26,
                    height: 2.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
                if (_showTranslation) ...[
                  const Divider(height: 24),
                  Text(
                    translation,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
