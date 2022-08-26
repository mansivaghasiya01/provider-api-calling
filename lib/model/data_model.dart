import 'dart:convert';

List<BeerModel> userResponse(String str) =>
    List<BeerModel>.from(jsonDecode(str).map((x) => BeerModel.fromJson(x)));

class BeerModel {
  int id;
  String name;
  String tagline;
  String firstBrewed;
  String description;
  String imageUrl;
  double abv;
  double ibu;
  int targetFg;
  double targetOg;
  int? ebc;
  double? srm;
  double ph;
  double attenuationLevel;
  Volume? volume;
  Volume? boilVolume;
  Method? method;
  Ingredients? ingredients;
  List<String>? foodPairing;
  String brewersTips;
  String contributedBy;

  BeerModel(
      {this.id = 0,
      this.name = '',
      this.tagline = '',
      this.firstBrewed = '',
      this.description = '',
      this.imageUrl = '',
      this.abv = 0.0,
      this.ibu = 0.0,
      this.targetFg = 0,
      this.targetOg = 0.0,
      this.ebc,
      this.srm,
      this.ph = 0.0,
      this.attenuationLevel = 0.0,
      this.volume,
      this.boilVolume,
      this.method,
      this.ingredients,
      this.foodPairing,
      this.brewersTips = '',
      this.contributedBy = ''});

  factory BeerModel.fromJson(Map<String, dynamic> json) {
    return BeerModel(
      id: json['id'],
      name: json['name'],
      tagline: json['tagline'],
      firstBrewed: json['first_brewed'],
      description: json['description'],
      imageUrl: json['image_url'],
      abv: double.parse(
        json['abv'].toString(),
      ),
      ibu: json['ibu'] == null
          ? 0
          : double.parse(
              json['ibu'].toString(),
            ),
      targetFg: json['target_fg'],
      targetOg: double.parse(
        json['target_og'].toString(),
      ),
      ebc: json['ebc'],
      // srm: double.parse(json['srm'].toString()),
      srm: json['srm'] == null
          ? 0
          : double.parse(
              json['srm'].toString(),
            ),
      ph: json['ph'] == null
          ? 0
          : double.parse(
              json['ph'].toString(),
            ),
      attenuationLevel: double.parse(
        json['attenuation_level'].toString(),
      ),
      volume: Volume.fromJson(
        json['volume'],
      ),
      boilVolume: Volume.fromJson(
        json['boil_volume'],
      ),
      method: Method.fromJson(
        json['method'],
      ),
      ingredients: Ingredients.fromJson(
        json['ingredients'],
      ),
      foodPairing: json['food_pairing'].cast<String>(),
      brewersTips: json['brewers_tips'],
      contributedBy: json['contributed_by'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['tagline'] = tagline;
    data['first_brewed'] = firstBrewed;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['abv'] = abv;
    data['ibu'] = ibu;
    data['target_fg'] = targetFg;
    data['target_og'] = targetOg;
    data['ebc'] = ebc;
    data['srm'] = srm;
    data['ph'] = ph;
    data['attenuation_level'] = attenuationLevel;
    data['volume'] = volume!.toJson();
    data['boil_volume'] = boilVolume!.toJson();
    data['method'] = method!.toJson();
    data['ingredients'] = ingredients!.toJson();
    data['food_pairing'] = foodPairing;
    data['brewers_tips'] = brewersTips;
    data['contributed_by'] = contributedBy;
    return data;
  }
}

class Volume {
  int value;
  String unit;

  Volume({this.value = 0, this.unit = ''});

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      value: json['value'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    return data;
  }
}

class Method {
  List<MashTemp>? mashTemp;
  Fermentation? fermentation;
  String? twist;

  Method({this.mashTemp, this.fermentation, this.twist});

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      mashTemp:
          (json["mash_temp"] as List).map((e) => MashTemp.fromJson(e)).toList(),
      fermentation: Fermentation.fromJson(
        json['fermentation'],
      ),
      twist: json['twist'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mashTemp != null) {
      data['mash_temp'] = mashTemp!.map((v) => v.toJson()).toList();
    }
    if (fermentation != null) {
      data['fermentation'] = fermentation!.toJson();
    }
    data['twist'] = twist;
    return data;
  }
}

class MashTemp {
  Volume? temp;
  int? duration;

  MashTemp({this.temp, this.duration = 0});

  factory MashTemp.fromJson(Map<String, dynamic> json) {
    return MashTemp(
      temp: json['temp'] != null ? Volume.fromJson(json['temp']) : null,
      duration:
          json['duration'] == null ? 0 : int.parse(json["duration"].toString()),
      //duration: json["duration"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }
    data['duration'] = duration;
    return data;
  }
}

class Fermentation {
  Volume? temp;

  Fermentation({this.temp});

  factory Fermentation.fromJson(Map<String, dynamic> json) {
    return Fermentation(temp: Volume.fromJson(json['temp']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp!.toJson();
    return data;
  }
}

class Ingredients {
  List<Malt>? malt;
  List<Hops>? hops;
  String? yeast;

  Ingredients({this.malt, this.hops, this.yeast});

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      malt: (json["malt"] as List).map((e) => Malt.fromJson(e)).toList(),
      hops: (json["hops"] as List).map((e) => Hops.fromJson(e)).toList(),
      yeast: json['yeast'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (malt != null) {
      data['malt'] = malt!.map((v) => v.toJson()).toList();
    }
    if (hops != null) {
      data['hops'] = hops!.map((v) => v.toJson()).toList();
    }
    data['yeast'] = yeast;
    return data;
  }
}

class Malt {
  String? name;
  Amount? amount;

  Malt({this.name, this.amount});

  factory Malt.fromJson(Map<String, dynamic> json) {
    return Malt(
        name: json['name'],
        amount:
            json['amount'] != null ? Amount.fromJson(json['amount']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (amount != null) {
      data['amount'] = amount!.toJson();
    }
    return data;
  }
}

class Amount {
  double value;
  String unit;

  Amount({this.value = 0.0, this.unit = ""});

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      value: double.parse(json["value"].toString()),
      //value: json['value'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['unit'] = unit;
    return data;
  }
}

class Hops {
  String name;
  Amount amount;
  String add;
  String attribute;

  Hops(
      {this.name = "",
      required this.amount,
      this.add = "",
      this.attribute = ""});

  factory Hops.fromJson(Map<String, dynamic> json) {
    return Hops(
        name: json['name'],
        amount: Amount.fromJson(json['amount']),
        add: json['add'],
        attribute: json['attribute']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['amount'] = amount.toJson();
    data['add'] = add;
    data['attribute'] = attribute;
    return data;
  }
}
