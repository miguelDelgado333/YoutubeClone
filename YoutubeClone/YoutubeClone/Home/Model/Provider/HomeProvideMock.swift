//
//  HomeProvideMock.swift
//  YoutubeClone
//
//  Created by Miguel Delgado on 30/03/23.
//

import Foundation

class HomeProvideMock: HomeProviderProtocol {
    
    // throw: es que quiere decir que se debuelve un error
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel {
        guard let model = Utils.parseJson(jsonName: "SearchVideos", model: VideoModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getChannel(channelId: String) async throws -> ChannelModel {
        guard let model = Utils.parseJson(jsonName: "Channel", model: ChannelModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getPlayLists(channelId: String) async throws -> PlayListModel {
        guard let model = Utils.parseJson(jsonName: "PlayList", model: PlayListModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getPlayListsItems(playlistId: String) async throws -> PlaylistItemsModel {
        guard let model = Utils.parseJson(jsonName: "PlayListItems", model: PlaylistItemsModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    
    
    
}
