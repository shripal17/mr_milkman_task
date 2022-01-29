// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestaurantApi implements RestaurantApi {
  _RestaurantApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://923a3c00-1388-483e-adb9-d389f84b83c1.mock.pstmn.io/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Restaurant>> getRestaurants() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Restaurant>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'restaurants',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Restaurant.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<RestaurantMenuItem>> getRestaurantMenu(restaurantId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<RestaurantMenuItem>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'menu/$restaurantId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            RestaurantMenuItem.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
