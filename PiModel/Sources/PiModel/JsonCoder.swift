//
//  File.swift
//  
//
//  Created by Boobalan on 7/14/23.
//

import Foundation

extension String {
    func decode(json:Data, type:Decodable.Type)->Decodable? {
        do {
            return try JSONDecoder().decode(type.self, from: json)
        }catch {
            print(error)
        }
        return nil
    }
    
    func encode(type:Encodable.Type)->Data? {
        do {
            return try JSONEncoder().encode(type)
        } catch {
            print (error)
        }
        return nil
    }
}
