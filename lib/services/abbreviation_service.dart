import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/abbreviation.dart';

/// Loads the bundled abbreviation catalog.
class AbbreviationService {
  const AbbreviationService();

  static const _catalogAssetPath = 'assets/data/catalog.json';

  Future<List<Abbreviation>> loadAll() async {
    final catalogSource = await rootBundle.loadString(_catalogAssetPath);
    final catalog = jsonDecode(catalogSource) as Map<String, dynamic>;
    final sources = catalog['sources'] as List<dynamic>;
    final assetPaths = sources
        .map((source) => (source as Map<String, dynamic>)['path'] as String)
        .toList(growable: false);

    final assetSources = await Future.wait(
      assetPaths.map(rootBundle.loadString),
    );

    return assetSources
        .expand((source) {
          final document = jsonDecode(source) as Map<String, dynamic>;
          return document['abbreviations'] as List<dynamic>;
        })
        .map((entry) => Abbreviation.fromJson(entry as Map<String, dynamic>))
        .toList(growable: false);
  }
}
