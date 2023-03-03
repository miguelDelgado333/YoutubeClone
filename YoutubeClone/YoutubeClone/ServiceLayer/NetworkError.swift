//
//  NetworkError.swift
//  YoutubeClone
//
//  Created by Miguel Delgado on 03/03/23.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodedData
    case httpResponseError
    case statusCodeError = "Ocurrio un error al tratar de consultar la API: status code"
    case jsonDecoder = "Error al intentar extraer datos json"
    case unauthorized
}
