//
//  ObservableObject.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 9/2/23.
//

import Foundation

final class ObservableObject<T> {
    var listener: ((T) -> Void)?
    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(value: T) {
        self.value = value
    }

    func bind(listener: @escaping (T) -> Void) {
        self.listener = listener
    }
}
