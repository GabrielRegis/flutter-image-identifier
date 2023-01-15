//
//  SwiftCNH.swift
//  flutter_image_identifier
//
//  Created by Gabriel Regis on 14/01/23.
//

import Foundation

@available(iOS 16.0, *)
public struct CNH: Codable{
    var name: String?
    var rgNumber: String?
    var cpfNumber: String?
    var birthDate: String?
    var cnhNumber: String?
    var expirationDate: String?
    
    init(name: String? = nil, rgNumber: String? = nil, cpfNumber: String? = nil, birthDate: String? = nil, cnhNumber: String? = nil, expirationDate: String? = nil) {
        self.name = name
        self.rgNumber = rgNumber
        self.cpfNumber = cpfNumber
        self.birthDate = birthDate
        self.cnhNumber = cnhNumber
        self.expirationDate = expirationDate
    }
    
    public static func fromString(data: String) -> CNH{
        var cpf = ""
        do{
            print(data)
            let cpfPatern = /\d{3}\.\d{3}\.\d{3}\-\d{2}/;
            if let match = data.firstMatch(of: cpfPatern) {
                
                cpf = match.output.lowercased()
            }
            
            
        }
        catch{
            
        }
        
        
        return CNH(cpfNumber: cpf)
    }
}
