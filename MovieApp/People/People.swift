//
//  People.swift
//  MovieApp
//
//  Created by pervın on 20.04.23.
//

import Foundation
// MARK: - People
struct People: Codable {
    let page: Int?
    let result: [PeopleResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case result = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - PeopleResult
struct PeopleResult: Codable, TopImageButtomCellProtocol { //TopImageBottomLabelCellProtocolTest {
    var adult: Bool?
    var gender, id: Int?
    var knownFor: [PeopleKnownFor]?
    var knownForDepartment, name: String?
    var popularity: Double?
    var profilePath: String?
    
    var titleText: String {
        name ?? ""
    }
    
    var imageUrl: String {
        profilePath ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownFor = "known_for"
        case knownForDepartment = "known_for_department"
        case name, popularity
        case profilePath = "profile_path"
    }
    
}
// MARK: - PeopleKnownFor
struct PeopleKnownFor: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let mediaType, originalLanguage, originalTitle, overview: String?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
