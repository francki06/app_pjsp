class Article_model {
  int id;
  String text;
  Article_model({
    this.id,
    this.text,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'n_article': id,
      'text_article': text,
    };
    return map;
  }

  Article_model.fromMap(Map<String, dynamic> map) {
    id = map['n_article'];
    text = map['text_article'];
  }
}
