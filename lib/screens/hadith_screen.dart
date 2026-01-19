import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/hadith_model.dart';
import '../data/hadith_data.dart';
import '../utils/app_theme.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  String _selectedCategory = 'All';
  final List<String> _categories = [
    'All',
    'Faith',
    'Prayer',
    'Charity',
    'Ramadan',
    'Morality',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredHadith = _selectedCategory == 'All'
        ? HadithData.sampleHadiths
        : HadithData.sampleHadiths
            .where((h) => h.book == _selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hadith Collection',
          style: GoogleFonts.amiri(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          _buildCategoryFilter(),
          Expanded(
            child: _buildHadithList(filteredHadith),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == category;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _selectedCategory = category;
                  });
                }
              },
              selectedColor: AppTheme.primaryGreen,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHadithList(List<HadithModel> hadiths) {
    if (hadiths.isEmpty) {
      return const Center(
        child: Text('No hadiths found in this category'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: hadiths.length,
      itemBuilder: (context, index) {
        final hadith = hadiths[index];
        return _buildHadithCard(hadith);
      },
    );
  }

  Widget _buildHadithCard(HadithModel hadith) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    hadith.book,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            if (hadith.title.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                hadith.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryGreen,
                ),
              ),
            ],
            const SizedBox(height: 16),
            if (hadith.arabicText.isNotEmpty) ...[
              Text(
                hadith.arabicText,
                style: GoogleFonts.amiri(
                  fontSize: 22,
                  height: 2.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
              const Divider(height: 32),
            ],
            Text(
              hadith.translation,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hadith.narrator.isNotEmpty)
                    Text(
                      'Narrated by: ${hadith.narrator}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  if (hadith.reference.isNotEmpty)
                    Text(
                      'Reference: ${hadith.reference}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Share functionality
                  },
                  color: AppTheme.primaryGreen,
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {
                    // Bookmark functionality
                  },
                  color: AppTheme.primaryGreen,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
