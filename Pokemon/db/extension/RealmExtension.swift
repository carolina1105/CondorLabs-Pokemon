//
//  RealmExtension.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 25/10/20.
//

import RealmSwift

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        do {
            if isInWriteTransaction {
                try block()
            } else {
                try write(block)
            }
        } catch {
            print("Erorr al Agregar Mensage")
        }
        
    }
    
    func deleteAll<T: Object>(_ data: [T.Type]) {
        let realm = try! Realm()
        realm.refresh()
        try? realm.safeWrite {
            for object in data {
                let allObjects = realm.objects(object)
                realm.delete(allObjects)
            }
        }
    }
}

extension Realm {
    func writeAsync<T : ThreadConfined>(obj: T,
                                        block: @escaping ((Realm, T?) -> Void),
                                        failure: @escaping ((_ error : Swift.Error) -> Void) = { _ in return }) {
        let wrappedObj = ThreadSafeReference(to: obj)
        let config = self.configuration
        DispatchQueue(label: "background").async {
            autoreleasepool {
                do {
                    let realm = try Realm(configuration: config)
                    let obj = realm.resolve(wrappedObj)

                    try realm.write {
                        block(realm, obj)
                    }
                }
                catch {
                    print("ERROR INSETION IN \(obj.self) => \(error)")
                    failure(error)
                }
            }
        }
    }
}
