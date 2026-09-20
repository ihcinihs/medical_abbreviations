import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/abbreviation.dart';
import '../services/abbreviation_service.dart';

final abbreviationServiceProvider = Provider<AbbreviationService>(
  (ref) => const AbbreviationService(),
);

/// Exposes the catalog and its loading/error states to every screen.
final abbreviationsProvider = FutureProvider<List<Abbreviation>>((ref) {
  return ref.watch(abbreviationServiceProvider).loadAll();
});
