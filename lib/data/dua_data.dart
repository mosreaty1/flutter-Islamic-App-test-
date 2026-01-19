import '../models/dua_model.dart';

class DuaData {
  static List<DuaModel> sampleDuas = [
    DuaModel(
      id: '1',
      title: 'Morning Remembrance',
      arabicText: 'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ',
      transliteration: 'Asbahna wa-asbahal-mulku lillah',
      translation:
          'We have reached the morning and at this very time all sovereignty belongs to Allah.',
      category: 'Morning',
      reference: 'Sahih Muslim',
    ),
    DuaModel(
      id: '2',
      title: 'Evening Remembrance',
      arabicText: 'أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ',
      transliteration: 'Amsayna wa-amsal-mulku lillah',
      translation:
          'We have reached the evening and at this very time all sovereignty belongs to Allah.',
      category: 'Evening',
      reference: 'Sahih Muslim',
    ),
    DuaModel(
      id: '3',
      title: 'Before Eating',
      arabicText: 'بِسْمِ اللَّهِ',
      transliteration: 'Bismillah',
      translation: 'In the name of Allah.',
      category: 'Daily Life',
      reference: 'Abu Dawud, At-Tirmidhi',
    ),
    DuaModel(
      id: '4',
      title: 'After Eating',
      arabicText: 'الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مُسْلِمِينَ',
      transliteration:
          'Alhamdu lillahil-ladhi at\'amana wa saqana wa ja\'alana muslimin',
      translation:
          'Praise be to Allah who has fed us and given us drink and made us Muslims.',
      category: 'Daily Life',
      reference: 'Abu Dawud, At-Tirmidhi',
    ),
    DuaModel(
      id: '5',
      title: 'When Leaving Home',
      arabicText: 'بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
      transliteration:
          'Bismillah, tawakkaltu \'alallah, wa la hawla wa la quwwata illa billah',
      translation:
          'In the name of Allah, I place my trust in Allah, and there is no might nor power except with Allah.',
      category: 'Daily Life',
      reference: 'Abu Dawud, At-Tirmidhi',
    ),
    DuaModel(
      id: '6',
      title: 'Entering the Mosque',
      arabicText: 'اللَّهُمَّ افْتَحْ لِي أَبْوَابَ رَحْمَتِكَ',
      transliteration: 'Allahumma aftah li abwaba rahmatik',
      translation: 'O Allah, open for me the doors of Your mercy.',
      category: 'Prayer',
      reference: 'Sahih Muslim',
    ),
    DuaModel(
      id: '7',
      title: 'Leaving the Mosque',
      arabicText: 'اللَّهُمَّ إِنِّي أَسْأَلُكَ مِنْ فَضْلِكَ',
      transliteration: 'Allahumma inni as\'aluka min fadlik',
      translation: 'O Allah, I ask You from Your favor.',
      category: 'Prayer',
      reference: 'Sahih Muslim',
    ),
    DuaModel(
      id: '8',
      title: 'Protection from Evil',
      arabicText: 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
      transliteration: 'A\'udhu bikalimatillahit-tammati min sharri ma khalaq',
      translation:
          'I seek refuge in the perfect words of Allah from the evil of what He has created.',
      category: 'Protection',
      reference: 'Sahih Muslim',
    ),
    DuaModel(
      id: '9',
      title: 'Ayat al-Kursi',
      arabicText:
          'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ',
      transliteration:
          'Allahu la ilaha illa huwal-hayyul-qayyum, la ta\'khudhuhu sinatun wa la nawm',
      translation:
          'Allah - there is no deity except Him, the Ever-Living, the Sustainer of existence. Neither drowsiness overtakes Him nor sleep.',
      category: 'Protection',
      reference: 'Quran 2:255',
    ),
    DuaModel(
      id: '10',
      title: 'Before Sleeping',
      arabicText: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
      transliteration: 'Bismika Allahumma amutu wa ahya',
      translation: 'In Your name, O Allah, I die and I live.',
      category: 'Evening',
      reference: 'Sahih Bukhari',
    ),
    DuaModel(
      id: '11',
      title: 'Waking Up',
      arabicText: 'الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
      transliteration:
          'Alhamdu lillahil-ladhi ahyana ba\'da ma amatana wa ilayhin-nushur',
      translation:
          'Praise is to Allah who gave us life after death and unto Him is the resurrection.',
      category: 'Morning',
      reference: 'Sahih Bukhari',
    ),
  ];
}
