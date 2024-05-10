extension TwoDecimals on double {
  String get twoDecimals => toStringAsFixed(2).replaceFirst(RegExp(r'\.?0*$'), '');
}
