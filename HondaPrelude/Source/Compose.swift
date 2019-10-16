//
//  Operators.swift
//
//  Created by George Webster on 4/5/18.
//

import Foundation

//MARK:- Backwards Composition

precedencegroup BackwardsComposition {
    associativity: left
}

infix operator <<<: BackwardsComposition

public func <<< <A, B, C>(_ f: @escaping (B) -> C, _ g: @escaping (A) -> B) -> (A) -> C {
    return { x in f(g(x)) }
}

public func compose<A, B, C>(_ f: @escaping (B) -> C, _ g: @escaping (A) -> B) -> (A) -> C {
    return { x in
        f(g(x))
    }
}

//MARK:- Forward Composition

precedencegroup ForwardComposition {
    associativity: left
    higherThan: ForwardApplication
}

infix operator >>>: ForwardComposition

public func >>> <A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
    return { x in g(f(x)) }
}

// I've heard this called `composeRight` or it could be a regular function called
// `forwardCompose` instead of an infix:

public func forwardCompose<A, B, C>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> C) -> (A) -> C {
    return { a in
        g(f(a))
    }
}

//MARK:- Single Type Composition

precedencegroup SingleTypeComposition {
    associativity: right
    higherThan: ForwardApplication
}

infix operator <>: SingleTypeComposition

public func <> <A: AnyObject> (f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
    return { a  in
        f(a)
        g(a)
    }
}
