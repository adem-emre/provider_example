class JokeResponse {
  final bool? error;
  final int? amount;
  final List<Jokes>? jokes;

  JokeResponse({
    this.error,
    this.amount,
    this.jokes,
  });

  JokeResponse.fromJson(Map<String, dynamic> json)
    : error = json['error'] as bool?,
      amount = json['amount'] as int?,
      jokes = (json['jokes'] as List?)?.map((dynamic e) => Jokes.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'error' : error,
    'amount' : amount,
    'jokes' : jokes?.map((e) => e.toJson()).toList()
  };
}

class Jokes {
  final String? category;
  final String? type;
  final String? joke;
  final Flags? flags;
  final int? id;
  final bool? safe;
  final String? lang;
  bool isFavourite=false;

  Jokes({
    this.category,
    this.type,
    this.joke,
    this.flags,
    this.id,
    this.safe,
    this.lang,
  });

  Jokes.fromJson(Map<String, dynamic> json)
    : category = json['category'] as String?,
      type = json['type'] as String?,
      joke = json['joke'] as String?,
      flags = (json['flags'] as Map<String,dynamic>?) != null ? Flags.fromJson(json['flags'] as Map<String,dynamic>) : null,
      id = json['id'] as int?,
      safe = json['safe'] as bool?,
      lang = json['lang'] as String?;

  Map<String, dynamic> toJson() => {
    'category' : category,
    'type' : type,
    'joke' : joke,
    'flags' : flags?.toJson(),
    'id' : id,
    'safe' : safe,
    'lang' : lang
  };
}

class Flags {
  final bool? nsfw;
  final bool? religious;
  final bool? political;
  final bool? racist;
  final bool? sexist;
  final bool? explicit;

  Flags({
    this.nsfw,
    this.religious,
    this.political,
    this.racist,
    this.sexist,
    this.explicit,
  });

  Flags.fromJson(Map<String, dynamic> json)
    : nsfw = json['nsfw'] as bool?,
      religious = json['religious'] as bool?,
      political = json['political'] as bool?,
      racist = json['racist'] as bool?,
      sexist = json['sexist'] as bool?,
      explicit = json['explicit'] as bool?;

  Map<String, dynamic> toJson() => {
    'nsfw' : nsfw,
    'religious' : religious,
    'political' : political,
    'racist' : racist,
    'sexist' : sexist,
    'explicit' : explicit
  };
}