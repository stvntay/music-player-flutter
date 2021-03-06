// Mocks generated by Mockito 5.0.15 from annotations
// in music_playlist/test/service/http_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:dio/dio.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:music_playlist/utils/services/http/http_service.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [HttpService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpService extends _i1.Mock implements _i2.HttpService {
  MockHttpService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> post(
          {String? path,
          Map<String, dynamic>? param,
          Function? preExecute,
          _i4.Options? options,
          Map<String, dynamic>? query,
          dynamic Function(dynamic)? onSuccess,
          dynamic Function(dynamic)? onError,
          dynamic Function(dynamic)? onFailure}) =>
      (super.noSuchMethod(
          Invocation.method(#post, [], {
            #path: path,
            #param: param,
            #preExecute: preExecute,
            #options: options,
            #query: query,
            #onSuccess: onSuccess,
            #onError: onError,
            #onFailure: onFailure
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<dynamic> get(
          {String? path, Map<String, dynamic>? query, _i4.Options? options}) =>
      (super.noSuchMethod(
          Invocation.method(
              #get, [], {#path: path, #query: query, #options: options}),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  String toString() => super.toString();
}
