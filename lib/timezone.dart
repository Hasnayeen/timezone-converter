class Timezone {
  String name;
  String code;
  double offset;
  String text;

  Timezone({this.name, this.code, this.offset, this.text});

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return new Timezone(
      name: json['value'] as String,
      code: json['abbr'] as String,
      offset: json['offset'] as double,
      text: json['text'] as String,
    );
  }
}
