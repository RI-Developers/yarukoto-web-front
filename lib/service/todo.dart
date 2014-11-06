library todo;

class Todo {
  String id;
  String author_name;
  String title;
  bool finished;
  String c_date;
  String s_s_date;
  String s_f_date;
  String f_date;

  Todo(this.id, this.author_name, this.title, this.finished,
       this.c_date, this.s_s_date, this.s_f_date, this.f_date);

  Map<String, dynamic> toJson() => <String, dynamic>{
    "id": id,
    "author_name": author_name,
    "title": title,
    "finished": finished,
    "c_date": c_date,
    "s_s_date": s_s_date,
    "s_f_date": s_f_date,
    "f_date": f_date
  };

  Todo.fromJson(Map<String, dynamic> json) : this(
    json['_id'],
    json['author_name'],
    json['title'],
    json['finished'],
    json['c_date'],
    json['s_s_date'],
    json['s_f_date'],
    json['f_date']
  );
}
