import 'package:flutter/material.dart';
import 'device_type.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  var orientation = mediaQueryData.orientation;
  double width = 0;
  if (orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  } else {
    width = mediaQueryData.size.width;
  }
  if (width >= 900) {
    return DeviceType.Desktop;
  } else if (width >= 600) {
    return DeviceType.Tablet;
  } else {
    return DeviceType.Mobile;
  }
}
