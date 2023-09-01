class Config {
  final String? baseUrl;

  static Config? _instance;

  factory Config({
    String? baseUrl,
  }) =>
      _instance ??= Config._(
        baseUrl: baseUrl,
      );

  Config._({
    this.baseUrl,
  });
}
