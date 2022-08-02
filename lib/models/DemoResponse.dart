class DemoResponse {
  int? totalPassengers;
  int? totalPages;
  List<Data>? data;

  DemoResponse({this.totalPassengers, this.totalPages, this.data});

  DemoResponse.fromJson(Map<String, dynamic> json) {
    totalPassengers = json['totalPassengers'];
    totalPages = json['totalPages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPassengers'] = this.totalPassengers;
    data['totalPages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  int? trips;
  List<Airline>? airline;
  int? iV;

  Data({this.sId, this.name, this.trips, this.airline, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    trips = json['trips'];
    if (json['airline'] != null) {
      airline = <Airline>[];
      json['airline'].forEach((v) {
        airline!.add(new Airline.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['trips'] = this.trips;
    if (this.airline != null) {
      data['airline'] = this.airline!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Airline {
  String? sId;
  int? id;
  String? name;
  String? country;
  String? logo;
  String? slogan;
  String? headQuaters;
  String? website;
  String? established;
  int? iV;

  Airline(
      {this.sId,
      this.id,
      this.name,
      this.country,
      this.logo,
      this.slogan,
      this.headQuaters,
      this.website,
      this.established,
      this.iV});

  Airline.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    slogan = json['slogan'];
    headQuaters = json['head_quaters'];
    website = json['website'];
    established = json['established'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['slogan'] = this.slogan;
    data['head_quaters'] = this.headQuaters;
    data['website'] = this.website;
    data['established'] = this.established;
    data['__v'] = this.iV;
    return data;
  }
}
