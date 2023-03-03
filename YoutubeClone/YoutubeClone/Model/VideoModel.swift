//
//  VideoModel.swift
//  YoutubeClone
//
//  Created by Miguel Delgado on 02/03/23.
//

import Foundation

// MARK: - VideoModel
struct VideoModel: Decodable {
    let kind, etag: String
    let items: [ItemModel]
    let pageInfo: PageInfo
    
    // MARK: - Item
    struct ItemModel: Decodable {
        let kind, etag, id: String
        let snippet: Snippet
        let contentDetails: ContentDetails
        let status: Status
        let statistics: Statistics
        let topicDetails: TopicDetails
        
        // MARK: - Snippet
        struct Snippet: Decodable {
            let publishedAt: Date
            let channelID, title, description: String
            let thumbnails: Thumbnails
            let channelTitle: String
            let tags: [String]
            let categoryID, liveBroadcastContent: String
            let localized: Localized
            let defaultAudioLanguage: String

            enum CodingKeys: String, CodingKey {
                case publishedAt
                case channelID = "channelId"
                case title, description, thumbnails, channelTitle, tags
                case categoryID = "categoryId"
                case liveBroadcastContent, localized, defaultAudioLanguage
            }
            
            // MARK: - Thumbnails
            struct Thumbnails: Decodable {
                let thumbnailsDefault, medium, high, standard: Default
                let maxres: Default

                enum CodingKeys: String, CodingKey {
                    case thumbnailsDefault = "default"
                    case medium, high, standard, maxres
                }
                
                // MARK: - Default
                struct Default: Decodable {
                    let url: String
                    let width, height: Int
                }
            }
            
            // MARK: - Localized
            struct Localized: Decodable {
                let title, description: String
            }
        }
        
        // MARK: - ContentDetails
        struct ContentDetails: Decodable {
            let duration, dimension, definition, caption: String
            let licensedContent: Bool
            let projection: String
        }
        
        // MARK: - Status
        struct Status: Decodable {
            let uploadStatus, privacyStatus, license: String
            let embeddable, publicStatsViewable, madeForKids: Bool
        }
        
        // MARK: - Statistics
        struct Statistics: Decodable {
            let viewCount, likeCount, favoriteCount, commentCount: String
        }
        
        // MARK: - TopicDetails
        struct TopicDetails: Decodable {
            let topicCategories: [String]
        }
    }
    
    // MARK: - PageInfo
    struct PageInfo: Decodable {
        let totalResults, resultsPerPage: Int
    }
}
