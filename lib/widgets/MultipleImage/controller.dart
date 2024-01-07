import 'package:carousel_slider/carousel_controller.dart';
import 'package:commons/commons.dart';

class MutipleImageController extends GetxController {
  final List<String> images;
  late final CarouselController carouselController;

  MutipleImageController(this.images);
  @override
  void onInit() {
    carouselController = CarouselController();
    super.onInit();
  }
}
