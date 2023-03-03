//
//  HomeProvider.swift
//  YoutubeClone
//
//  Created by Miguel Delgado on 03/03/23.
//

import Foundation

protocol HomeProviderProtocol {
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel
}

class HomeProvider: HomeProviderProtocol {
    
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel {
        var queryParams: [String:String] = ["part":"snippet"]
        
        if !channelId.isEmpty {
            queryParams["channelId"] = channelId
        }
        
        if !searchString.isEmpty {
            queryParams["q"] = searchString
        }
        
        let requestModel = RequestModel(endpoint: .search, queryItem: queryParams)
        
        do {
            let model = try await ServiceLayer.callService(requestModel, VideoModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }
    
    func getChannel(channelId: String) async throws -> ChannelModel {
        let queryParams: [String:String] = ["part":"snippet,statistics,brandingSettings",
                                            "id": channelId]
        
        let requestModel = RequestModel(endpoint: .channels, queryItem: queryParams)
        
        do {
            let model = try await ServiceLayer.callService(requestModel, ChannelModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }
    
    func getPlayLists(channelId: String) async throws -> PlayListModel {
        let queryParams: [String:String] = ["part":"snippet,contentDetails",
                                            "channelId": channelId]
        
        let requestModel = RequestModel(endpoint: .playList, queryItem: queryParams)
        
        do {
            let model = try await ServiceLayer.callService(requestModel, PlayListModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }
    
    func getPlayListsItems(playlistId: String) async throws -> PlaylistItemsModel {
        let queryParams: [String:String] = ["part":"snippet,id,contentDetails",
                                            "playlistId": playlistId]
        
        let requestModel = RequestModel(endpoint: .playlistItems, queryItem: queryParams)
        
        do {
            let model = try await ServiceLayer.callService(requestModel, PlaylistItemsModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }

}
