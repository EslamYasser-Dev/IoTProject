class Loginm {
  String? timestamp;
  int? id;
  String? factoryId,
  factoryName,
 factoryContactPerson,
 factoryContactPhone,
 factoryAddres,
  password;

  Loginm(
      {this.timestamp,
      this.id,
      this.factoryId,
      this.factoryName,
      this.factoryContactPerson,
      this.factoryContactPhone,
      this.factoryAddres,
      this.password});

  Loginm.fromJson(Map<String, dynamic> json) {
    timestamp = json['Timestamp'];
    id = json['id'];
    factoryId = json['FactoryId'];
    factoryName = json['FactoryName'];
    factoryContactPerson = json['FactoryContactPerson'];
    factoryContactPhone = json['FactoryContact Phone'];
    factoryAddres = json['FactoryAddres'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Timestamp'] = this.timestamp;
    data['id'] = this.id;
    data['FactoryId'] = this.factoryId;
    data['FactoryName'] = this.factoryName;
    data['FactoryContactPerson'] = this.factoryContactPerson;
    data['FactoryContact Phone'] = this.factoryContactPhone;
    data['FactoryAddres'] = this.factoryAddres;
    data['password'] = this.password;
    return data;
  }
}
