class TaskModel {
  String title;
  String description;
  String date;

  TaskModel({this.title = '' ,
   this.date = '' ,
    this.description = '' });

     TaskModel.fromJson(Map json) : title = json['title'] ,
      description = json['desc'] ,
       date = json['date'];

}
