import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/styles/styles.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/svg.dart';
import 'package:page_flip/page_flip.dart';

class FlipBook extends StatelessWidget {
  const FlipBook({Key? key, required this.images}) : super(key: key);
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: PageFlipWidget(
              children: <Widget>[
                for (var i = 0; i < images.length; i++)
                  Container(
                      color: neutral00,
                      child: Stack(children: [
                        Center(
                            child: Image.network(
                          images[i],
                          fit: BoxFit.fitHeight,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(Picture.splash),
                        )),
                        Positioned(
                            bottom: 17,
                            right: 10,
                            child: Text('${i + 1}/${images.length}'))
                      ])),
              ],
            )),
        Positioned(
          top: 17,
          right: 10,
          child: GestureDetector(
            onTap: () {
              Navigator.maybePop(context);
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: neutral00),
                child: const Icon(
                  Icons.close,
                  color: neutral10,
                  size: 24,
                )),
          ),
        ),
      ],
    );
  }
}

class InteractiveImage extends StatefulWidget {
  const InteractiveImage(this.image, {Key? key}) : super(key: key);

  final Widget image;

  @override
  _InteractiveImageState createState() => _InteractiveImageState();
}

class _InteractiveImageState extends State<InteractiveImage>
    with SingleTickerProviderStateMixin {
  final _transformationController = TransformationController();
  TapDownDetails _doubleTapDetails = TapDownDetails();
  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails.localPosition;
      // For a 3x zoom
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(3.0);
      // Fox a 2x zoom
      // ..translate(-position.dx, -position.dy)
      // ..scale(2.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: (d) => _doubleTapDetails = d,
      onDoubleTap: _handleDoubleTap,
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(80),
        panEnabled: false,
        scaleEnabled: true,
        minScale: 1.0,
        maxScale: 2.2,
        transformationController: _transformationController,
        child: widget.image,
      ),
    );
  }
}
