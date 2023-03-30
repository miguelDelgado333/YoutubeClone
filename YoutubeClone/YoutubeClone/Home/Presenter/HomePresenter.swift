//
//  HomePresenter.swift
//  YoutubeClone
//
//  Created by Miguel Delgado on 03/03/23.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func getData(list: [[Any]])
}

class HomePresenter {
    
    var provider: HomeProviderProtocol
    weak var delegate: HomeViewProtocol?
    private var objectList: [[Any]] = []
    
    init(delegate: HomeViewProtocol, provider: HomeProviderProtocol = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
        
        #if DEBUG
        if MockManager.shared.runAppWithMock {
            self.provider = HomeProvideMock()
        }
        #endif
        
        
        
    }
    
    func getHomeObjects() async {
        objectList.removeAll()
        
           async let channel = try await provider.getChannel(channelId: Constants.channelId).items
           async let playList = try await provider.getPlayLists(channelId: Constants.channelId).items
           async let videos = try await provider.getVideos(searchString: "", channelId: Constants.channelId).items
        
        do {
            
            // el await nos ayuda a hacer el llamado async en las lineas de arriba nos ayudan a cargarlo como asyncronos las variables de aqui abajo despues del let van tomando valor como se vallan consumiendo
            let (responseChannel, responsePlayList, responseVideos) = await ( try channel, try playList, try videos)
            // Index 0
            objectList.append(responseChannel)
            
            if let playlistId = responsePlayList.first?.id, let playlistItems = await getPlayListItems(playListId: playlistId) {
                // Index 1
                objectList.append(playlistItems.items)
            }
            
            // Index 2
            objectList.append(responseVideos)
            
            // Index 3
            objectList.append(responsePlayList)
            
            delegate?.getData(list: objectList)
            
        } catch {
           print(error)
        }
        
    }
    
    func getPlayListItems(playListId: String) async -> PlaylistItemsModel? {
        
        do {
            let playlistItems = try await provider.getPlayListsItems(playlistId: playListId)
            return playlistItems
        } catch {
            return nil
        }
    }
}
