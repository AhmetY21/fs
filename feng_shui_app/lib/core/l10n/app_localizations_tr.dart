// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Feng Shui';

  @override
  String get appSubtitle => 'AI Oda Analizörü';

  @override
  String get navAnalyze => 'Analiz';

  @override
  String get navLearn => 'Öğren';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get stepUpload => 'Yükle';

  @override
  String get stepAnalyze => 'Analiz Et';

  @override
  String get stepReport => 'Rapor';

  @override
  String get uploadTitle => 'Oda Fotoğrafınızı Yükleyin';

  @override
  String get uploadSubtitle =>
      'Kapı pozisyonunu, ana mobilyaları ve pencereleri gösteren net bir oda fotoğrafı çekin.';

  @override
  String get uploadPlaceholder => 'Fotoğraf çekin veya galeriden seçin';

  @override
  String get uploadFormats => 'JPEG, PNG, WebP — Maks 10 MB';

  @override
  String get uploadCamera => 'Kamera';

  @override
  String get uploadGallery => 'Galeri';

  @override
  String get uploadRemove => 'Kaldır';

  @override
  String get analyzeButton => 'Feng Shui Analiz Et';

  @override
  String get analyzingMessage => 'Feng Shui AI ile analiz ediliyor...';

  @override
  String get newAnalysis => 'Yeni Analiz';

  @override
  String get spatialMapTitle => 'Mekansal Harita';

  @override
  String get reportTitle => 'Feng Shui Raporu';

  @override
  String get redesignPromptTitle => 'AI Yeniden Tasarım Promptu';

  @override
  String get copyPrompt => 'Promptu Kopyala';

  @override
  String get promptCopied => 'Prompt panoya kopyalandı';

  @override
  String get redesignNote =>
      'Bu promptu oda yeniden tasarımı için AI görüntü oluşturucularla kullanın';

  @override
  String get roomType => 'Oda Türü';

  @override
  String get chiFlow => 'Chi Akışı';

  @override
  String get dominantElement => 'Baskın Element';

  @override
  String get commandPosition => 'Komut Pozisyonu';

  @override
  String commandPositionPrimary(String furniture) {
    return 'Birincil: $furniture';
  }

  @override
  String issuesFound(int count) {
    return 'Bulunan Sorunlar ($count)';
  }

  @override
  String get whatsWorkingWell => 'İyi Olan Yönler';

  @override
  String get fiveElementBalance => 'Beş Element Dengesi';

  @override
  String get dominant => 'Baskın';

  @override
  String get missing => 'Eksik';

  @override
  String get suggestion => 'Öneri';

  @override
  String get chiFlowAnalysis => 'Chi Akış Analizi';

  @override
  String get severityCritical => 'Kritik';

  @override
  String get severityHigh => 'Yüksek';

  @override
  String get severityModerate => 'Orta';

  @override
  String get severityLow => 'Düşük';

  @override
  String get severityMinor => 'Küçük';

  @override
  String severityLabel(String label, int value) {
    return 'Şiddet: $label ($value/5)';
  }

  @override
  String get gradeExcellent => 'Mükemmel';

  @override
  String get gradeVeryGood => 'Çok İyi';

  @override
  String get gradeGood => 'İyi';

  @override
  String get gradeFair => 'Orta';

  @override
  String get gradeNeedsWork => 'İyileştirme Gerekli';

  @override
  String get gradePoor => 'Zayıf';

  @override
  String get gradeMajorIssues => 'Ciddi Sorunlar';

  @override
  String get chiExcellent => 'Mükemmel';

  @override
  String get chiGood => 'İyi';

  @override
  String get chiModerate => 'Orta';

  @override
  String get chiPoor => 'Zayıf';

  @override
  String get chiStagnant => 'Durağan';

  @override
  String get learnTitle => 'Feng Shui 101';

  @override
  String get learnSubtitle =>
      'Siz ve çevreniz arasında uyum yaratmanın kadim sanatı. AI analizimizi güçlendiren temel kavramları öğrenin.';

  @override
  String get learnChiTitle => 'Chi — Yaşam Gücü Enerjisi';

  @override
  String get learnChiBadge => 'Temel';

  @override
  String get learnChiBody =>
      'Chi, her şeyin içinden akan görünmez yaşam gücü enerjisidir — bedeniniz, eviniz ve doğal dünya. Feng Shui\'de amaç, chi\'nin yaşam alanlarınızda nazikçe ve özgürce akmasını sağlamaktır.';

  @override
  String get learnChiGoodTitle => 'İyi Chi Akışı';

  @override
  String get learnChiGood1 => 'Odalarda nazikçe kıvrılarak akar';

  @override
  String get learnChiGood2 => 'Ön kapıdan girer';

  @override
  String get learnChiGood3 => 'Kavisli mobilyaların etrafında akar';

  @override
  String get learnChiGood4 => 'Rahat oturma alanlarında durakslar';

  @override
  String get learnChiGood5 => 'Pencerelerden nazikçe çıkar';

  @override
  String get learnChiBlockedTitle => 'Bloke Chi';

  @override
  String get learnChiBlocked1 => 'Dağınıklık köşelerde enerjiyi durdurur';

  @override
  String get learnChiBlocked2 => 'Kapalı kapılar durgun enerjiyi hapseder';

  @override
  String get learnChiBlocked3 =>
      'Karanlık, kullanılmayan odalar olumsuzluk biriktirir';

  @override
  String get learnChiBlocked4 => 'Aşırı dolu dolaplar baskı yaratır';

  @override
  String get learnChiBlocked5 => 'Yatak altındaki eşyalar uykuyu bozar';

  @override
  String get learnChiShaTitle => 'Sha Chi (Öldürücü Enerji)';

  @override
  String get learnChiSha1 => 'Uzun düz koridorlar enerjiyi hızlandırır';

  @override
  String get learnChiSha2 => 'Keskin köşeler zehirli oklar yöneltir';

  @override
  String get learnChiSha3 => 'Kapı pencereye bakıyorsa chi hızla geçer';

  @override
  String get learnChiSha4 => 'Açık kirişler insanların üzerine baskı yapar';

  @override
  String get learnChiSha5 => 'Çok hızlı chi kaygıya neden olur';

  @override
  String get learnCommandTitle => 'Komut Pozisyonu';

  @override
  String get learnCommandBadge => 'En Önemli Kural';

  @override
  String get learnCommandBody =>
      'Komut Pozisyonu, her odadaki ana mobilyanın nereye yerleştirileceğini belirler — yatak odasında yatak, ofiste masa ve mutfakta ocak.';

  @override
  String get learnCommandRule1 =>
      'Kapıyı görün — Girişe net bir görüş hattınız olmalı.';

  @override
  String get learnCommandRule2 =>
      'Doğrudan karşıda değil — Mobilyaları kapının tam karşısına koymayın.';

  @override
  String get learnCommandRule3 =>
      'Arkada sağlam duvar — Sırtınız pencere değil duvar tarafından desteklenmeli.';

  @override
  String get learnElementsTitle => 'Beş Element';

  @override
  String get learnElementsBadge => 'Denge';

  @override
  String get learnElementsBody =>
      'Evrendeki her şey beş elementten birine karşılık gelir. Dengeli bir oda beşini de içerir. Üretken bir döngü ve yıkıcı bir döngü izlerler.';

  @override
  String get learnElementsCycle => 'Ahşap → Ateş → Toprak → Metal → Su → Ahşap';

  @override
  String get elementWood => 'Ahşap';

  @override
  String get elementFire => 'Ateş';

  @override
  String get elementEarth => 'Toprak';

  @override
  String get elementMetal => 'Metal';

  @override
  String get elementWater => 'Su';

  @override
  String get elementColors => 'Renkler';

  @override
  String get elementShapes => 'Şekiller';

  @override
  String get elementDirection => 'Yön';

  @override
  String get elementRepresents => 'Temsil';

  @override
  String get elementMaterials => 'Malzemeler';

  @override
  String get woodColors => 'Yeşil, Kahverengi';

  @override
  String get woodShapes => 'Dikdörtgen, Sütunlu';

  @override
  String get woodDirection => 'Doğu, Güneydoğu';

  @override
  String get woodRepresents => 'Büyüme, Canlılık';

  @override
  String get woodMaterials => 'Bitkiler, Ahşap mobilya';

  @override
  String get fireColors => 'Kırmızı, Turuncu, Pembe';

  @override
  String get fireShapes => 'Üçgen, Sivri';

  @override
  String get fireDirection => 'Güney';

  @override
  String get fireRepresents => 'Tutku, Şöhret';

  @override
  String get fireMaterials => 'Mumlar, Işıklar';

  @override
  String get earthColors => 'Sarı, Bej, Terakota';

  @override
  String get earthShapes => 'Kare, Düz';

  @override
  String get earthDirection => 'Merkez, GB, KD';

  @override
  String get earthRepresents => 'Kararlılık, Beslenme';

  @override
  String get earthMaterials => 'Seramik, Taş';

  @override
  String get metalColors => 'Beyaz, Altın, Gümüş';

  @override
  String get metalShapes => 'Yuvarlak, Küresel';

  @override
  String get metalDirection => 'Batı, Kuzeybatı';

  @override
  String get metalRepresents => 'Hassasiyet, Netlik';

  @override
  String get metalMaterials => 'Metal, Demir, Pirinç';

  @override
  String get waterColors => 'Mavi, Siyah';

  @override
  String get waterShapes => 'Dalgalı, Düzensiz';

  @override
  String get waterDirection => 'Kuzey';

  @override
  String get waterRepresents => 'Bilgelik, Kariyer';

  @override
  String get waterMaterials => 'Cam, Aynalar, Çeşmeler';

  @override
  String get learnBaguaTitle => 'Bagua Haritası';

  @override
  String get learnBaguaBadge => 'Harita';

  @override
  String get learnBaguaBody =>
      'Bagua, kat planınızın üzerine yerleştirilen bir enerji haritasıdır. Alanınızı her biri belirli bir yön ve elemente bağlı 9 yaşam alanına böler.';

  @override
  String get learnShaChiTitle => 'Sha Chi — Zehirli Oklar';

  @override
  String get learnShaChiBadge => 'Kaçının';

  @override
  String get learnShaChiBody =>
      'Sha Chi, keskin açılar, uzun düz çizgiler ve baskıcı yapılar tarafından oluşturulan agresif, hızlı hareket eden enerjidir.';

  @override
  String get shaPoisonArrows => 'Zehirli Oklar';

  @override
  String get shaPoisonArrowsDesc =>
      'Oturduğunuz veya uyuduğunuz yere bakan keskin mobilya köşeleri. Çözüm: mobilyaları açılı yerleştirin veya bitkiler kullanın.';

  @override
  String get shaCorridors => 'Uzun Koridorlar';

  @override
  String get shaCorridorsDesc =>
      'Dar koridorlar tünel gibi davranır, chi\'yi hızlandırır. Çözüm: duvarlara sanat eserleri, halılar veya bitkiler ekleyin.';

  @override
  String get shaBeams => 'Açık Kirişler';

  @override
  String get shaBeamsDesc =>
      'Yatağınızın veya masanızın üzerindeki ağır kirişler baskıcı enerjiyle bastırır. Çözüm: kumaş örtün veya boyayın.';

  @override
  String get shaMirror => 'Yatağa Bakan Ayna';

  @override
  String get shaMirrorDesc =>
      'Aynalar enerjiyi sıçratır ve geceleri sizi ürkütebilir. Çözüm: aynaları taşıyın veya geceleri örtün.';

  @override
  String get learnRoomTipsTitle => 'Oda Oda Rehber';

  @override
  String get learnRoomTipsBadge => 'Pratik';

  @override
  String get roomBedroom => 'Yatak Odası';

  @override
  String get roomOffice => 'Ofis';

  @override
  String get roomLiving => 'Oturma Odası';

  @override
  String get roomKitchen => 'Mutfak';

  @override
  String get roomEntrance => 'Giriş';

  @override
  String get roomBathroom => 'Banyo';

  @override
  String get readyToAnalyze => 'Alanınızı analiz etmeye hazır mısınız?';

  @override
  String get readyToAnalyzeSubtitle =>
      'Bir fotoğraf yükleyin ve AI destekli Feng Shui değerlendirmesi alın.';

  @override
  String get startAnalysis => 'Analize Başla';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get settingsAbout => 'Hakkında';

  @override
  String settingsVersion(String version) {
    return 'Sürüm $version';
  }

  @override
  String settingsRulesCount(int count) {
    return '$count+ doğrulanmış kural içeren Feng Shui bilgi tabanı';
  }

  @override
  String get settingsPoweredBy =>
      'Gemini Vision AI tarafından desteklenmektedir';

  @override
  String get errorGeneric => 'Bir şeyler ters gitti. Lütfen tekrar deneyin.';

  @override
  String get errorNetwork => 'İnternet bağlantısı yok. Ağınızı kontrol edin.';

  @override
  String get errorRateLimit => 'Çok fazla istek. Lütfen biraz bekleyin.';

  @override
  String get errorInvalidImage =>
      'Geçersiz görüntü. Lütfen JPEG, PNG veya WebP kullanın.';

  @override
  String get errorImageTooLarge => 'Görüntü çok büyük. Maksimum boyut 10 MB.';

  @override
  String get errorAnalysisFailed =>
      'Analiz başarısız oldu. Lütfen tekrar deneyin.';

  @override
  String get retry => 'Tekrar Dene';

  @override
  String get languageEnglish => 'İngilizce';

  @override
  String get languageTurkish => 'Türkçe';
}
