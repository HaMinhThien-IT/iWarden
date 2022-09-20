enum ScanMode {
  // ignore: constant_identifier_names
  LicensePlate,
  // ignore: constant_identifier_names
  LicensePlateUS,
  // ignore: constant_identifier_names
  LicensePlateAF,
  // ignore: constant_identifier_names
  ParallelScanning,
  // ignore: constant_identifier_names
  SerialScanning,
}

extension ScanModeInfo on ScanMode {
  String get label {
    switch (this) {
      case ScanMode.LicensePlate:
        return 'License Plate';
      case ScanMode.LicensePlateUS:
        return 'License Plate US';
      case ScanMode.LicensePlateAF:
        return 'License Plate Africa';
      case ScanMode.ParallelScanning:
        return 'Parallel Scanning';
      case ScanMode.SerialScanning:
        return 'Serial Scanning';
    }
  }

  String get key {
    // ignore: unnecessary_this
    return this.toString().split('.').last;
  }

  bool isCompositeScan() {
    return this == ScanMode.ParallelScanning || this == ScanMode.SerialScanning;
  }
}
