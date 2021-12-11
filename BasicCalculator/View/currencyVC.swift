//
//  currencyVC.swift
//  BasicCalculator
//
//  Created by cem on 11.12.2021.
//

import UIKit

class currencyVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var currencyLabel: UILabel!
    
    var currencyCode: [String] = []
    var values:[Double] = []
    var activeCurrency = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        fetchJSON()
        textField.addTarget(self, action: #selector(updateViews), for: .editingChanged)
    }
    @objc func updateViews(input:Double){
        guard  let amountText = textField.text, let theAmountText = Double(amountText) else {return}
        if textField.text != ""{
            let total = theAmountText * activeCurrency
            currencyLabel.text = String(format:"%.2f", total)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyCode.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyCode[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activeCurrency = values[row]
        updateViews(input: activeCurrency)
    }
    
    
    func fetchJSON()
    {
     
        guard let url = URL(string: "https://open.er-api.com/v6/latest/EUR") else {return}
        URLSession.shared.dataTask(with: url) { data, responce, error in
            
            if error != nil{
                print(error!)
                return
            }
            guard let safeData = data else {return}
            
            
            do {
                let result = try JSONDecoder().decode(Change.self, from: safeData)
                self.currencyCode.append(contentsOf: result.rates.keys)
                self.values.append(contentsOf: result.rates.values)
                DispatchQueue.main.async {
                    self.pickerView.reloadAllComponents()
                    print("no problemo")
                }
            }catch{
                print(error)
            }
            
            
        }.resume()
        
        
    }


}
