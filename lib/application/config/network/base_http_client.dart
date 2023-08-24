// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';

// Project imports:
import 'package:riverpod_guide/application/auth/auth_provider.dart';
import 'package:riverpod_guide/application/config/network/error_exception.dart';
import '../../../shared/providers/storage_provider.dart';

class BaseHttpClient {
  final HttpWithMiddleware _client = HttpWithMiddleware.build(
    middlewares: [
      if (kDebugMode) HttpLogger(logLevel: LogLevel.BODY),
    ],
  );
  final String baseUrl;
  final Ref ref;

  BaseHttpClient(
    this.ref,
    this.baseUrl,
  );

  String _paramsToString(Map<String, dynamic>? params) {
    if (params == null) {
      return "";
    }
    return Uri(
      queryParameters: params.map(
        (key, value) => MapEntry(key, value?.toString()),
      ),
    ).query;
  }

  String? _getToken() {
    final pref = ref.watch(sharedPreferencesProvider);
    return pref.getString('token');
  }

  Either<NetworkException, Map<String, dynamic>> _handleResponse(
    http.Response response,
  ) {
    final Either<NetworkException, Map<String, dynamic>> dataOrError =
        switch (response.statusCode) {
      >= 200 && <= 299 => right(jsonDecode(response.body)),
      HttpStatus.unauthorized => left(_setUnauthorized()),
      HttpStatus.notFound =>
        left(const NetworkException.notFound('Not found exception')),
      HttpStatus.internalServerError =>
        left(const NetworkException.serverError('Internal server error')),
      _ => left(const NetworkException.unknown('Unknown network error')),
    };
    return dataOrError;
  }

  NetworkException _setUnauthorized() {
    ref.read(authStateNotifierProvider.notifier).setUnAuthorized();
    return const NetworkException.unauthorized('Unauthorized error');
  }

  Future<Either<NetworkException, Map<String, dynamic>>> get(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    final token = _getToken();
    final url = Uri.parse('$baseUrl$path?${_paramsToString(queryParams)}');
    final response = await _client.get(url, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: token != null ? "Bearer $token" : "",
    });
    return _handleResponse(response);
  }

  Future<Either<NetworkException, Map<String, dynamic>>> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    final token = _getToken();
    final url = Uri.parse('$baseUrl$path');
    final response = await _client.post(url, body: jsonEncode(body), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: token != null ? "Bearer $token" : "",
    });
    return _handleResponse(response);
  }
}
