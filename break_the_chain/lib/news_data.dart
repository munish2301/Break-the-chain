import 'networking.dart';

const newsAPIIndia =
    "http://newsapi.org/v2/top-headlines?category=health&apiKey=71ad51a827344c628fbde1ba273af6be";

class NewsDataModel {
  Future<dynamic> getNews() async {
    Network netIndia = Network(url: newsAPIIndia);
    dynamic indiaNews = await netIndia.getData();
    dynamic articles = indiaNews["articles"];
    return articles;
  }
}
