// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_booking_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorMovieBookingDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MovieBookingDatabaseBuilder databaseBuilder(String name) =>
      _$MovieBookingDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MovieBookingDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MovieBookingDatabaseBuilder(null);
}

class _$MovieBookingDatabaseBuilder {
  _$MovieBookingDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MovieBookingDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MovieBookingDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MovieBookingDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MovieBookingDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MovieBookingDatabase extends MovieBookingDatabase {
  _$MovieBookingDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `movies` (`adult` INTEGER, `backdrop_path` TEXT, `genre_ids` TEXT, `id` INTEGER, `original_language` TEXT, `original_title` TEXT, `overview` TEXT, `popularity` REAL, `poster_path` TEXT, `release_date` TEXT, `title` TEXT, `video` INTEGER, `vote_average` REAL, `vote_count` INTEGER, `belongs_to_collection` TEXT, `budget` REAL, `genres` TEXT, `homepage` TEXT, `imdb_id` TEXT, `production_companies` TEXT, `production_countries` TEXT, `revenue` INTEGER, `runtime` INTEGER, `spoken_languages` TEXT, `status` TEXT, `tagline` TEXT, `type` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _movieVOInsertionAdapter = InsertionAdapter(
            database,
            'movies',
            (MovieVO item) => <String, Object?>{
                  'adult': item.adult == null ? null : (item.adult! ? 1 : 0),
                  'backdrop_path': item.backDropPath,
                  'genre_ids': _genreIdListTypeConverter.encode(item.genreIds),
                  'id': item.id,
                  'original_language': item.originalLanguage,
                  'original_title': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'poster_path': item.posterPath,
                  'release_date': item.releaseDate,
                  'title': item.title,
                  'video': item.video == null ? null : (item.video! ? 1 : 0),
                  'vote_average': item.voteAverage,
                  'vote_count': item.voteCount,
                  'belongs_to_collection':
                      _collectionVOConverter.encode(item.belongsToCollection),
                  'budget': item.budget,
                  'genres': _genreListConverter.encode(item.genres),
                  'homepage': item.homePage,
                  'imdb_id': item.imdbId,
                  'production_companies': _productionCompanyListTypeConverter
                      .encode(item.productionCompanies),
                  'production_countries': _productionCountryListTypeConverter
                      .encode(item.productionCountries),
                  'revenue': item.revenue,
                  'runtime': item.runTime,
                  'spoken_languages':
                      _spokenLanguageListConverter.encode(item.spokenLanguages),
                  'status': item.status,
                  'tagline': item.tagLine,
                  'type': item.type
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieVO> _movieVOInsertionAdapter;

  @override
  Stream<MovieVO?> getMovieById(int movieId) {
    return _queryAdapter.queryStream('SELECT * FROM movies WHERE id=?1',
        mapper: (Map<String, Object?> row) => MovieVO(
            row['adult'] == null ? null : (row['adult'] as int) != 0,
            row['backdrop_path'] as String?,
            _genreIdListTypeConverter.decode(row['genre_ids'] as String?),
            _collectionVOConverter
                .decode(row['belongs_to_collection'] as String?),
            row['budget'] as double?,
            _genreListConverter.decode(row['genres'] as String?),
            row['homepage'] as String?,
            row['id'] as int?,
            row['imdb_id'] as String?,
            row['original_language'] as String?,
            row['original_title'] as String?,
            row['overview'] as String?,
            row['popularity'] as double?,
            row['poster_path'] as String?,
            _productionCompanyListTypeConverter
                .decode(row['production_companies'] as String?),
            _productionCountryListTypeConverter
                .decode(row['production_countries'] as String?),
            row['revenue'] as int?,
            row['runtime'] as int?,
            row['release_date'] as String?,
            _spokenLanguageListConverter
                .decode(row['spoken_languages'] as String?),
            row['status'] as String?,
            row['tagline'] as String?,
            row['title'] as String?,
            row['video'] == null ? null : (row['video'] as int) != 0,
            row['vote_average'] as double?,
            row['vote_count'] as int?,
            type: row['type'] as String?),
        arguments: [movieId],
        queryableName: 'movies',
        isView: false);
  }

  @override
  Stream<List<MovieVO>> getMovieByType(String type) {
    return _queryAdapter.queryListStream('SELECT * FROM movies WHERE type=?1',
        mapper: (Map<String, Object?> row) => MovieVO(
            row['adult'] == null ? null : (row['adult'] as int) != 0,
            row['backdrop_path'] as String?,
            _genreIdListTypeConverter.decode(row['genre_ids'] as String?),
            _collectionVOConverter
                .decode(row['belongs_to_collection'] as String?),
            row['budget'] as double?,
            _genreListConverter.decode(row['genres'] as String?),
            row['homepage'] as String?,
            row['id'] as int?,
            row['imdb_id'] as String?,
            row['original_language'] as String?,
            row['original_title'] as String?,
            row['overview'] as String?,
            row['popularity'] as double?,
            row['poster_path'] as String?,
            _productionCompanyListTypeConverter
                .decode(row['production_companies'] as String?),
            _productionCountryListTypeConverter
                .decode(row['production_countries'] as String?),
            row['revenue'] as int?,
            row['runtime'] as int?,
            row['release_date'] as String?,
            _spokenLanguageListConverter
                .decode(row['spoken_languages'] as String?),
            row['status'] as String?,
            row['tagline'] as String?,
            row['title'] as String?,
            row['video'] == null ? null : (row['video'] as int) != 0,
            row['vote_average'] as double?,
            row['vote_count'] as int?,
            type: row['type'] as String?),
        arguments: [type],
        queryableName: 'movies',
        isView: false);
  }

  @override
  Future<void> insertMovieList(List<MovieVO> movie) async {
    await _movieVOInsertionAdapter.insertList(
        movie, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertMovie(MovieVO movie) async {
    await _movieVOInsertionAdapter.insert(movie, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _collectionVOConverter = CollectionVOConverter();
final _genreIdListTypeConverter = GenreIdListTypeConverter();
final _genreListConverter = GenreListConverter();
final _productionCompanyListTypeConverter =
    ProductionCompanyListTypeConverter();
final _productionCountryListTypeConverter =
    ProductionCountryListTypeConverter();
final _spokenLanguageListConverter = SpokenLanguageListConverter();
