//
//  HomeViewModel.swift
//  App908
//
//  Created by IGOR on 15/09/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @AppStorage("ta") var ta: Int = 0
    @AppStorage("tt") var tt: Int = 0
    @Published var addTA: String = ""
    @Published var addTT: String = ""

    @Published var isAdd: Bool = false
    @Published var isData: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isCategories: Bool = false
    @Published var isEvent2: Bool = false
    @Published var isMood: Bool = false

    @Published var isOn: Bool = false
    @Published var isEvent: Bool = false
    
    @Published var catName: String = ""
    @Published var catTA: String = ""
    @Published var catTT: String = ""
    
    @Published var categories: [CatModel] = []
    @Published var selectedCategory: CatModel?
    
    func addCategory() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CatModel", into: context) as! CatModel

        loan.catName = catName
        loan.catTT = Int16(Int(catTT) ?? 1)
        loan.catTA = Int16(Int(catTA) ?? 0)

        CoreDataStack.shared.saveContext()
    }

    func fetchCategories() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CatModel>(entityName: "CatModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.categories = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.categories = []
        }
    }
    
    func calculatePercentage() -> Double {
        
        let value = ta
        let maxValue = tt
        
        let percentCircle = Double(value) / Double(maxValue) * 100
        
        return percentCircle
    }
    
    func calculatePercentage2() -> Double {
        
        let value = Int(catTA) ?? 0
        let maxValue = Int(catTT) ?? 1
        
        let percentCircle = Double(value) / Double(maxValue) * 100
        
        return percentCircle
    }
    
}
