//
//  Item.swift
//  Casino Slot Machine
//
//  Created by Sekai Lab BD on 3/14/16.
//  Copyright © 2016 Sekai Lab BD. All rights reser


import UIKit

class ItemsForPickerView{
    //MARK: Properties
    var namesOfImage = [String]()
    var imagesForTheName = [UIImage]()
    
    //MARK: Methos
    init() {
        for i in 0..<200 {
            imagesForTheName.append(UIImage(named: "Number"+"\(i % 10)")!)
            namesOfImage.append("Number"+"\(i % 10)")
        }


    }
    func printNames() ->Void {
        for i in 0..<200 {
            print(imagesForTheName[i])
        }
    }
}