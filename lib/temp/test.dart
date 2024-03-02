import 'dart:core';

class Point {
  int? x;
  static int? _cache;
  // The main constructor for this class.
  Point({x = const <int>[]});
}

class X extends Point {
  X({super.x}) {}
}

Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

abstract class Person {
  final String _name = 'as';
  Person();
  Person.ag(String a);
  void abc() {}
}

class Impostor extends Person {
  String get _name => 's';
  void a() {}
}

mixin Shape {
  int a = 6;

  void x() {
    print(a);
  }
}

class a with Shape {}

abstract base class Square {}

class Circle with Shape {}

class Vector2d {}

class Vector3d extends Vector2d {
  // ...
  final double z;
  // Forward the y parameter to the named super constructor like:
  // Vector3d.yzPlane({required double y, required this.z})
  //       : super.named(x: 0, y: y);
  Vector3d.yzPlane(this.z) {}
}

({int untyped, String typed}) record = (untyped: 1, typed: 's');

class Shape1 {
  final x, y;
  Shape1(this.x, this.y);
}

void d([int? a]) {
  var (:untyped, :typed) = record;
  Shape1 shape = Shape1(2, 3);
  switch (shape) {
    // Matches if shape is of type Rect, and then against the properties of Rect.
    case Shape1(x: var e, y: var g): // ...
  }
}

void xyz([int? a]) {}

void main() {
  final planets = <int, String>{1: 'Mercury', 2: 'Earth'};

  final gasGiants = <int, String>{5: 'Jupiter', 6: 'Saturn'};
  final iceGiants = <int, String>{7: 'Uranus', 8: 'Neptune'};
  planets.addEntries(iceGiants.entries);
  print(planets);
  print(iceGiants.entries);
  xyz(5);
  var p = Point(x: 3);
  var Point(:x) = p;
  print(x);
  // Hàm addNumbers nhận vào hai số và một hàm gọi lại để xử lý kết quả
  void addNumbers(int a, int b, Function(int) callback) {
    int result = a + b;
    // Gọi hàm gọi lại và truyền kết quả result cho nó
    callback(result);
  }

  // Gọi hàm addNumbers và truyền một hàm gọi lại để xử lý kết quả
  addNumbers(5, 3, (result) {
    print('Tổng của hai số là: $result');
  });
  var i = Impostor();
  print(i.a);
  int c = 3;

  Circle d = Circle();
  d.x();

  var (n, y) = (5, 4);

  int v = 5;
  var k1 = {1, 3, '31', 3, 'x', '31'};
  var k = [1, 2, 3, '4', v, k1];

  print(k1);
  print(k);

  var l = Iterable.generate(3);
  //l.add(1);// Error
  print(l);
  var l1 = List.of(l);
  print(l1);
  List<int> generatedNumbers =
      List.generate(5, (_) => _ * _); // [0, 1, 4, 9, 16]
  print(generatedNumbers);

  var originalList = [1, 2, 3];

  var listFrom = List.from(originalList);
  listFrom[0] = 10; // OK, listFrom is now [10, 2, 3]
  print(listFrom);
  var listOf = List.of(originalList);
  listOf[0] = 10;

  print(listOf);
  List<int> original = [1, 2, 3];
  //List<String> stringList = List.from(original);

  var ints = <int>[0];
  var newList1 = ints.toList(); // List<int>
  var newList2 = List<num>.of(ints); // List<num>
  var isnts = List<int>.from(<num>[0, 1]);
  //var intgs = List<int>.from(<num>[0, 1.5]);

  var se = {1, 2, 4, '3'};
  String s = "1";
  num g = 3;

  var set = Set.from(se);

  print(set.elementAt(3));

  var map = {1: '2', 2: '3'};
  print(map.values);

  final numbers = ['v', 'ones', 'one', 'three', 'four'];
  numbers.sort();
  print(numbers);
  int i3 = 1;
  print(++i3);
  for (int i = 0; i < 2; ++i) {
    print(i);
  }

// Throws an error: Unsupported operation: Cannot modify an unmodifiable list
}
