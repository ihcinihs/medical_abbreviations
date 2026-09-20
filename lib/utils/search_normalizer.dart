/// Produces a search key that ignores separators commonly used in medical terms.
///
/// For example, `PD-L1`, `PD L1`, and `PDL1` all become `pdl1`.
String normalizeSearchText(String value) {
  return value
      .trim()
      .toLowerCase()
      .replaceAll(
        RegExp(r'''[\s\-‐‑‒–—―_./／\\,，、;；:：()（）\[\]{}「」『』<>＜＞!?！？&＆+＋*＊・]'''),
        '',
      );
}
