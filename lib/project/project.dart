library project;

class Project {
  String id;
  String name;

  Project(this.id, this.name);

  Map<String, dynamic> toJson() => <String, dynamic>{
    "id": id,
    "name": name,
  };

  Project.fromJson(Map<String, dynamic> json) : this(
    json['_id'],
    json['name']
  );
}
