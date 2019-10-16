//
//  Apply.swift
//  Prelude
//
//  Created by George Webster on 9/12/19.
//

import Foundation


//MARK:- Forward Application

precedencegroup ForwardApplication {
    associativity: left
}

infix operator |>: ForwardApplication

public func |> <A, B>(x: A, f: (A) -> B) -> B {
    return f(x)
}

public func apply<A, B>(_ x: A, to f: (A) -> B) -> B {
    return f(x)
}

