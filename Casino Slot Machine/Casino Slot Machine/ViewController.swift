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
    var myTimer: NSTimer?
    var numberOfIteration: Int?
    @IBOutlet weak var pickerViewLeft: UIPickerView!
    @IBOutlet weak var pickerViewMiddle: UIPickerView!
    @IBOutlet weak var pickerViewRight: UIPickerView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var spinButton: UIButton!
    
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
        spinButton.hidden = true
        numberOfIteration = 25
        myTimer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(0.2), target: self, selector: "slotMachinePlay", userInfo: nil, repeats: true)

      
    }
    
    
    func getRandomNumber(modValue: Int) -> Int {
        var rndm = Int(arc4random_uniform(UInt32(modValue)))
        while (rndm == 0 || rndm == modValue - 1) {
            rndm = Int(arc4random_uniform(UInt32(modValue)))
        }
        return rndm
    }
    
    
    func spinPicker(pickerView: UIPickerView) {
        var randomnumber = getRandomNumber(200)
        pickerView.selectRow( randomnumber, inComponent: 0, animated: true)
        
    }
    
    
    func slotMachinePlay()
    {
        numberOfIteration?--
        spinPicker(pickerViewLeft)
        spinPicker(pickerViewMiddle)
        spinPicker(pickerViewRight)
        if numberOfIteration == 0 {
            myTimer?.invalidate()
            let name1 = itemsToPicker!.namesOfImage[pickerViewLeft.selectedRowInComponent(0)]
            
            let name2 = itemsToPicker!.namesOfImage[pickerViewMiddle.selectedRowInComponent(0)]
            
            let name3 = itemsToPicker!.namesOfImage[pickerViewRight.selectedRowInComponent(0)]
            
            if name1 == name2 && name2 == name3 {
                scoreLabel.text = "Winner"
            } else {
                scoreLabel.text = "Sorry...Try Again"
            }
            spinButton.hidden = false
            
        }
        
        
        //var randomnumber = getRandomNumber(200)
        
        
        //var i  = pickerViewLeft.selectedRowInComponent(0)
        //pickerViewLeft.selectRow( randomnumber, inComponent: 0, animated: true)

//        if i < randomnumber {
//            while i <= randomnumber {
//                pickerViewLeft.selectRow( ++i % 200, inComponent: 0, animated: true)
//            }
//        } else {
//            while i >= randomnumber {
//                pickerViewLeft.selectRow( --i % 200, inComponent: 0, animated: true)
//            }
//        }
        
        //randomnumber = getRandomNumber(200)
        //pickerViewMiddle.selectRow( randomnumber, inComponent: 0, animated: true)
        //i  = pickerViewMiddle.selectedRowInComponent(0)
        //print(i)
        //print(randomnumber)
//        if i < randomnumber {
//            while i <= randomnumber {
//                pickerViewMiddle.selectRow( ++i % 200, inComponent: 0, animated: true)
//            }
//        } else {
//            while i >= randomnumber {
//                pickerViewMiddle.selectRow( --i % 200, inComponent: 0, animated: true)
//            }
//        }
        
        //randomnumber = Int(arc4random_uniform(200))
        //pickerViewRight.selectRow( randomnumber, inComponent: 0, animated: true)
//        while (randomnumber == 0 || randomnumber == 199) {
//            randomnumber = Int(arc4random_uniform(200))
//        }
//        i = pickerViewRight.selectedRowInComponent(0)
        //print(i)
        //print(randomnumber)
//        if i < randomnumber {
//            while i <= randomnumber {
//                pickerViewRight.selectRow( ++i % 200, inComponent: 0, animated: true)
//            }
//        } else {
//            while i >= randomnumber {
//                pickerViewRight.selectRow( --i % 200, inComponent: 0, animated: true)
//            }
//        }
        
        
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

