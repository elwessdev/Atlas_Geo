class Country {
  final String name;
  final String capital;
  final int population; // number of inhabitants
  final int area; // km2
  final String languages;
  final String flag; // emoji or asset path

  const Country({
    required this.name,
    required this.capital,
    required this.population,
    required this.area,
    required this.languages,
    required this.flag,
  });
}
