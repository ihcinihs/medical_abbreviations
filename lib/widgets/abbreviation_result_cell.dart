import 'package:flutter/cupertino.dart';

import '../models/abbreviation.dart';
import '../theme/app_colors.dart';

class AbbreviationResultCell extends StatelessWidget {
  const AbbreviationResultCell({
    super.key,
    required this.item,
    required this.onTap,
  });

  final Abbreviation item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        color: CupertinoColors.systemBackground,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 70,
              child: Text(
                item.abbreviation,
                style: const TextStyle(
                  color: CupertinoColors.label,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.english,
                    style: const TextStyle(
                      color: CupertinoColors.label,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.japanese,
                    style: const TextStyle(
                      color: CupertinoColors.secondaryLabel,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.subjects.join('\u30fb'),
                    style: const TextStyle(
                      color: AppColors.nihBlue,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              CupertinoIcons.chevron_forward,
              color: CupertinoColors.tertiaryLabel,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
