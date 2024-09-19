//
//  TravellingViewModel.swift
//  App908
//
//  Created by IGOR on 15/09/2024.
//

import SwiftUI
import CoreData

final class TravellingViewModel: ObservableObject {
    
    @AppStorage("tickets") var tickets: Int = 0

    @AppStorage("ta") var ta: Int = 0
    @AppStorage("tt") var tt: Int = 1
    @Published var addTA: String = ""
    @Published var addTT: String = ""

    @Published var isAdd: Bool = false
    @Published var isAddTask: Bool = false
    @Published var isData: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isCategories: Bool = false
    
    @Published var taskTypes: [String] = ["Medicine", "Transport", "Gathering things", "Place of residence", "Entertaiment", "Other"]
    @Published var curTaskType: String = "Medicine"
    
    @Published var periods: [String] = ["In 30 min", "In a hour", "In 2 hours", "In a day", "In a week", "For the month"]
    @Published var curPeriod: String = "In 30 min"
    
    @Published var transports: [String] = ["Aircraft", "Train", "Car", "Bus", "Ferry", "Linner", "Motorboat"]
    @Published var curTrans: String = ""
    
    @Published var places: [String] = ["Hotel", "Rented flat", "Own accommodation", "Hostel", "Rent a house", "Villa"]
    @Published var curPlace: String = ""
    
    @Published var holidays: [String] = ["Passive holiday", "Beach", "Concert", "BuActive holidays", "City tour", "Sick leave", "Adventure", "Educational"]
    @Published var curHoliday: String = ""
    
    
    @Published var trName: String = ""
    @Published var trCountry: String = ""
    @Published var trCity: String = ""
    @Published var trTrans: String = ""
    @Published var trPlace: String = ""
    @Published var trHoliday: String = ""
    @Published var trDep: Date = Date()
    @Published var trArrival: Date = Date()
    
    @Published var travellings: [TravelModel] = []
    @Published var selectedTrav: TravelModel?
    
    func addTrav() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TravelModel", into: context) as! TravelModel

        loan.trName = trName
        loan.trCountry = trCountry
        loan.trCity = trCity
        loan.trTrans = trTrans
        loan.trPlace = trPlace
        loan.trHoliday = trHoliday
        loan.trDep = trDep
        loan.trArrival = trArrival

        CoreDataStack.shared.saveContext()
    }

    func fetchTravs() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TravelModel>(entityName: "TravelModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.travellings = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.travellings = []
        }
    }
    
    @Published var taskName: String = ""
    @Published var taskDescr: String = ""
    @Published var taskType: String = ""
    @Published var taskTimeType: String = ""
    @Published var taskTime: Date = Date()
    @Published var taskDate: Date = Date()
    
    @Published var taskss: [TasksModel] = []
    @Published var selectedTaskss: TasksModel?
    
    func addTaskss() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TasksModel", into: context) as! TasksModel

        loan.taskName = taskName
        loan.taskDescr = taskDescr
        loan.taskType = taskType
        loan.taskTimeType = taskTimeType
        loan.taskTime = taskTime
        loan.taskDate = taskDate

        CoreDataStack.shared.saveContext()
    }

    func fetchTaskss() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TasksModel>(entityName: "TasksModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.taskss = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.taskss = []
        }
    }

}
