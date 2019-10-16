//
//  Debug.swift
//  HondaPrelude
//
//  Created by George Webster on 10/16/19.
//  Copyright © 2019 George Webster. All rights reserved.
//

import Foundation


/// Identity function that dumps the value to the console
/// - Parameter a: Any Type
public func trace<A>(_ a: A) -> A {
    dump(a)
    return a
}
