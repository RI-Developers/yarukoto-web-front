library user;

class User {
  String username;
  String password;


  User() {

  }


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
