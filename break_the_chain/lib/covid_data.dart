import 'networking.dart';

const indiaCovidStatURL = 'https://api.covid19india.org/data.json';
const stateURL = 'https://api.covid19india.org/state_district_wise.json#';

class CovidDataModel {
  Future<dynamic> getIndiaStat() async {
    Network net = Network(url: indiaCovidStatURL);
    return await net.getData();
  }

  Future<dynamic> getDistrictStat() async {
    Network net = Network(url: stateURL);
    return await net.getData();
  }
}
