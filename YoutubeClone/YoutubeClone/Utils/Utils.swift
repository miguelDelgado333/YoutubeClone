//
//  Utils.swift
//  YoutubeClone
//
//  Created by Miguel Delgado on 30/03/23.
//

import Foundation

class Utils {
    
    // static: significa que no debe tener una Instancia
    static func parseJson<T: Decodable>(jsonName: String, model: T.Type) -> T? {
        guard let url = Bundle.main.url(forResource: jsonName, withExtension: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let responseModel = try jsonDecoder.decode(T.self, from: data)
                return responseModel
            } catch {
                print("json mock erro: \(error)")
                return nil
            }
        } catch {
            return nil
        }
    }
}
