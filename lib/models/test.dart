/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
    Test({
        required this.total,
        required this.limit,
        required this.skip,
        required this.users,
    });

    int total;
    int limit;
    int skip;
    List<User> users;

    factory Test.fromJson(Map<dynamic, dynamic> json) => Test(
        total: json["total"],
        limit: json["limit"],
        skip: json["skip"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "skip": skip,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class User {
    User({
        required this.lastName,
        required this.role,
        required this.gender,
        required this.university,
        required this.maidenName,
        required this.ein,
        required this.ssn,
        required this.bloodGroup,
        required this.password,
        required this.hair,
        required this.bank,
        required this.eyeColor,
        required this.company,
        required this.id,
        required this.email,
        required this.height,
        required this.image,
        required this.address,
        required this.ip,
        required this.weight,
        required this.userAgent,
        required this.birthDate,
        required this.crypto,
        required this.firstName,
        required this.macAddress,
        required this.phone,
        required this.age,
        required this.username,
    });

    String lastName;
    Role role;
    Gender gender;
    String university;
    String maidenName;
    String ein;
    String ssn;
    String bloodGroup;
    String password;
    Hair hair;
    Bank bank;
    String eyeColor;
    Company company;
    int id;
    String email;
    double height;
    String image;
    Address address;
    String ip;
    double weight;
    String userAgent;
    String birthDate;
    Crypto crypto;
    String firstName;
    String macAddress;
    String phone;
    int age;
    String username;

    factory User.fromJson(Map<dynamic, dynamic> json) => User(
        lastName: json["lastName"],
        role: roleValues.map[json["role"]]!,
        gender: genderValues.map[json["gender"]]!,
        university: json["university"],
        maidenName: json["maidenName"],
        ein: json["ein"],
        ssn: json["ssn"],
        bloodGroup: json["bloodGroup"],
        password: json["password"],
        hair: Hair.fromJson(json["hair"]),
        bank: Bank.fromJson(json["bank"]),
        eyeColor: json["eyeColor"],
        company: Company.fromJson(json["company"]),
        id: json["id"],
        email: json["email"],
        height: json["height"]?.toDouble(),
        image: json["image"],
        address: Address.fromJson(json["address"]),
        ip: json["ip"],
        weight: json["weight"]?.toDouble(),
        userAgent: json["userAgent"],
        birthDate: json["birthDate"],
        crypto: Crypto.fromJson(json["crypto"]),
        firstName: json["firstName"],
        macAddress: json["macAddress"],
        phone: json["phone"],
        age: json["age"],
        username: json["username"],
    );

    Map<dynamic, dynamic> toJson() => {
        "lastName": lastName,
        "role": roleValues.reverse[role],
        "gender": genderValues.reverse[gender],
        "university": university,
        "maidenName": maidenName,
        "ein": ein,
        "ssn": ssn,
        "bloodGroup": bloodGroup,
        "password": password,
        "hair": hair.toJson(),
        "bank": bank.toJson(),
        "eyeColor": eyeColor,
        "company": company.toJson(),
        "id": id,
        "email": email,
        "height": height,
        "image": image,
        "address": address.toJson(),
        "ip": ip,
        "weight": weight,
        "userAgent": userAgent,
        "birthDate": birthDate,
        "crypto": crypto.toJson(),
        "firstName": firstName,
        "macAddress": macAddress,
        "phone": phone,
        "age": age,
        "username": username,
    };
}

class Address {
    Address({
        required this.country,
        required this.address,
        required this.city,
        required this.postalCode,
        required this.coordinates,
        required this.stateCode,
        required this.state,
    });

    Country country;
    String address;
    String city;
    String postalCode;
    Coordinates coordinates;
    String stateCode;
    String state;

    factory Address.fromJson(Map<dynamic, dynamic> json) => Address(
        country: countryValues.map[json["country"]]!,
        address: json["address"],
        city: json["city"],
        postalCode: json["postalCode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        stateCode: json["stateCode"],
        state: json["state"],
    );

    Map<dynamic, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "address": address,
        "city": city,
        "postalCode": postalCode,
        "coordinates": coordinates.toJson(),
        "stateCode": stateCode,
        "state": state,
    };
}

class Coordinates {
    Coordinates({
        required this.lng,
        required this.lat,
    });

    double lng;
    double lat;

    factory Coordinates.fromJson(Map<dynamic, dynamic> json) => Coordinates(
        lng: json["lng"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
    );

    Map<dynamic, dynamic> toJson() => {
        "lng": lng,
        "lat": lat,
    };
}

enum Country { UNITED_STATES }

final countryValues = EnumValues({
    "United States": Country.UNITED_STATES
});

class Bank {
    Bank({
        required this.iban,
        required this.cardExpire,
        required this.cardType,
        required this.currency,
        required this.cardNumber,
    });

    String iban;
    String cardExpire;
    String cardType;
    String currency;
    String cardNumber;

    factory Bank.fromJson(Map<dynamic, dynamic> json) => Bank(
        iban: json["iban"],
        cardExpire: json["cardExpire"],
        cardType: json["cardType"],
        currency: json["currency"],
        cardNumber: json["cardNumber"],
    );

    Map<dynamic, dynamic> toJson() => {
        "iban": iban,
        "cardExpire": cardExpire,
        "cardType": cardType,
        "currency": currency,
        "cardNumber": cardNumber,
    };
}

class Company {
    Company({
        required this.address,
        required this.name,
        required this.department,
        required this.title,
    });

    Address address;
    String name;
    String department;
    String title;

    factory Company.fromJson(Map<dynamic, dynamic> json) => Company(
        address: Address.fromJson(json["address"]),
        name: json["name"],
        department: json["department"],
        title: json["title"],
    );

    Map<dynamic, dynamic> toJson() => {
        "address": address.toJson(),
        "name": name,
        "department": department,
        "title": title,
    };
}

class Crypto {
    Crypto({
        required this.wallet,
        required this.coin,
        required this.network,
    });

    Wallet wallet;
    Coin coin;
    Network network;

    factory Crypto.fromJson(Map<dynamic, dynamic> json) => Crypto(
        wallet: walletValues.map[json["wallet"]]!,
        coin: coinValues.map[json["coin"]]!,
        network: networkValues.map[json["network"]]!,
    );

    Map<dynamic, dynamic> toJson() => {
        "wallet": walletValues.reverse[wallet],
        "coin": coinValues.reverse[coin],
        "network": networkValues.reverse[network],
    };
}

enum Coin { BITCOIN }

final coinValues = EnumValues({
    "Bitcoin": Coin.BITCOIN
});

enum Network { ETHEREUM_ERC20 }

final networkValues = EnumValues({
    "Ethereum (ERC20)": Network.ETHEREUM_ERC20
});

enum Wallet { THE_0_XB9_FC2_FE63_B2_A6_C003_F1_C324_C3_BFA53259162181_A }

final walletValues = EnumValues({
    "0xb9fc2fe63b2a6c003f1c324c3bfa53259162181a": Wallet.THE_0_XB9_FC2_FE63_B2_A6_C003_F1_C324_C3_BFA53259162181_A
});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({
    "female": Gender.FEMALE,
    "male": Gender.MALE
});

class Hair {
    Hair({
        required this.color,
        required this.type,
    });

    String color;
    Type type;

    factory Hair.fromJson(Map<dynamic, dynamic> json) => Hair(
        color: json["color"],
        type: typeValues.map[json["type"]]!,
    );

    Map<dynamic, dynamic> toJson() => {
        "color": color,
        "type": typeValues.reverse[type],
    };
}

enum Type { CURLY, STRAIGHT, WAVY, KINKY }

final typeValues = EnumValues({
    "Curly": Type.CURLY,
    "Kinky": Type.KINKY,
    "Straight": Type.STRAIGHT,
    "Wavy": Type.WAVY
});

enum Role { ADMIN, MODERATOR, USER }

final roleValues = EnumValues({
    "admin": Role.ADMIN,
    "moderator": Role.MODERATOR,
    "user": Role.USER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
