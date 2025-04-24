import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String empty = "";
const int zero = 0;

extension ContextExtension on BuildContext {
  double get statusPadding => MediaQuery.paddingOf(this).top;
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return empty;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double toDouble() {
    if (this == null) {
      return 0.0;
    } else {
      return this!;
    }
  }
}

extension IntegerExtension on int? {
  int orZero() {
    if (this == null) {
      return zero;
    } else {
      return this!;
    }
  }

  String? format() {
    if (this == null) {
      return null;
    }
    return DateFormat("d, MMMM yy")
        .format(DateTime.fromMicrosecondsSinceEpoch(this!));
  }

  String toRisk() {
    switch (this) {
      case 0:
        return "Low";
      case 1:
        return "Medium";
      case 2:
        return "High";
      default:
        return "Unknown";
    }
  }

  String toQueOne() {
    switch (this) {
      case 0:
        return "It was given to me";
      case 1:
        return "I payed for it";
      default:
        return "Unknown";
    }
  }

  String toQueTwo() {
    switch (this) {
      case 0:
        return "Definitely yes";
      case 1:
        return "Probably yes";
      case 2:
        return "Not sure";
      case 3:
        return "Probably not";
      case 4:
        return "Definitely not";
      default:
        return "Unknown";
    }
  }
}

extension DateTimeExtension on DateTime? {
  String format(String format) {
    if (this == null) {
      return "N/A";
    } else {
      return DateFormat(format).format(this!);
    }
  }
}
