//
//  Threading.swift
//  Pokemon
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

func DispatchMainThreadSafe(_ block: @escaping () -> ()) {
    if Thread.isMainThread {
        block()
    } else {
        DispatchQueue.main.async(execute: {
            block()
        })
    }
}

func DispatchSyncMainThreadSafe(_ block: () -> ()) {
    if Thread.isMainThread {
        block()
    } else {
        DispatchQueue.main.sync(execute: {
            block()
        })
    }
}
