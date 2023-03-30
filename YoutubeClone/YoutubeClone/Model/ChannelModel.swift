//
//  ChannelModel.swift
//  YoutubeClone
//
//  Created by Miguel Delgado on 03/03/23.
//

import Foundation

// MARK: - ChannelModel
struct ChannelModel: Decodable {
    let kind, etag: String
    let pageInfo: PageInfoChannel?
    let items: [ItemChannel]
}

// MARK: - Item
struct ItemChannel: Decodable {
    let kind, etag, id: String
    let snippet: SnippetItem
    let statistics: Statistics
    let brandingSettings: BrandingSettings
}

// MARK: - BrandingSettings
struct BrandingSettings: Decodable {
    let channel: Channel
    let image: Image
}

// MARK: - Channel
struct Channel: Decodable {
    let title, description, keywords, defaultLanguage: String
    let country: String
}

// MARK: - Image
struct Image: Decodable {
    let bannerExternalURL: String

    enum CodingKeys: String, CodingKey {
        case bannerExternalURL = "bannerExternalUrl"
    }
}

// MARK: - Snippet
struct SnippetItem: Decodable {
    let title, description, customURL, publishedAt: String
    let thumbnails: ThumbnailsSnippet
    let defaultLanguage: String
    let localized: Localized
    let country: String

    enum CodingKeys: String, CodingKey {
        case title, description
        case customURL = "customUrl"
        case publishedAt, thumbnails, defaultLanguage, localized, country
    }
}

// MARK: - Localized
struct Localized: Decodable {
    let title, description: String
}

// MARK: - Thumbnails
struct ThumbnailsSnippet: Decodable {
    let thumbnailsDefault, medium, high: DefaultThumbnails

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
}

// MARK: - Default
struct DefaultThumbnails: Decodable {
    let url: String
    let width, height: Int
}

// MARK: - Statistics
struct Statistics: Decodable {
    let viewCount, subscriberCount: String
    let hiddenSubscriberCount: Bool
    let videoCount: String
}

// MARK: - PageInfoChannel
struct PageInfoChannel: Decodable {
    let totalResults, resultsPerPage: Int
}
