class CountriesList {
  Data data;

  CountriesList({this.data});

  CountriesList.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<GetActiveCountries> getActiveCountries;

  Data({this.getActiveCountries});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['getActiveCountries'] != null) {
      // ignore: deprecated_member_use
      getActiveCountries = new List<GetActiveCountries>();
      json['getActiveCountries'].forEach((v) {
        getActiveCountries.add(new GetActiveCountries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getActiveCountries != null) {
      data['getActiveCountries'] =
          this.getActiveCountries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetActiveCountries {
  String sId;
  String name;
  String alpha2Code;
  String alpha3Code;
  String region;
  String currencyCode;
  String callingCode;
  bool hasRate;
  String flag;

  GetActiveCountries(
      {this.sId,
      this.name,
      this.alpha2Code,
      this.alpha3Code,
      this.region,
      this.currencyCode,
      this.callingCode,
      this.hasRate,
      this.flag});

  GetActiveCountries.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    alpha2Code = json['alpha2Code'];
    alpha3Code = json['alpha3Code'];
    region = json['region'];
    currencyCode = json['currencyCode'];
    callingCode = json['callingCode'];
    hasRate = json['hasRate'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['alpha2Code'] = this.alpha2Code;
    data['alpha3Code'] = this.alpha3Code;
    data['region'] = this.region;
    data['currencyCode'] = this.currencyCode;
    data['callingCode'] = this.callingCode;
    data['hasRate'] = this.hasRate;
    data['flag'] = this.flag;
    return data;
  }
}

// import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable(nullable: false)
// class Country {
//   String id;
//   String name;
//   String alpha2Code;
//   String alpha3Code;
//   String region;
//   // CurrencyDetails currencyDetails;
//   String currencyCode;
//   String callingCode;
//   bool hasRate;
//   String flag;

//   Country(
//       this.id,
//       this.name,
//       this.alpha2Code,
//       this.alpha3Code,
//       this.region,
//       //this.currencyDetails,
//       this.currencyCode,
//       this.callingCode,
//       this.hasRate,
//       this.flag);
//   factory Country.fromJson(Map<String, dynamic> json) {
//     return Country(
//         json['id'],
//         json['name'],
//         json['alpha2code'],
//         json['alpha3code'],
//         json['region'],
//         json['currencyCode'],
//         json['callingCode'],
//         json['hasRate'],
//         json['flag']);
//   }
// }

// @JsonSerializable()
// class CountriesList {
//   List<Country> data;
// }

// @JsonSerializable()
// class CountriesList {
//   List<Country> data;
// }
