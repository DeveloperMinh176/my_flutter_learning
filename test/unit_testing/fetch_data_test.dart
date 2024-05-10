import 'dart:io';
import 'package:flutter_learn/beyond_ui/networking_http/fetch_data.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_data.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient();
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((realInvocation) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));
      expect(await fetchAlbum(client), isA<Album>());
    });
    test('returns an exception if the http call completes with an error',
        () async {
      final client = MockClient();
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer(
              (realInvocation) async => http.Response('Not Found', 404));
      expect(fetchAlbum(client), throwsException);
    });
  });
}
