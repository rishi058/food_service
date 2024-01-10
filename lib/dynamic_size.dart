class DeviceDimension{
  static double width = 375;
  static double height = 750;

  static double figmaWidth = 375;
  static double figmaHeight = 839;
}

extension SizerExt on num {

  /// Use these for Percentage Factor
  // double get h => this * DeviceDimension.height / 100;
  // double get w => this * DeviceDimension.width / 100;

  /// Use these for figma pixel perfect UI
  double get h => ( this / DeviceDimension.figmaHeight ) * DeviceDimension.height;
  double get w => ( this / DeviceDimension.figmaWidth ) * DeviceDimension.width;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * (DeviceDimension.width / 3) / 100;
}
