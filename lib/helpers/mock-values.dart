import 'package:haggle_clone/models/countries.dart';

class DashBoardMockClass {
  String icon;
  String graph;
  String currency;
  String price;
  String percentage;
  String abbr;
  String name;

  DashBoardMockClass(
      {this.icon,
      this.graph,
      this.abbr,
      this.currency,
      this.name,
      this.percentage,
      this.price});

  static List<DashBoardMockClass> get getData => [
        DashBoardMockClass(
            icon: 'assets/images/bitcoin.png',
            graph: 'assets/images/hagglegraph.png',
            abbr: "HAG",
            name: "Haggle",
            currency: "NGN",
            price: "380",
            percentage: ""),
        DashBoardMockClass(
            icon: 'assets/images/usdt.png',
            graph: 'assets/images/tethergraph.png',
            abbr: "USDT",
            name: "Tether",
            currency: "NGN",
            price: "4,272,147.00",
            percentage: "+2.34%"),
        DashBoardMockClass(
            icon: 'assets/images/bitcoin.png',
            graph: 'assets/images/butcoin-graph.png',
            abbr: "BTC",
            name: "Bitcoin",
            currency: "NGN",
            price: "4,272,147.00",
            percentage: "+2.34%"),
        DashBoardMockClass(
            icon: 'assets/images/usdt.png',
            graph: 'assets/images/tethergraph.png',
            abbr: "USDT",
            name: "Tether",
            currency: "NGN",
            price: "4,272,147.00",
            percentage: "+2.34%"),
        DashBoardMockClass(
            icon: 'assets/images/bitcoin.png',
            graph: 'assets/images/butcoin-graph.png',
            abbr: "BTC",
            name: "Bitcoin",
            currency: "NGN",
            price: "4,272,147.00",
            percentage: "+2.34%"),
      ];

  static GetActiveCountries getDefaultValue() {
    return new GetActiveCountries(
      sId: "6043da73e5e71f0015b5c661",
      name: "Nigeria",
      alpha2Code: "NG",
      alpha3Code: "NGA",
      region: "Africa",
      currencyCode: "NGN",
      callingCode: "234",
      hasRate: true,
      flag: "https://restcountries.eu/data/nga.svg",
    ); //set nigeria as default
  }
}
