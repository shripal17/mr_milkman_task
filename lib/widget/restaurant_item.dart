import 'package:flutter/material.dart';
import 'package:milkman_task/model/restaurant.dart';
import 'package:milkman_task/util/constants.dart';
import 'package:milkman_task/util/extensions.dart';
import 'package:milkman_task/widget/platform_cached_network_image.dart';
import 'package:sprintf/sprintf.dart';

class RestaurantItem extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantItem({Key? key, required this.restaurant}) : super(key: key);

  @override
  _RestaurantItemState createState() => _RestaurantItemState();
}

class _RestaurantItemState extends State<RestaurantItem> {
  double scale = 1;
  final _carouselController = PageController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) => setState(() => scale = 0.95),
      onLongPressEnd: (_) => setState(() => scale = 1),
      child: AnimatedScale(
        scale: scale,
        duration: AppAnimations.duration,
        curve: Curves.easeInBack,
        child: Card(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SizedBox(
            height: 360,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                        child: PageView(
                          controller: _carouselController,
                          children: widget.restaurant.images!.map((e) => PlatformCachedNetworkImage(e, fit: BoxFit.cover)).toList(),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 12,
                        child: CircleAvatar(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black38,
                          radius: 20,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 22,
                            onPressed: () {
                              if ((_carouselController.page?.round() ?? 0) == 0) {
                                _carouselController.animateToPage(widget.restaurant.images!.length - 1, duration: AppAnimations.duration, curve: AppAnimations.curve);
                              } else {
                                _carouselController.previousPage(duration: AppAnimations.duration, curve: AppAnimations.curve);
                              }
                            },
                            icon: const Icon(Icons.chevron_left),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 12,
                        child: CircleAvatar(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black38,
                          radius: 20,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 22,
                            onPressed: () {
                              if ((_carouselController.page?.round() ?? 0) == widget.restaurant.images!.length - 1) {
                                _carouselController.animateToPage(0, duration: AppAnimations.duration, curve: AppAnimations.curve);
                              } else {
                                _carouselController.nextPage(duration: AppAnimations.duration, curve: AppAnimations.curve);
                              }
                            },
                            icon: const Icon(Icons.chevron_right),
                          ),
                        ),
                      ),
                      if (widget.restaurant.isPureVeg) ...{
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 28,
                            color: Colors.green.shade700.withOpacity(0.9),
                            child: Center(
                              child: Text(
                                "Pure Veg Restaurant".toUpperCase(),
                                style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      },
                      Positioned(
                        bottom: 12,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.access_time, color: widget.restaurant.deliveryIconColor, size: 16),
                              const SizedBox(width: 2),
                              Text(
                                "${widget.restaurant.deliveryTime} mins | ${widget.restaurant.distance} km",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (widget.restaurant.featuredPromo != null)
                        Positioned(
                          left: 0,
                          bottom: 12,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue.shade400, Colors.blue.shade900],
                              ),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6)),
                            ),
                            padding: EdgeInsets.all(4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.offline_bolt_outlined, color: Colors.white, size: 16),
                                const SizedBox(width: 4),
                                Text(widget.restaurant.featuredPromo!, style: TextStyle(color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          widget.restaurant.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(color: widget.restaurant.ratingContainerColor, borderRadius: BorderRadius.circular(6)),
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(sprintf("%.1f", [widget.restaurant.rating]), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14)),
                            const Icon(Icons.star, size: 12, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6.01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          widget.restaurant.cuisine ?? 'Food',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.65)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.restaurant.priceRange ?? 'Affordable',
                        style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.65)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
