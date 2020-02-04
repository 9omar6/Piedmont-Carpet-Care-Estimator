//
//  ViewController.swift
//  PCC
//
//  Created by Omar Aguirre on 12/15/19.
//  Copyright © 2019 Aguirre. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    override func viewDidLoad() {
         
          labelChoice.adjustsFontSizeToFitWidth = true
          labelChoice.minimumScaleFactor = 0.2
          
          super.viewDidLoad()
          getData()
          labelChoice.text = "\(label)"
          self.hideKeyboard()
          self.tblView.delegate = self
          self.tblView.dataSource = self
          totalPrice.text = "$0"
      }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var totalSqFt: UILabel!
    
    // insert Length/width textField
    @IBAction func addItem(_ sender: Any) {
        
        // User input
        let txtField1 = Int(textField.text!) ?? 0
        let txtField2 = Int(textField2.text!) ?? 0
        let total = txtField1 * txtField2
        
        items.append(textField.text!)
        items2.append(textField2.text!)
        items3.append(String(total))
    
        let indexPath = IndexPath(row: items.count-1, section: 0)
        let indexPath2 = IndexPath(row: items2.count-1, section: 0)
        let indexPath3 = IndexPath(row: items3.count-1, section: 0)
        
        tblView.beginUpdates()
        tblView.insertRows(at: [indexPath], with: .automatic)
        tblView.insertRows(at: [indexPath2], with: .automatic)
        tblView.insertRows(at: [indexPath3], with: .automatic)
        tblView.endUpdates()
        
        textField.text = ""
        textField2.text = ""
        view.endEditing(true)
        
        let items4 = items3.map{ Int($0)! }
        let sum = items4.reduce(0, +)
        self.totalSqFt.text = String(Int(sum))
        
        totalSum()
        
    }
    
    @IBOutlet weak var totalPrice: UILabel!

    @IBAction func calcButtong(_ sender: Any) {
        totalSum()
    }
  
    // connects tableView
    @IBOutlet weak var tblView: UITableView!
    
    var items = ["0"]
    var items2 = ["0"]
    var items3 = ["0"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblView.dequeueReusableCell(withIdentifier: "customCell") as! customCell
        
        cell.label.text = items[indexPath.row]
        cell.label2.text = items2[indexPath.row]
        cell.label4.text = items3[indexPath.row]
       
        return cell
    }
    
    // sliding delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            items.remove(at: indexPath.row)
            items2.remove(at: indexPath.row)
            items3.remove(at: indexPath.row)
            tblView.beginUpdates()
            tblView.deleteRows(at: [indexPath], with: .automatic)
            tblView.endUpdates()
        }
    }
    
    // **MENU**
    @IBOutlet weak var labelChoice: UILabel!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    var menuOut = false
    
    @IBAction func menuTapped(_ sender: Any) {
        if menuOut == false {
            leading.constant = 150
            trailing.constant = -150
            menuOut = true
        } else {
            leading.constant = 0
            trailing.constant = 0
            menuOut = false
        }
    }
    
    @IBAction func carpetTapped(_ sender: UIButton) {
        if sender.isTouchInside {
            label = "Carpet"
            labelChoice.text = "\(label)"
            savePricingSelection()
        }
    }
    
    @IBAction func hardwoodTapped(_ sender: UIButton) {
        if sender.isTouchInside {
            label = "Hardwood"
            labelChoice.text = "\(label)"
            savePricingSelection()
        }
    }
    
    // go to pricing page
    @IBAction func priceSeg(_ sender: Any) {
        performSegue(withIdentifier: "priceSegue", sender: self)
    }
    
    var price1 = 0.0
    var range1 = 0.0
    var price2 = 0.0
    var range2 = 0.0
    var price3 = 0.0
    var range3 = 0.0
    var price4 = 0.0
    var range4 = 0.0
    var price5 = 0.0
    var range5 = 0.0
    var price6 = 0.0
    var range6 = 0.0
    var price7 = 0.0
    var range7 = 0.0
    var price8 = 0.0
    var range8 = 0.0
    var price9 = 0.0
    var range9 = 0.0
    var price10 = 0.0
    var range10 = 0.0
    var label = String()
    
    func savePricingSelection(){
        
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
         let entity = NSEntityDescription.entity(forEntityName: "Entity2", in: context)
         let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntity.setValue(label, forKey: "labelChoice")
        
        do{
            try context.save()
            print("SAVED")
        } catch{
            print("FAILED")
        }
     }
    
    func getData(){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
    let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity2")
    request.returnsObjectsAsFaults = false
    request2.returnsObjectsAsFaults = false
    do {
        let result = try context.fetch(request)
        let result2 = try context.fetch(request2)
        for data in result as! [NSManagedObject]{
            price1 = data.value(forKey: "price1") as! Double
            range1 = data.value(forKey: "range1") as! Double
            price2 = data.value(forKey: "price2") as! Double
            range2 = data.value(forKey: "range2") as! Double
            price3 = data.value(forKey: "price3") as! Double
            range3 = data.value(forKey: "range3") as! Double
            price4 = data.value(forKey: "price4") as! Double
            range4 = data.value(forKey: "range4") as! Double
            price5 = data.value(forKey: "price5") as! Double
            range5 = data.value(forKey: "range5") as! Double
            price6 = data.value(forKey: "price6") as! Double
            range6 = data.value(forKey: "range6") as! Double
            price7 = data.value(forKey: "price7") as! Double
            range7 = data.value(forKey: "range7") as! Double
            price8 = data.value(forKey: "price8") as! Double
            range8 = data.value(forKey: "range8") as! Double
            price9 = data.value(forKey: "price9") as! Double
            range9 = data.value(forKey: "range9") as! Double
            price10 = data.value(forKey: "price10") as! Double
            range10 = data.value(forKey: "range10") as! Double
            
        }
        for data in result2 as! [NSManagedObject] {
            label = data.value(forKey: "labelChoice") as? String ?? ""
        }
        
    }catch {
            print("FAILED TO GET DATA")
        }
    }
    
    func getTotalPriceCarpet(){
        if ((Double(totalSqFt.text!) ?? 0) <= range1){
            let ttlPrice = (Double(totalSqFt.text!) ?? 0) * price1
            self.totalPrice.text = "$" + String(ttlPrice)
        } else if ((Double(totalSqFt.text!) ?? 0) <= range2){
            let ttlPrice = (Double(totalSqFt.text!) ?? 0) * price2
            self.totalPrice.text = "$" + String(ttlPrice)
        } else if ((Double(totalSqFt.text!) ?? 0) <= range3){
            let ttlPrice = (Double(totalSqFt.text!) ?? 0) * price3
            self.totalPrice.text = "$" + String(ttlPrice)
        }else if ((Double(totalSqFt.text!) ?? 0) <= range4){
            let ttlPrice = (Double(totalSqFt.text!) ?? 0) * price4
            self.totalPrice.text = "$" + String(ttlPrice)
        }else if ((Double(totalSqFt.text!) ?? 0) <= range5 || (Double(totalSqFt.text!) ?? 0) >= range5 ){
            let ttlPrice = (Double(totalSqFt.text!) ?? 0) * price5
            self.totalPrice.text = "$" + String(ttlPrice)
        }
    }
    
    func getTotalPriceHardwood(){
        if ((Double(totalSqFt.text!) ?? 0) <= range6){
            let ttlPrice = (Double(totalSqFt.text!) ?? 0) * price6
            self.totalPrice.text = "$" + String(ttlPrice)
        } else if ((Double(totalSqFt.text!) ?? 0) <= range7){
            let ttlPrice = (Double(totalSqFt.text!) ?? 0) * price7
            self.totalPrice.text = "$" + String(ttlPrice)
        } else if ((Double(totalSqFt.text!) ?? 0) <= range8){
            let ttlPrice = (Double(totalSqFt.text!) ?? 0) * price8
            self.totalPrice.text = "$" + String(ttlPrice)
        }else if ((Double(totalSqFt.text!) ?? 0) <= range9){
            let ttlPrice = (Double(totalSqFt.text!) ?? 0) * price9
            self.totalPrice.text = "$" + String(ttlPrice)
        }else if ((Double(totalSqFt.text!) ?? 0) <= range10 || (Double(totalSqFt.text!) ?? 0) >= range10){
            let ttlPrice = (Double(totalSqFt.text!) ?? 0) * price10
            self.totalPrice.text = "$" + String(ttlPrice)
        }
    }
    
    func totalSum(){
        let items4 = items3.map{ Int($0)! }
        let sum = items4.reduce(0, +)
        self.totalSqFt.text = String(Int(sum))
        
        if (labelChoice.text == "Carpet"){
            getTotalPriceCarpet()
        } else if (labelChoice.text == "Hardwood"){
            getTotalPriceHardwood()
        }
    }
    
}
