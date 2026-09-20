import 'package:flutter_test/flutter_test.dart';
import 'package:medical_abbreviations/models/abbreviation.dart';
import 'package:medical_abbreviations/utils/search_normalizer.dart';

void main() {
  test('creates an abbreviation from JSON data', () {
    final item = Abbreviation.fromJson({
      'abbreviation': 'DIC',
      'english': 'Disseminated Intravascular Coagulation',
      'japanese': '\u64ad\u7a2e\u6027\u8840\u7ba1\u5185\u51dd\u56fa\u75c7\u5019\u7fa4',
      'subjects': ['\u8840\u6db2\u5b66', '\u75c5\u7406\u5b66'],
      'description': 'description',
      'related': ['FDP'],
    });

    expect(item.abbreviation, 'DIC');
    expect(item.subjects, ['\u8840\u6db2\u5b66', '\u75c5\u7406\u5b66']);
    expect(item.related, ['FDP']);
  });

  test('normalizes medical term separators for searching', () {
    expect(normalizeSearchText('PD-L1'), 'pdl1');
    expect(normalizeSearchText('AE_ILD'), 'aeild');
    expect(normalizeSearchText('  VV/ECMO  '), 'vvecmo');
  });
}
