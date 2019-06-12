class InfoMode {
  String createdAt;
  String description;
  int id;
  String newsUrl;
  String title;

  String dateTitle;
  String dateCategory;

  bool isDisplay;
  InfoMode(Map dict){
    createdAt = dict['created_at'];
    description = dict['description'];
    id = dict['id'];
    newsUrl = dict['news_url'];
    isDisplay = false;
    title = dict['title'];
    _dealDate();
  }

  _dealDate()
  { 

    var dateCre = DateTime.parse(createdAt);
    var now =DateTime.now();
    var value = now.difference(dateCre);
    if(now.hour>=value.inHours)
    {
      dateCategory = '今天';
    }
    else if((now.hour+24)>=value.inHours) {
      dateCategory = '昨天';
    }
    else {
      dateCategory = '${dateCre.month.toString()}月${dateCre.day.toString()}日';
    }
    dateTitle = '${dateCre.hour.toString()}:${dateCre.minute.toString()}';
  }

}