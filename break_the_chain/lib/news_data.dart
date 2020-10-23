import 'networking.dart';

const newsAPIIndia =
    "http://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=71ad51a827344c628fbde1ba273af6be";
const newsAPIUSA =
    "http://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=71ad51a827344c628fbde1ba273af6be";
const newsAPIUK =
    "http://newsapi.org/v2/top-headlines?country=gb&category=health&apiKey=71ad51a827344c628fbde1ba273af6be";
const newsAPIAus =
    "http://newsapi.org/v2/top-headlines?country=au&category=health&apiKey=71ad51a827344c628fbde1ba273af6be";

class NewsDataModel {
  Future<dynamic> getNews() async {
    Network netIndia = Network(url: newsAPIIndia);
    Network netUSA = Network(url: newsAPIUSA);
    Network netUK = Network(url: newsAPIUK);
    Network netAus = Network(url: newsAPIAus);
    dynamic indiaNews = await netIndia.getData();
    dynamic usaNews = await netUSA.getData();
    dynamic ukNews = await netUK.getData();
    dynamic ausNews = await netAus.getData();
    dynamic articles = indiaNews["articles"];
    articles.addAll(usaNews["articles"]);
    articles.addAll(ukNews["articles"]);
    articles.addAll(ausNews["articles"]);
    return articles;
  }
}
