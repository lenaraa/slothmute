class SlothData {
  String name = "";
  String latinName = "";
  String animalType = "";
  String activeTime = "";
  String lengthMin = "";
  String lengthMax = "";
  String weightMin = "";
  String weightMax = "";
  String lifespan = "";
  String habitat = "";
  String diet = "";
  String geoRange = "";
  String imageLink = "";
  int id = -1;

  SlothData(
      {required this.name,
        required this.latinName,
        required this.animalType,
        required this.activeTime,
        required this.lengthMin,
        required this.lengthMax,
        required this.weightMin,
        required this.weightMax,
        required this.lifespan,
        required this.habitat,
        required this.diet,
        required this.geoRange,
        required this.imageLink,
        required this.id});

  SlothData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    latinName = json['latin_name'];
    animalType = json['animal_type'];
    activeTime = json['active_time'];
    lengthMin = json['length_min'];
    lengthMax = json['length_max'];
    weightMin = json['weight_min'];
    weightMax = json['weight_max'];
    lifespan = json['lifespan'];
    habitat = json['habitat'];
    diet = json['diet'];
    geoRange = json['geo_range'];
    imageLink = json['image_link'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['latin_name'] = this.latinName;
    data['animal_type'] = this.animalType;
    data['active_time'] = this.activeTime;
    data['length_min'] = this.lengthMin;
    data['length_max'] = this.lengthMax;
    data['weight_min'] = this.weightMin;
    data['weight_max'] = this.weightMax;
    data['lifespan'] = this.lifespan;
    data['habitat'] = this.habitat;
    data['diet'] = this.diet;
    data['geo_range'] = this.geoRange;
    data['image_link'] = this.imageLink;
    data['id'] = this.id;
    return data;
  }
}
