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
}
