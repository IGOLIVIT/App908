//
//  MoodViewModel.swift
//  App908
//
//  Created by IGOR on 03/10/2024.
//

import SwiftUI
import CoreData

final class MoodViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isScale: Bool = false

    @Published var smiles: [String] = ["s1", "s2", "s3", "s4", "s5"]
    @Published var curSmile: String = ""
    
    @Published var emotions: [String] = ["Joy", "Relaxed", "Pride", "Happy", "Lover", "Awaiting", "Energetic", "Anger", "Tired", "Bored", "Stress", "Sadness"]
    @Published var curEmotion: String = ""
    
    @Published var weathers: [String] = ["Sunny", "Cloudy", "Rain", "Cold", "Windy", "Hot"]
    @Published var curWeather: String = ""

    @Published var moTNumber: String = ""
    @Published var moEmo: String = ""
    @Published var moWeather: String = ""
    @Published var moDay: String = ""
    @Published var moDescr: String = ""
    
    @AppStorage("perfectly") var perfectly: String = ""
    @AppStorage("good") var good: String = ""
    @AppStorage("normally") var normally: String = ""
    @AppStorage("badly") var badly: String = ""
    @AppStorage("bad") var bad: String = ""
    
    @Published var addPerf: String = ""
    @Published var addGood: String = ""
    @Published var addNorm: String = ""
    @Published var addBadly: String = ""
    @Published var addBad: String = ""

    @Published var moods: [MoodModel] = []
    @Published var selectedMood: MoodModel?
    
    func addMood() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "MoodModel", into: context) as! MoodModel

        loan.moTNumber = moTNumber
        loan.moEmo = moEmo
        loan.moWeather = moWeather
        loan.moDay = moDay
        loan.moDescr = moDescr

        CoreDataStack.shared.saveContext()
    }

    func fetchMoods() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MoodModel>(entityName: "MoodModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.moods = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.moods = []
        }
    }

}
