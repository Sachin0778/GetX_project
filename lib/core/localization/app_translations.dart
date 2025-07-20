import 'package:get/get.dart';
import 'translations/en_us.dart';
import 'translations/es_es.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'es_ES': esES,
      };
} 