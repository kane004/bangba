class ApiConfig {
  // 生产环境接口地址
  static const String productionBaseUrl = 'https://api.example.com';

  // 测试环境接口地址
  static const String testBaseUrl = 'http://114.132.44.108:8083';

  // 根据环境选择使用的接口地址
  static String get baseUrl {
    if (isProductionEnvironment) {
      return productionBaseUrl;
    } else {
      return testBaseUrl;
    }
  }

  // 判断当前是否为生产环境
  static bool get isProductionEnvironment {
    // 在这里添加您判断环境的逻辑，例如根据编译模式判断
    // 这里的示例逻辑是假设在生产模式下为真，其他情况为假
    return const bool.fromEnvironment('dart.vm.product');
  }

  // 如果有不同的接口路径，可以继续添加
  static const String loginPath = '/login';
  static const String userDataPath = '/user';
}
