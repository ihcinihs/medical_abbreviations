import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/abbreviation_providers.dart';
import '../models/abbreviation.dart';
import '../theme/app_colors.dart';

class AbbreviationDetailScreen extends ConsumerWidget {
  const AbbreviationDetailScreen({super.key, required this.item});

  final Abbreviation item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allAbbreviations = ref.watch(abbreviationsProvider).when(
          data: (entries) => entries,
          loading: () => const <Abbreviation>[],
          error: (_, _) => const <Abbreviation>[],
        );
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(item.abbreviation),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(CupertinoIcons.house_fill, size: 16),
              SizedBox(width: 4),
              Text('ホーム'),
            ],
          ),
        ),
        border: null,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          children: [
            Text(
              item.abbreviation,
              style: const TextStyle(
                color: CupertinoColors.label,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.english,
              style: const TextStyle(
                color: CupertinoColors.label,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.japanese,
              style: const TextStyle(
                color: CupertinoColors.secondaryLabel,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 30),
            _DetailSection(
              title: '\u8b1b\u7fa9',
              child: Text(item.subjects.join('\u30fb')),
            ),
            _DetailSection(title: '\u8aac\u660e', child: Text(item.description)),
            _DetailSection(
              title: '\u95a2\u9023\u7565\u8a9e',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final related in item.related)
                    _RelatedAbbreviationChip(
                      label: related,
                      target: _findAbbreviation(allAbbreviations, related),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Abbreviation? _findAbbreviation(
  List<Abbreviation> entries,
  String abbreviation,
) {
  for (final entry in entries) {
    if (entry.abbreviation.toLowerCase() == abbreviation.toLowerCase()) {
      return entry;
    }
  }
  return null;
}

class _RelatedAbbreviationChip extends StatelessWidget {
  const _RelatedAbbreviationChip({required this.label, required this.target});

  final String label;
  final Abbreviation? target;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      onPressed: target == null
          ? null
          : () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => AbbreviationDetailScreen(item: target!),
                ),
              );
            },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: target == null
                ? CupertinoColors.secondaryLabel
                : AppColors.nihBlue,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: CupertinoColors.secondaryLabel,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          DefaultTextStyle(
            style: const TextStyle(
              color: CupertinoColors.label,
              fontSize: 17,
              height: 1.5,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
