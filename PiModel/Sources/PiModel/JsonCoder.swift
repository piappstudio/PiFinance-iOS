//
//  File.swift
//  
//
//  Created by Boobalan on 7/14/23.
//

import Foundation

extension String {
    
    
   
}

public struct JsonCoder {
    public static func decode<T>(type:T.Type, from:String)->T? where T:Codable {
        do {
            let data = Data(from.utf8)
            return try JSONDecoder().decode(type, from: data)
        }catch {
            print(error)
        }
        return nil
    }
    public static func encode<T>(type:T)->String? where T:Codable {
         do {
             let data = try JSONEncoder().encode(type)
             return String(decoding: data, as: UTF8.self)
             
         } catch {
             print (error)
         }
         return nil
     
     }
}
