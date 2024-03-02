import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

final myImage = Image(
  image: NetworkImage('abc'),
  fit: BoxFit.contain,
  width: 200,
  height: 200,
  semanticLabel: 'abc',
  loadingBuilder: (context, child, loadingProgress) {
    return Text('abc');
  },
  color: Colors.amber,
  colorBlendMode: BlendMode.darken,
);

final myImageAsset = Image.asset(
  'abc',
  fit: BoxFit.contain,
  width: 200,
  height: 200,
  semanticLabel: 'abc',
  color: Colors.amber,
  colorBlendMode: BlendMode.darken,
);
Uint8List imageData = Uint8List.fromList([
  137,
  80,
  78,
  71,
  13,
  10,
  26,
  10,
  0,
  0,
  0,
  13,
  73,
  72,
  68,
  82,
  0,
  0,
  0,
  64,
  0,
  0,
  0,
  64,
  8,
  6,
  0,
  0,
  0,
  160,
  191,
  38,
  216,
  0,
  0,
  0,
  4,
  103,
  65,
  77,
  65,
  0,
  0,
  177,
  143,
  11,
  252,
  97,
  5,
  0,
  0,
  0,
  9,
  112,
  72,
  89,
  115,
  0,
  0,
  11,
  19,
  0,
  0,
  11,
  19,
  1,
  0,
  154,
  156,
  24,
  0,
  0,
  0,
  4,
  115,
  66,
  73,
  84,
  8,
  8,
  8,
  8,
  124,
  8,
  100,
  136,
  0,
  0,
  0,
  9,
  118,
  112,
  65,
  103,
  0,
  0,
  10,
  63,
  0,
  0,
  10,
  63,
  1,
  205,
  108,
  26,
  137,
  0,
  0,
  0,
  27,
  116,
  69,
  88,
  116,
  83,
  111,
  102,
  116,
  119,
  97,
  114,
  101,
  0,
  73,
  67,
  67,
  32,
  80,
  114,
  111,
  102,
  105,
  108,
  101,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  255,
  255,
  255,
  165,
  67,
  0,
  1,
  0,
  0,
  0,
  61,
  73,
  68,
  65,
  84,
  120,
  218,
  98,
  252,
  255,
  255,
  255,
  31,
  2,
  4,
  147,
  201,
  8,
  16,
  32,
  64,
  128,
  1,
  131,
  70,
  132,
  134,
  134,
  6,
  11,
  2,
  188,
  44,
  5,
  104,
  35,
  4,
  208,
  55,
  18,
  68,
  168,
  67,
  0,
  9,
  35,
  35,
  35,
  124,
  97,
  6,
  17,
  17,
  17,
  89,
  38,
  194,
  194,
  194,
  28,
  141,
  26,
  24,
  24,
  56,
  98,
  4,
  228,
  73,
  79,
  79,
  223,
  35,
  147,
  147,
  147,
  127,
  50,
  20,
  8,
  193,
  184,
  113,
  226,
  196,
  0,
  20,
  2,
  17,
  14,
  63,
  254,
  249,
  191,
  204,
  10,
  16,
  55,
  5,
  0,
  0,
  0,
  0,
  73,
  69,
  78,
  68,
  174,
  66,
  96,
  130,
]);

final myImageAssetMemory = Image.memory(
  imageData,
  fit: BoxFit.contain,
  width: 200,
  height: 200,
  semanticLabel: 'abc',
  color: Colors.amber,
  colorBlendMode: BlendMode.darken,
);

final myImageAssetFile = Image.file(
  File(
    'abc',
  ),
  fit: BoxFit.contain,
  width: 200,
  height: 200,
  semanticLabel: 'abc',
  color: Colors.amber,
  colorBlendMode: BlendMode.darken,
);

final myImageNetwork = Image.network(
  'abc',
  fit: BoxFit.contain,
  width: 200,
  height: 200,
  semanticLabel: 'abc',
  loadingBuilder: (context, child, loadingProgress) {
    return Text('abc');
  },
  color: Colors.amber,
  colorBlendMode: BlendMode.darken,
);
