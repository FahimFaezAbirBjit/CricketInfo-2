//
//  DetailVcModel.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 16/2/23.
//

import Foundation
class DetailVcModel{
    var fixtureId: ObservableObject<Int?> = ObservableObject(value: nil)
   // static var flag: ObservableObject<Bool?> = ObservableObject(value: nil)
    func setFixId(fixId: Int){
       fixtureId.value = fixId
    }
}
