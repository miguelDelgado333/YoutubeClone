//
//  RequestModel.swift
//  YoutubeClone
//
//  Created by Miguel Delgado on 03/03/23.
//

import Foundation

struct RequestModel {
    let endpoint: Endpoints
    var queryItem: [String:String]?
    let httpMethod: HttpMethod = .GET
    var baseUrl: URLBase = .youtube
    
    func getURL() -> String {
        return baseUrl.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod: String {
        case GET
        case POST
    }
    
    enum Endpoints: String {
        case search = "/search"
        case channels = "/channels"
        case playList = "/playlists"
        case playlistItems = "/playlistItems"
        case empty = ""
    }
    
    enum URLBase: String {
        case youtube = "https://youtube.googleapis.com/youtube/v3"
        case google = "https://oyhereweb.com/v2"
    }
}
