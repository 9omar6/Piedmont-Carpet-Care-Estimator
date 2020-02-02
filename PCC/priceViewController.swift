//
//  priceViewController.swift
//  PCC
//
//  Created by Omar Aguirre on 12/17/19.
//  Copyright © 2019 Aguirre. All rights reserved.
//

import UIKit
import CoreData

class priceViewController: UIViewController {
    
    override func viewDidLoad() {
        hardwood.adjustsFontSizeToFitWidth = true
        hardwood.minimumScaleFactor = 0.2
        
        getData()
        price.text = "\(priceSave1)"
        range.text = "\(rangeSave1)"
        price2.text = "\(priceSave2)"
        range2.text = "\(rangeSave2)"
        price3.text = "\(priceSave3)"
        range3.text = "\(rangeSave3)"
        price4.text = "\(priceSave4)"
        range4.text = "\(rangeSave4)"
        price5.text = "\(priceSave5)"
        range5.text = "\(rangeSave5)"
        price6.text = "\(priceSave6)"
        range6.text = "\(rangeSave6)"
        price7.text = "\(priceSave7)"
        range7.text = "\(rangeSave7)"
        price8.text = "\(priceSave8)"
        range8.text = "\(rangeSave8)"
        price9.text = "\(priceSave9)"
        range9.text = "\(rangeSave9)"
        price10.text = "\(priceSave10)"
        range10.text = "\(rangeSave10)"
        self.hideKeyboard()
        super.viewDidLoad()
    }
    
    @IBOutlet weak var hardwood: UILabel!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var range: UITextField!
    @IBOutlet weak var price2: UITextField!
    @IBOutlet weak var range2: UITextField!
    @IBOutlet weak var price3: UITextField!
    @IBOutlet weak var range3: UITextField!
    @IBOutlet weak var price4: UITextField!
    @IBOutlet weak var range4: UITextField!
    @IBOutlet weak var price5: UITextField!
    @IBOutlet weak var range5: UITextField!
    @IBOutlet weak var price6: UITextField!
    @IBOutlet weak var range6: UITextField!
    @IBOutlet weak var price7: UITextField!
    @IBOutlet weak var range7: UITextField!
    @IBOutlet weak var price8: UITextField!
    @IBOutlet weak var range8: UITextField!
    @IBOutlet weak var price9: UITextField!
    @IBOutlet weak var range9: UITextField!
    @IBOutlet weak var price10: UITextField!
    @IBOutlet weak var range10: UITextField!

    var priceSave1 = 0.0
    var rangeSave1 = 0.0
    var priceSave2 = 0.0
    var rangeSave2 = 0.0
    var priceSave3 = 0.0
    var rangeSave3 = 0.0
    var priceSave4 = 0.0
    var rangeSave4 = 0.0
    var priceSave5 = 0.0
    var rangeSave5 = 0.0
    var priceSave6 = 0.0
    var rangeSave6 = 0.0
    var priceSave7 = 0.0
    var rangeSave7 = 0.0
    var priceSave8 = 0.0
    var rangeSave8 = 0.0
    var priceSave9 = 0.0
    var rangeSave9 = 0.0
    var priceSave10 = 0.0
    var rangeSave10 = 0.0
    
    
    @IBAction func savePrice(_ sender: Any){
        priceSave1 = Double(price.text!) ?? 0
        rangeSave1 = Double(range.text!) ?? 0
        priceSave2 = Double(price2.text!) ?? 0
        rangeSave2 = Double(range2.text!) ?? 0
        priceSave3 = Double(price3.text!) ?? 0
        rangeSave3 = Double(range3.text!) ?? 0
        priceSave4 = Double(price4.text!) ?? 0
        rangeSave4 = Double(range4.text!) ?? 0
        priceSave5 = Double(price5.text!) ?? 0
        rangeSave5 = Double(range5.text!) ?? 0
        priceSave6 = Double(price6.text!) ?? 0
        rangeSave6 = Double(range6.text!) ?? 0
        priceSave7 = Double(price7.text!) ?? 0
        rangeSave7 = Double(range7.text!) ?? 0
        priceSave8 = Double(price8.text!) ?? 0
        rangeSave8 = Double(range8.text!) ?? 0
        priceSave9 = Double(price9.text!) ?? 0
        rangeSave9 = Double(range9.text!) ?? 0
        priceSave10 = Double(price10.text!) ?? 0
        rangeSave10 = Double(range10.text!) ?? 0
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntity.setValue(priceSave1, forKey: "price1")
        newEntity.setValue(rangeSave1, forKey: "range1")
        newEntity.setValue(priceSave2, forKey: "price2")
        newEntity.setValue(rangeSave2, forKey: "range2")
        newEntity.setValue(priceSave3, forKey: "price3")
        newEntity.setValue(rangeSave3, forKey: "range3")
        newEntity.setValue(priceSave4, forKey: "price4")
        newEntity.setValue(rangeSave4, forKey: "range4")
        newEntity.setValue(priceSave5, forKey: "price5")
        newEntity.setValue(rangeSave5, forKey: "range5")
        newEntity.setValue(priceSave6, forKey: "price6")
        newEntity.setValue(rangeSave6, forKey: "range6")
        newEntity.setValue(priceSave7, forKey: "price7")
        newEntity.setValue(rangeSave7, forKey: "range7")
        newEntity.setValue(priceSave8, forKey: "price8")
        newEntity.setValue(rangeSave8, forKey: "range8")
        newEntity.setValue(priceSave9, forKey: "price9")
        newEntity.setValue(rangeSave9, forKey: "range9")
        newEntity.setValue(priceSave10, forKey: "price10")
        newEntity.setValue(rangeSave10, forKey: "range10")
        
        do {
            try context.save()
            print("SAVED")
        }catch {
            print("FAILED")
        }
        
        //performSegue(withIdentifier: "saved", sender: self)
        
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                priceSave1 = data.value(forKey: "price1") as! Double
                rangeSave1 = data.value(forKey: "range1") as! Double
                priceSave2 = data.value(forKey: "price2") as! Double
                rangeSave2 = data.value(forKey: "range2") as! Double
                priceSave3 = data.value(forKey: "price3") as! Double
                rangeSave3 = data.value(forKey: "range3") as! Double
                priceSave4 = data.value(forKey: "price4") as! Double
                rangeSave4 = data.value(forKey: "range4") as! Double
                priceSave5 = data.value(forKey: "price5") as! Double
                rangeSave5 = data.value(forKey: "range5") as! Double
                priceSave6 = data.value(forKey: "price6") as! Double
                rangeSave6 = data.value(forKey: "range6") as! Double
                priceSave7 = data.value(forKey: "price7") as! Double
                rangeSave7 = data.value(forKey: "range7") as! Double
                priceSave8 = data.value(forKey: "price8") as! Double
                rangeSave8 = data.value(forKey: "range8") as! Double
                priceSave9 = data.value(forKey: "price9") as! Double
                rangeSave9 = data.value(forKey: "range9") as! Double
                priceSave10 = data.value(forKey: "price10") as! Double
                rangeSave10 = data.value(forKey: "range10") as! Double
            }
        }catch {
                print("FAILED TO GET DATA")
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        
        vc.price1 = priceSave1
        vc.range1 = rangeSave1
        vc.price2 = priceSave2
        vc.range2 = rangeSave2
        vc.price3 = priceSave3
        vc.range3 = rangeSave3
        vc.price4 = priceSave4
        vc.range4 = rangeSave4
        vc.price5 = priceSave5
        vc.range5 = rangeSave5
        vc.price6 = priceSave6
        vc.range6 = rangeSave6
        vc.price7 = priceSave7
        vc.range7 = rangeSave7
        vc.price8 = priceSave8
        vc.range8 = rangeSave8
        vc.price9 = priceSave9
        vc.range9 = rangeSave9
        vc.price10 = priceSave10
        vc.range10 = rangeSave10
        
        
    }
    
    func hideKeyboard(){
        self.view.addGestureRecognizer(self.endRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endRecognizer())
    }
    
    private func endRecognizer() -> UIGestureRecognizer{
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
   

}
