class MyColor {
  // static final instance = MyColor();
  static final instance = MyColor.init();

  // Factory
  // دا بيتيح ليا أعمل أوبجكت عادي
  factory MyColor() {
    return instance;
  }
  MyColor.init() {}
  // MyColor myColor = new MyColor();
}
