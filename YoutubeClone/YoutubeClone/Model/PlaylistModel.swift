//
//  PlaylistModel.swift
//  YoutubeClone
//
//  Created by Miguel Delgado on 01/03/23.
//

import Foundation

struct PlayListModel: Decodable {
    let kind: String
    let etag: String
    let nextPageToken: String
    let pageInfo: PageInfoModel
    let items: [ItemsModel]
    
    struct PageInfoModel: Decodable {
        let totalResults: Int
        let resultsPerPage: Int
    }
    
    struct ItemsModel: Decodable {
        let kind: String
        let etag: String
        let id: String
        let snippet: Snippet
        let contentDetails: ContentDetailsModel
        
        struct Snippet: Decodable {
            let publishedAt: String
            let channelId: String
            let title: String
            let description: String
            let thumbnails: ThumbnailsModels
            let channelTitle: String
            let localized: LocalizedModel
            
            struct ThumbnailsModels: Decodable {
                let medium: MediumModel
                
                struct MediumModel: Decodable {
                    let url: String
                    let width: Int
                    let height: Int
                }
            }
            
            struct LocalizedModel: Decodable {
                let title: String
                let description: String
            }
        }
        
        struct ContentDetailsModel: Decodable {
            let itemCount: Int
        }
    }
    
}
