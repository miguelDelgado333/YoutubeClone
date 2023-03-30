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
    let pageInfo: PageInfo?
    
    // MARK: - Item
    struct ItemModel: Decodable {
        let kind: String
        let id: String?
        let snippet: Snippet?
        let contentDetails: ContentDetails?
        let statistics: Statistics?
        
        enum CodingKeys: String, CodingKey {
            case kind
            case id
            case snippet
            case contentDetails
            case status
            case statistics
            case topicDetails
        }
        
        init(from decoder: Decoder) throws {
            
            let container = try decoder.container(keyedBy: CodingKeys.self)
            // esto es para checar los valores de cada modelo
    
            if let id = try? container.decode(VideoID.self, forKey: .id) {
                self.id = id.videoId
            } else {
                if let id = try? container.decode(String.self, forKey: .id) {
                    self.id = id
                } else {
                    self.id = nil
                }
            }
            
            if let snippet = try? container.decode(Snippet.self, forKey: .snippet) {
                self.snippet = snippet
            } else {
                self.snippet = nil
            }
            
            if let contentDetails = try? container.decode(ContentDetails.self, forKey: .contentDetails) {
                self.contentDetails = contentDetails
            } else {
                self.contentDetails = nil
            }
            
            if let statistics = try? container.decode(Statistics.self, forKey: .statistics) {
                self.statistics = statistics
            } else {
                self.statistics = nil
            }
            
            
            self.kind = try container.decode(String.self, forKey: .kind)
        }
        
        
        
        struct VideoID: Decodable {
            let kind: String
            let videoId: String
        }
        
        
        // MARK: - Snippet
        struct Snippet: Decodable {
            let publishedAt: String
            let channelID, title, description: String
            let thumbnails: Thumbnails
            let channelTitle: String
            let tags: [String]?

            enum CodingKeys: String, CodingKey {
                case publishedAt
                case channelID = "channelId"
                case title
                case description
                case thumbnails
                case channelTitle
                case tags
            }
            
            // MARK: - Thumbnails
            struct Thumbnails: Decodable {
                let medium, high: Default

                enum CodingKeys: String, CodingKey {
                    case medium, high
                }
                
                // MARK: - Default
                struct Default: Decodable {
                    let url: String
                    let width, height: Int
                }
            }
        }
        
        // MARK: - ContentDetails
        struct ContentDetails: Decodable {
            let duration, dimension, definition, caption: String
            let licensedContent: Bool
            let projection: String
        }

        // MARK: - Statistics
        struct Statistics: Decodable {
            let viewCount, likeCount, favoriteCount, commentCount: String
        }

    }
    
    // MARK: - PageInfo
    struct PageInfo: Decodable {
        let totalResults, resultsPerPage: Int
    }
}
