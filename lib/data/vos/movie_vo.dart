import 'package:floor/floor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_app_padc/data/vos/collection_vo.dart';
import 'package:the_movie_app_padc/data/vos/genre_vo.dart';
import 'package:the_movie_app_padc/data/vos/production_company_vo.dart';
import 'package:the_movie_app_padc/data/vos/production_country_vo.dart';
import 'package:the_movie_app_padc/data/vos/spoken_language_vo.dart';
import 'package:the_movie_app_padc/network/api_constants.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_app_padc/persistance/hive_constants.dart';
part 'movie_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdMovieVO, adapterName: kAdapterNameMovieVO)
class MovieVO extends HiveObject{
  @JsonKey(name: "adult")
  @HiveField(0)
  // @ColumnInfo(name: "adult")
  bool? adult;

  @JsonKey(name: "backdrop_path")
  @HiveField(1)
  // @ColumnInfo(name: "backdrop_path")
  String? backDropPath;

  @JsonKey(name: "genre_ids")
  @HiveField(2)
  // @ColumnInfo(name:"genre_ids" )
  List<int>? genreIds;

  @JsonKey(name: "id")
  @HiveField(3)
  // @ColumnInfo(name: "id")
  // @PrimaryKey()
  int? id;

  @JsonKey(name: "original_language")
  @HiveField(4)
  // @ColumnInfo(name: "original_language")
  String? originalLanguage;

  @JsonKey(name: "original_title")
  @HiveField(5)
  // @ColumnInfo(name: "original_title")
  String? originalTitle;

  @JsonKey(name: "overview")
  @HiveField(6)
  // @ColumnInfo(name: "overview")
  String? overview;

  @JsonKey(name: "popularity")
  @HiveField(7)
  // @ColumnInfo(name: "popularity")
  double? popularity;

  @JsonKey(name: "poster_path")
  @HiveField(8)
  // @ColumnInfo(name: "poster_path")
  String? posterPath;

  @JsonKey(name: "release_date")
  @HiveField(9)
  // @ColumnInfo(name: "release_date")
  String? releaseDate;

  @JsonKey(name: "title")
  @HiveField(10)
  // @ColumnInfo(name: "title")
  String? title;

  @JsonKey(name: "video")
  @HiveField(11)
  // @ColumnInfo(name: "video")
  bool? video;

  @JsonKey(name: "vote_average")
  @HiveField(12)
  // @ColumnInfo(name: "vote_average")
  double? voteAverage;

  @JsonKey(name: "vote_count")
  @HiveField(13)
  // @ColumnInfo(name: "vote_count")
  int? voteCount;

  /// Movie Detail
  @JsonKey(name: "belongs_to_collection")
  @HiveField(14)
  // @ColumnInfo(name: "belongs_to_collection")
  CollectionVO? belongsToCollection;

  @JsonKey(name: "budget")
  @HiveField(15)
  // @ColumnInfo(name: "budget")
  double? budget;

  @JsonKey(name: "genres")
  @HiveField(16)
  // @ColumnInfo(name: "genres")
  List<GenreVO>? genres;

  @JsonKey(name: "homepage")
  @HiveField(17)
  // @ColumnInfo(name: "homepage")
  String? homePage;

  @JsonKey(name: "imdb_id")
  @HiveField(18)
  // @ColumnInfo(name: "imdb_id")
  String? imdbId;

  @JsonKey(name: "production_companies")
  @HiveField(19)
  // @ColumnInfo(name: "production_companies")
  List<ProductionCompanyVO>? productionCompanies;

  @JsonKey(name: "production_countries")
  @HiveField(20)
  // @ColumnInfo(name: "production_countries")
  List<ProductionCountryVO>? productionCountries;

  @JsonKey(name: "revenue")
  @HiveField(21)
  // @ColumnInfo(name: "revenue")
  int? revenue;

  @JsonKey(name: "runtime")
  @HiveField(22)
  // @ColumnInfo(name: "runtime")
  int? runTime;

  @JsonKey(name: "spoken_languages")
  @HiveField(23)
  // @ColumnInfo(name: "spoken_languages")
  List<SpokenLanguageVO>? spokenLanguages;

  @JsonKey(name: "status")
  @HiveField(24)
  // @ColumnInfo(name: "status")
  String? status;

  @JsonKey(name: "tagline")
  @HiveField(25)
  // @ColumnInfo(name: "tagline")
  String? tagLine;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @HiveField(26)
  // @ColumnInfo(name: "type")
  String? type;

  MovieVO(
      this.adult,
      this.backDropPath,
      this.genreIds,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homePage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.revenue,
      this.runTime,
      this.releaseDate,
      this.spokenLanguages,
      this.status,
      this.tagLine,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount, {
      this.type = "",
      }
      );


  MovieVO.nameParameters({
      this.adult,
      this.backDropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homePage,
      this.imdbId,
      this.productionCompanies,
      this.productionCountries,
      this.revenue,
      this.runTime,
      this.spokenLanguages,
      this.status,
      this.tagLine,
      this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVO &&
          runtimeType == other.runtimeType &&
          adult == other.adult &&
          backDropPath == other.backDropPath &&
          genreIds == other.genreIds &&
          id == other.id &&
          originalLanguage == other.originalLanguage &&
          originalTitle == other.originalTitle &&
          overview == other.overview &&
          popularity == other.popularity &&
          posterPath == other.posterPath &&
          releaseDate == other.releaseDate &&
          title == other.title &&
          video == other.video &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount &&
          belongsToCollection == other.belongsToCollection &&
          budget == other.budget &&
          genres == other.genres &&
          homePage == other.homePage &&
          imdbId == other.imdbId &&
          productionCompanies == other.productionCompanies &&
          productionCountries == other.productionCountries &&
          revenue == other.revenue &&
          runTime == other.runTime &&
          spokenLanguages == other.spokenLanguages &&
          status == other.status &&
          tagLine == other.tagLine &&
          type == other.type;

  @override
  int get hashCode =>
      adult.hashCode ^
      backDropPath.hashCode ^
      genreIds.hashCode ^
      id.hashCode ^
      originalLanguage.hashCode ^
      originalTitle.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      posterPath.hashCode ^
      releaseDate.hashCode ^
      title.hashCode ^
      video.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode ^
      belongsToCollection.hashCode ^
      budget.hashCode ^
      genres.hashCode ^
      homePage.hashCode ^
      imdbId.hashCode ^
      productionCompanies.hashCode ^
      productionCountries.hashCode ^
      revenue.hashCode ^
      runTime.hashCode ^
      spokenLanguages.hashCode ^
      status.hashCode ^
      tagLine.hashCode ^
      type.hashCode;

  factory MovieVO.fromJson(Map<String, dynamic> json) => _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  /// Poster path with base url
  String getPosterPathWithBaseUrl() {
    return kImageBaseUrl + (posterPath ?? "");
  }

  /// Backdrop path with base url
  String getBackdropPathWithBaseUrl(){
    return kImageBaseUrl + (backDropPath ?? "");
  }


  /// Get ratings with two decinals
  String getRatingTwoDecimal(){
    return voteAverage?.toStringAsFixed(2) ?? "";
  }

  /// Get Runtime formatted
  /// ~ take closet integer
  String getRunTimeFormatted(){
    if(runTime != null){
      int hours = runTime! ~/ 60;
      int minutes = runTime! % 60;
      return "$hours hr $minutes mins";
    }else {
      return "";
    }
  }

  /// Get Release Date Formatted
  String getReleaseDateFormatted(){
    if(releaseDate != null){
      DateTime dateTime = DateTime.parse(releaseDate!);
      String formattedDate = DateFormat('dd MMMM').format(dateTime);
      return formattedDate;
    }else{
      return "";
    }
  }
}

const String kMovieTypeNowPlaying = "now_playing";
const String kMovieTypeComingSoon = "coming_soon";