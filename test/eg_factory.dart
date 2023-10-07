class MyClass {
  final int value;

  // 私有构造函数
  MyClass._(this.value);

  // 工厂构造函数，返回一个新的MyClass实例
  factory MyClass(int value) {
    return MyClass._(value * 2);
  }

  // 工厂构造函数，返回一个String对象
  factory MyClass.fromString(String str) {
    final value = int.parse(str);
    return MyClass._(value);
  }

  // 工厂构造函数，返回一个已存在的MyClass实例
  factory MyClass.fromExisting(MyClass existing) {
    return MyClass._(existing.value);
  }

  @override
  String toString() {
    return 'MyClass($value)';
  }
}
