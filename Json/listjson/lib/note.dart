class Note {
  String tittle;
  String text;

  Note(this.tittle, this.text);

  Note.fromJson(Map<String, dynamic> json) {
    tittle = json["title"];
    text = json["text"];
  }
}
