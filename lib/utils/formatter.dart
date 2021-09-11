extension CapExtension on String {
  String get capitalFirst => this.length > 0 ?'${this[0].toUpperCase()}${this.substring(1)}':'';
  String get capitalAll => this.toUpperCase();
  String get capitalFirstOfEach => this.replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.capitalFirst).join(" ");
}