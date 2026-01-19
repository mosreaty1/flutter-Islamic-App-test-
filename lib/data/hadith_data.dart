import '../models/hadith_model.dart';

class HadithData {
  static List<HadithModel> sampleHadiths = [
    HadithModel(
      id: '1',
      title: 'The Importance of Intention',
      arabicText: 'إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى',
      translation:
          'The reward of deeds depends upon the intentions and every person will get the reward according to what he has intended.',
      narrator: 'Umar ibn Al-Khattab (RA)',
      book: 'Faith',
      reference: 'Sahih Bukhari, Book 1, Hadith 1',
    ),
    HadithModel(
      id: '2',
      title: 'The Five Pillars of Islam',
      arabicText: 'بُنِيَ الْإِسْلَامُ عَلَى خَمْسٍ',
      translation:
          'Islam is built upon five pillars: testifying that there is no deity worthy of worship except Allah and that Muhammad is the Messenger of Allah, establishing the prayer, paying the Zakat, making the pilgrimage to the House, and fasting in Ramadan.',
      narrator: 'Abdullah ibn Umar (RA)',
      book: 'Faith',
      reference: 'Sahih Bukhari, Book 2, Hadith 7',
    ),
    HadithModel(
      id: '3',
      title: 'The Best of People',
      arabicText: 'خَيْرُكُمْ مَنْ تَعَلَّمَ الْقُرْآنَ وَعَلَّمَهُ',
      translation:
          'The best among you (Muslims) are those who learn the Quran and teach it.',
      narrator: 'Uthman ibn Affan (RA)',
      book: 'Faith',
      reference: 'Sahih Bukhari, Book 66, Hadith 5027',
    ),
    HadithModel(
      id: '4',
      title: 'Prayer: The Light',
      arabicText: 'الصَّلَاةُ نُورٌ',
      translation:
          'Prayer is light, and charity is proof, and patience is illumination, and the Quran is a proof for you or against you.',
      narrator: 'Abu Malik Al-Ashari (RA)',
      book: 'Prayer',
      reference: 'Sahih Muslim, Book 2, Hadith 432',
    ),
    HadithModel(
      id: '5',
      title: 'Fasting in Ramadan',
      arabicText: 'مَنْ صَامَ رَمَضَانَ إِيمَانًا وَاحْتِسَابًا غُفِرَ لَهُ مَا تَقَدَّمَ مِنْ ذَنْبِهِ',
      translation:
          'Whoever fasts during Ramadan out of sincere faith and hoping to attain Allah\'s rewards, then all his past sins will be forgiven.',
      narrator: 'Abu Hurairah (RA)',
      book: 'Ramadan',
      reference: 'Sahih Bukhari, Book 31, Hadith 2014',
    ),
    HadithModel(
      id: '6',
      title: 'The Night of Decree',
      arabicText: 'مَنْ قَامَ لَيْلَةَ الْقَدْرِ إِيمَانًا وَاحْتِسَابًا غُفِرَ لَهُ مَا تَقَدَّمَ مِنْ ذَنْبِهِ',
      translation:
          'Whoever establishes prayers on the night of Qadr out of sincere faith and hoping to attain Allah\'s rewards then all his past sins will be forgiven.',
      narrator: 'Abu Hurairah (RA)',
      book: 'Ramadan',
      reference: 'Sahih Bukhari, Book 32, Hadith 2015',
    ),
    HadithModel(
      id: '7',
      title: 'Kindness to Parents',
      arabicText: 'رِضَا اللَّهِ فِي رِضَا الْوَالِدِ وَسَخَطُ اللَّهِ فِي سَخَطِ الْوَالِدِ',
      translation:
          'The pleasure of Allah lies in the pleasure of the parent. The anger of Allah lies in the anger of the parent.',
      narrator: 'Abdullah ibn Amr (RA)',
      book: 'Morality',
      reference: 'Jami at-Tirmidhi, Book 27, Hadith 1899',
    ),
    HadithModel(
      id: '8',
      title: 'Charity Does Not Decrease Wealth',
      arabicText: 'مَا نَقَصَتْ صَدَقَةٌ مِنْ مَالٍ',
      translation:
          'Charity does not decrease wealth, no one forgives another except that Allah increases his honor, and no one humbles himself for the sake of Allah except that Allah raises his status.',
      narrator: 'Abu Hurairah (RA)',
      book: 'Charity',
      reference: 'Sahih Muslim, Book 45, Hadith 6264',
    ),
  ];
}
