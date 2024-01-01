class Country {
  final String? code;
  final String? countryName;
  final String? iso_3166_1_alpha_2;
  final String? iso_3166_1_alpha_3;
  final String? iso_3166_1_numeric_3;
  final String? official_name;
  final String? short_code;
  final String? alternative_names;

  Country(
      {this.code,
      this.countryName,
      this.iso_3166_1_alpha_2,
      this.iso_3166_1_alpha_3,
      this.alternative_names,
      this.iso_3166_1_numeric_3,
      this.official_name,
      this.short_code});
}
