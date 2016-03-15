//
//  ViewController.swift
//  Casino Slot Machine
//
//  Created by Sekai Lab BD on 3/14/16.
//  Copyright © 2016 Sekai Lab BD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //MARK: Properties
    var itemsToPicker:ItemsForPickerView?
    @IBOutlet weak var pickerViewLeft: UIPickerView!
    @IBOutlet weak var pickerViewMiddle: UIPickerView!
    @IBOutlet weak var pickerViewRight: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemsToPicker = ItemsForPickerView()
        itemsToPicker!.printNames()

        var randomnumber = Int(arc4random_uniform(100))
        pickerViewLeft.selectRow(randomnumber, inComponent: 0, animated: true)
        
        randomnumber = Int(arc4random_uniform(100))
        pickerViewMiddle.selectRow(randomnumber, inComponent: 0, animated: true)
        
        randomnumber = Int(arc4random_uniform(100))
        pickerViewRight.selectRow(randomnumber, inComponent: 0, animated: true)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Button Behavior
    @IBAction func spinButtionAction(sender: UIButton) {
        
        for _ in 0...100 {
        
            var randomnumber = Int(arc4random_uniform(200))
            var i  = pickerViewLeft.selectedRowInComponent(0)
            print(i)
            print(randomnumber)
            if i < randomnumber {
                while i <= randomnumber {
                    pickerViewLeft.selectRow( ++i % 200, inComponent: 0, animated: true)
                }
            } else {
                while i >= randomnumber {
                    pickerViewLeft.selectRow( --i % 200, inComponent: 0, animated: true)
                }
            }
        
            randomnumber = Int(arc4random_uniform(200))
            i  = pickerViewMiddle.selectedRowInComponent(0)
            print(i)
            print(randomnumber)
            if i < randomnumber {
                while i <= randomnumber {
                    pickerViewMiddle.selectRow( ++i % 200, inComponent: 0, animated: true)
                }
            } else {
                while i >= randomnumber {
                    pickerViewMiddle.selectRow( --i % 200, inComponent: 0, animated: true)
                }
            }
        
            randomnumber = Int(arc4random_uniform(200))
            i = pickerViewRight.selectedRowInComponent(0)
            print(i)
            print(randomnumber)
            if i < randomnumber {
                while i <= randomnumber {
                    pickerViewRight.selectRow( ++i % 200, inComponent: 0, animated: true)
                }
            } else {
                while i >= randomnumber {
                    pickerViewRight.selectRow( --i % 200, inComponent: 0, animated: true)
                }
            }
        }
        
      
    }
    
    //MARK: Picker View Data Source
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (itemsToPicker?.imagesForTheName.count)!
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 95
    }
    
    //MARK: Delegate methos
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        //row = row % (itemsToPicker?.imagesForTheName.count)!
        
        let myImageView = UIImageView(image: itemsToPicker?.imagesForTheName[row]) as UIView
        return myImageView
        
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if row == (itemsToPicker?.imagesForTheName.count)! - 1 {
//            pickerView.selectRow(0, inComponent: 0, animated: true)
//        }
    }



}

