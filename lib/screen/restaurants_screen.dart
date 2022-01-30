import 'package:flutter/material.dart';
import 'package:milkman_task/model/restaurant.dart';
import 'package:milkman_task/util/constants.dart';
import 'package:milkman_task/util/helpers.dart';
import 'package:milkman_task/util/platform_cached_network_image_provider.dart';
import 'package:milkman_task/util/services.dart';
import 'package:milkman_task/widget/restaurant_item.dart';
import 'package:milkman_task/widget/sort_chip.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:dartx/dartx.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({Key? key}) : super(key: key);

  @override
  _RestaurantsScreenState createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  final _restaurantsIN = RM.inject<List<Restaurant>?>(() => null);
  final _searchTermIN = RM.inject<String?>(() => null);
  final _appliedSortsIN = RM.inject(() => <int>[]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: true,
              backgroundColor: Colors.white,
              toolbarHeight: kToolbarHeight + 15,
              forceElevated: innerBoxIsScrolled,
              foregroundColor: Colors.black,
              title: Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: AppColors.accent, size: 32),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => showSnackBar(context, content: "Location change"),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("Home", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.accent)),
                              SizedBox(width: 4),
                              Icon(Icons.keyboard_arrow_down, color: AppColors.accent),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text("Address Line1, Address Line2", style: TextStyle(color: Colors.black54, inherit: false, fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(onPressed: () => showSnackBar(context, content: "Profile Clicked"), icon: const Icon(Icons.person)),
                const SizedBox(width: 12),
              ],
              bottom: PreferredSize(
                preferredSize: const Size(double.maxFinite, 175),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: OnBuilder(
                          listenTo: _searchTermIN,
                          builder: () => TextField(
                            maxLength: 20,
                            textInputAction: TextInputAction.search,
                            maxLines: 1,
                            onSubmitted: (searchText) {
                              // TODO Handle Search
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                              counterText: "",
                              prefixIcon: const Icon(Icons.search, color: AppColors.accent),
                              hintText: "Restaurant name or a cuisine",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: OnBuilder(
                          listenTo: _appliedSortsIN,
                          builder: () => ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 60),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                SortChip(sortId: 0, label: "Fastest Delivery"),
                                SortChip(sortId: 1, label: "Rating 4.0+"),
                                SortChip(sortId: 2, label: "Pure Veg"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      OnBuilder(
                        listenTo: _restaurantsIN,
                        builder: () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            !_restaurantsIN.hasData ? "Fetching restaurants" : "${_restaurantsIN.state!.length} restaurants around you",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
          body: RefreshIndicator(
            onRefresh: _loadRestaurants,
            child: OnBuilder.all(
              listenTo: _restaurantsIN,
              sideEffects: SideEffects<List<Restaurant>>(initState: _loadRestaurants),
              onWaiting: () => centeredProgress,
              onData: (List<Restaurant>? data) => data == null
                  ? const Center(child: Text("Data is null"))
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => RestaurantItem(restaurant: data[index]),
                    ),
              onError: (error, void Function() refreshError) => Center(child: Text(error)),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loadRestaurants() async {
    await _restaurantsIN.setState((s) async {
      final restaurantsResp = await restaurantService.getRestaurants();
      if (restaurantsResp.success && restaurantsResp.data != null) {
        s = restaurantsResp.data;
        final imageUrls = restaurantsResp.data!.where((element) => element.images != null).toList().sublist(0, 4).map((e) => e.images!).toList().flatten();
        await Future.wait(imageUrls.map((e) => precacheImage(PlatformCachedNetworkImageProvider(e), context)));
        return s;
      } else {
        throw Exception(restaurantsResp.apiError);
      }
    });
  }
}
