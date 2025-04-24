import 'package:geolocator/geolocator.dart';
import 'dart:async'; // Để sử dụng TimeoutException

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      // Kiểm tra xem dịch vụ định vị có được bật không
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Dịch vụ định vị bị tắt');
        return;
      }

      // Kiểm tra trạng thái quyền vị trí
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Người dùng từ chối cấp quyền vị trí');
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        print('Quyền vị trí bị từ chối vĩnh viễn');
        return;
      }
      print('TÔI CÓ QUYỀN');

      // Lấy vị trí với timeout 10 giây
      print('AWAITING LOCATION');
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      ).timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException('Không thể lấy vị trí trong thời gian cho phép');
      });

      latitude = position.latitude;
      longitude = position.longitude;
      print('Vị trí: $latitude, $longitude');
    } catch (e) {
      print('Lỗi lấy vị trí: $e');
    }
  }
}