import 'dart:convert';

class Cat{
 String id;
  String title;
  Cat({this.id= '0',this.title});

    factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json["id"],
        title: json["title"]
     
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title
   
      };

//////////////////////////////// هنا يجب عليك تغيير المتغيرات حسب الكلاس الجديد
  @override
  String toString() {
    return 'Cat{id: $id, title: $title}';
  }
}

List<Cat> catFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Cat>.from(data.map((item) => Cat.fromJson(item)));
}



String catToJson(Cat data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
