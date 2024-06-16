import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/data/vos/collection_vo.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'package:the_movie_app_padc/data/vos/genre_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/data/vos/production_company_vo.dart';
import 'package:the_movie_app_padc/data/vos/production_country_vo.dart';
import 'package:the_movie_app_padc/data/vos/spoken_language_vo.dart';

/// Mock Single Move
final MovieVO mockMovie = MovieVO.nameParameters(
    adult: false,
    backDropPath: "/path/to/backdrop.jpg",
    genreIds: [28, 12, 16],
    id: 1,
    originalLanguage: "en",
    originalTitle: "Movie Title",
    overview:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    popularity: 0,
    posterPath: "/path/to/poster.jpg",
    releaseDate: "18/12/2024",
    title: "Movie Title",
    video: false,
    voteAverage: 0,
    voteCount: 0,
    belongsToCollection: CollectionVO.namedParameters(
        id: 1,
        name: "Collection Name",
        posterPath: "/path/to/poster.jpg",
        backDropPath: "/path/to/backdrop.jpg"),
    budget: 150000000,
    genres: [
      GenreVO.namedParameter(id: 28, name: "Action"),
      GenreVO.namedParameter(id: 12, name: "Adventure")
    ],
    imdbId: "tt1234567",
    productionCompanies: [
      ProductionCompanyVO.namedParameters(
          id: 1,
          name: "Production Company",
          logoPath: "/path/to/logo.jpg",
          originCountry: "Australia")
    ],
    productionCountries: [
      ProductionCountryVO.namedParameters(
        is031661: "US",
        name: "United States",
      )
    ],
    revenue: 50000000,
    runTime: 120,
    spokenLanguages: [
      SpokenLanguageVO.nameParameters(
          englishName: "", iso6391: "iso6391", name: "Spoken Language")
    ],
    status: "Released",
    tagLine: "This is a sample tagline. ",
    type: "");

/// Mock Movie List
final List<MovieVO> mockNowPlayingMovieList = [
  MovieVO.nameParameters(
      adult: false,
      backDropPath: "/path/to/backdrop.jpg",
      genreIds: [28, 12, 16],
      id: 1,
      originalLanguage: "en",
      originalTitle: "Movie Title",
      overview:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      popularity: 0,
      posterPath: "/path/to/poster.jpg",
      releaseDate: "18/12/2024",
      title: "Movie Title",
      video: false,
      voteAverage: 0,
      voteCount: 0,
      belongsToCollection: CollectionVO.namedParameters(
          id: 1,
          name: "Collection Name",
          posterPath: "/path/to/poster.jpg",
          backDropPath: "/path/to/backdrop.jpg"),
      budget: 150000000,
      genres: [
        GenreVO.namedParameter(id: 28, name: "Action"),
        GenreVO.namedParameter(id: 12, name: "Adventure")
      ],
      imdbId: "tt1234567",
      productionCompanies: [
        ProductionCompanyVO.namedParameters(
            id: 1,
            name: "Production Company",
            logoPath: "/path/to/logo.jpg",
            originCountry: "Australia")
      ],
      productionCountries: [
        ProductionCountryVO.namedParameters(
          is031661: "US",
          name: "United States",
        )
      ],
      revenue: 50000000,
      runTime: 120,
      spokenLanguages: [
        SpokenLanguageVO.nameParameters(
            englishName: "", iso6391: "iso6391", name: "Spoken Language")
      ],
      status: "Released",
      tagLine: "This is a sample tagline. ",
      type: ""),
  MovieVO.nameParameters(
      adult: false,
      backDropPath: "/path/to/backdrop.jpg",
      genreIds: [28, 12, 16],
      id: 1,
      originalLanguage: "en",
      originalTitle: "Movie Title",
      overview:
          "Lorem ipsum dolor sit amet, consecrate adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      popularity: 0,
      posterPath: "/path/to/poster.jpg",
      releaseDate: "18/12/2024",
      title: "Movie Title",
      video: false,
      voteAverage: 0,
      voteCount: 0,
      belongsToCollection: CollectionVO.namedParameters(
          id: 1,
          name: "Collection Name",
          posterPath: "/path/to/poster.jpg",
          backDropPath: "/path/to/backdrop.jpg"),
      budget: 150000000,
      genres: [
        GenreVO.namedParameter(id: 28, name: "Action"),
        GenreVO.namedParameter(id: 12, name: "Adventure")
      ],
      imdbId: "tt1234567",
      productionCompanies: [
        ProductionCompanyVO.namedParameters(
            id: 1,
            name: "Production Company",
            logoPath: "/path/to/logo.jpg",
            originCountry: "Australia")
      ],
      productionCountries: [
        ProductionCountryVO.namedParameters(
          is031661: "US",
          name: "United States",
        )
      ],
      revenue: 50000000,
      runTime: 120,
      spokenLanguages: [
        SpokenLanguageVO.nameParameters(
            englishName: "", iso6391: "iso6391", name: "Spoken Language")
      ],
      status: "Released",
      tagLine: "This is a sample tagline. ",
      type: "")
];

final List<MovieVO> mockComingSoonMovieList = [
  MovieVO.nameParameters(
      adult: false,
      backDropPath: "/path/to/backdrop.jpg",
      genreIds: [28, 12, 16],
      id: 1,
      originalLanguage: "en",
      originalTitle: "Movie Title",
      overview:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      popularity: 0,
      posterPath: "/path/to/poster.jpg",
      releaseDate: "18/12/2024",
      title: "Coming Movie Title 1",
      video: false,
      voteAverage: 0,
      voteCount: 0,
      belongsToCollection: CollectionVO.namedParameters(
          id: 1,
          name: "Collection Name",
          posterPath: "/path/to/poster.jpg",
          backDropPath: "/path/to/backdrop.jpg"),
      budget: 150000000,
      genres: [
        GenreVO.namedParameter(id: 28, name: "Action"),
        GenreVO.namedParameter(id: 12, name: "Adventure")
      ],
      imdbId: "tt1234567",
      productionCompanies: [
        ProductionCompanyVO.namedParameters(
            id: 1,
            name: "Production Company",
            logoPath: "/path/to/logo.jpg",
            originCountry: "Australia")
      ],
      productionCountries: [
        ProductionCountryVO.namedParameters(
          is031661: "US",
          name: "United States",
        )
      ],
      revenue: 50000000,
      runTime: 120,
      spokenLanguages: [
        SpokenLanguageVO.nameParameters(
            englishName: "", iso6391: "iso6391", name: "Spoken Language")
      ],
      status: "Released",
      tagLine: "This is a sample tagline. ",
      type: ""),
  MovieVO.nameParameters(
      adult: false,
      backDropPath: "/path/to/backdrop.jpg",
      genreIds: [28, 12, 16],
      id: 1,
      originalLanguage: "en",
      originalTitle: "Coming Movie Title 2",
      overview:
      "Lorem ipsum dolor sit amet, consecrate adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      popularity: 0,
      posterPath: "/path/to/poster.jpg",
      releaseDate: "18/12/2024",
      title: "Movie Title",
      video: false,
      voteAverage: 0,
      voteCount: 0,
      belongsToCollection: CollectionVO.namedParameters(
          id: 1,
          name: "Collection Name",
          posterPath: "/path/to/poster.jpg",
          backDropPath: "/path/to/backdrop.jpg"),
      budget: 150000000,
      genres: [
        GenreVO.namedParameter(id: 28, name: "Action"),
        GenreVO.namedParameter(id: 12, name: "Adventure")
      ],
      imdbId: "tt1234567",
      productionCompanies: [
        ProductionCompanyVO.namedParameters(
            id: 1,
            name: "Production Company",
            logoPath: "/path/to/logo.jpg",
            originCountry: "Australia")
      ],
      productionCountries: [
        ProductionCountryVO.namedParameters(
          is031661: "US",
          name: "United States",
        )
      ],
      revenue: 50000000,
      runTime: 120,
      spokenLanguages: [
        SpokenLanguageVO.nameParameters(
            englishName: "", iso6391: "iso6391", name: "Spoken Language")
      ],
      status: "Released",
      tagLine: "This is a sample tagline. ",
      type: "")
];

final List<CreditVO> mockCreditList = [
  CreditVO(
      false,
      1,
      101,
      "Acting",
      "John Doe",
      10.0,
      1,
      "Lead Character",
      "credit101",
      1,
      "John Doe",
      "/path/to/profile1.jpg"),
  CreditVO(
      false,
      1,
      101,
      "Acting",
      "Mary Doe",
      10.0,
      1,
      "Lead Character",
      "credit101",
      1,
      "John Doe",
      "/path/to/profile1.jpg")
];