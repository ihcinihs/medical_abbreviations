import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/abbreviation_providers.dart';
import '../models/abbreviation.dart';
import '../theme/app_colors.dart';
import '../utils/search_normalizer.dart';
import '../widgets/abbreviation_result_cell.dart';
import 'abbreviation_detail_screen.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<Abbreviation> _filter(List<Abbreviation> entries) {
    final query = normalizeSearchText(_query);
    if (query.length < 2) return const [];

    final matches = entries.where((item) {
      return normalizeSearchText(item.abbreviation).contains(query) ||
          normalizeSearchText(item.english).contains(query) ||
          normalizeSearchText(item.japanese).contains(query);
    }).toList();

    matches.sort((first, second) {
      final firstIsExact = _isExactMatch(first, query);
      final secondIsExact = _isExactMatch(second, query);

      if (firstIsExact == secondIsExact) return 0;
      return firstIsExact ? -1 : 1;
    });

    return matches;
  }

  bool _isExactMatch(Abbreviation item, String query) {
    return normalizeSearchText(item.abbreviation) == query ||
        normalizeSearchText(item.english) == query ||
        normalizeSearchText(item.japanese) == query;
  }

  @override
  Widget build(BuildContext context) {
    final abbreviations = ref.watch(abbreviationsProvider);

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Icon(
              CupertinoIcons.heart_fill,
              color: AppColors.nihBlue,
              size: 64,
            ),
            const SizedBox(height: 12),
            Text(
              '\u533b\u7642\u7565\u8a9e',
              style: const TextStyle(
                color: CupertinoColors.label,
                fontFamily: 'NotoSansJP',
                fontSize: 28,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildSearchField(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _query.trim().isEmpty
                  ? const SizedBox.shrink()
                  : abbreviations.when(
                      loading: () =>
                          const Center(child: CupertinoActivityIndicator()),
                      error: (_, _) => const Center(
                        child: Text('\u30c7\u30fc\u30bf\u306e\u8aad\u307f\u8fbc\u307f\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002'),
                      ),
                      data: (entries) => _SearchResultList(
                        query: _query,
                        results: _filter(entries),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return CupertinoSearchTextField(
      controller: _controller,
      focusNode: _focusNode,
      placeholder: '\u7565\u8a9e\u30fb\u6b63\u5f0f\u540d\u79f0\u30fb\u65e5\u672c\u8a9e\u540d\u3067\u691c\u7d22',
      onChanged: (value) => setState(() => _query = value),
    );
  }
}

class _SearchResultList extends StatelessWidget {
  const _SearchResultList({required this.query, required this.results});

  final String query;
  final List<Abbreviation> results;

  @override
  Widget build(BuildContext context) {
    if (normalizeSearchText(query).length < 2) {
      return const Center(child: Text('2文字以上入力してください。'));
    }

    if (results.isEmpty) {
      return const Center(child: Text('\u4e00\u81f4\u3059\u308b\u7565\u8a9e\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093\u3002'));
    }

    return ListView.separated(
      padding: const EdgeInsets.only(top: 6, bottom: 24),
      itemCount: results.length,
      separatorBuilder: (_, _) => const SizedBox(
        height: 1,
        child: ColoredBox(color: CupertinoColors.separator),
      ),
      itemBuilder: (context, index) {
        final item = results[index];
        return AbbreviationResultCell(
          item: item,
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (_) => AbbreviationDetailScreen(item: item),
              ),
            );
          },
        );
      },
    );
  }
}
