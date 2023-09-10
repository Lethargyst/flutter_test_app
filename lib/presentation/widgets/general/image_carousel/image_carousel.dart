import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_app/config/themes/fonts.dart';
import 'package:test_app/presentation/widgets/general/image_carousel/indicator.dart';
import 'package:test_app/presentation/widgets/general/image_carousel/slide.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({ 
    super.key,
    required this.images
  });

  factory ImageCarousel.fromUri({
    Key? key,
    required List<Uri> uris
  }) {
    // Загрузим картинки по их url
    final images = List.generate(
      uris.length, 
      (index) => Image.network(
        uris[index].toString(),
        fit: BoxFit.cover,
        loadingBuilder: _onImageLoading,
        errorBuilder: _onImageError,
      )
    );

    return ImageCarousel(
      key: key,
      images: images
    );
  }

  final List<Image> images;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final current = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context){
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 250,
            viewportFraction: 1.0,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,

            onPageChanged: (index, _) {
              setState(() {
                current.value = index;
              });
            }
          ),
      
          items: widget.images.map(
            (element) => Slide(image: element)
          ).toList(), 
        ),

        Positioned(
          bottom: 8,
          child: Indicator(
            amount: widget.images.length, 
            current: current
          ),
        ),
      ]
    );
  }
}

Widget _onImageLoading(BuildContext context, Widget child, ImageChunkEvent? progress) {
  if (progress == null) return child;

  return Center(
    child: CircularProgressIndicator(
      value: progress.expectedTotalBytes != null
        ? progress.cumulativeBytesLoaded /
            progress.expectedTotalBytes!
        : null,
    ),
  );
}

Widget _onImageError(BuildContext context, Object exception, StackTrace? stackTrace) {
  return Column(
    children: [
      Icon(Icons.error, color: Colors.red,),
      Text('Не удалось загрузить изображение', style: AppFonts.smallBold.copyWith(
        color: Colors.red
      ))
    ],
  );
}