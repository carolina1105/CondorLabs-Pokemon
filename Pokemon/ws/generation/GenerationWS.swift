//
//  GenerationWS.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import Foundation

class GenerationWS {
    
    static let shared = GenerationWS()
    let endPoints = Constant.default    
    var manager = ManagerWS.shared
    
    func generations(type: Int,
                     completion: @escaping (GenerationResDTO?, ErrorDTO?) -> Void ) {
        let url = endPoints.serverUrl + String(format: endPoints.generations, type)
        
        //TODO make2
        manager.make(url: url, 
                      method: .get, 
                      success: { data in 
                        let generations: GenerationResDTO? = ResDTO.toDTO(data: data)
                        if generations != nil {
                            completion(generations, nil)
                            return
                        }
                      }) { (nil, error) in
        }
    }
}
