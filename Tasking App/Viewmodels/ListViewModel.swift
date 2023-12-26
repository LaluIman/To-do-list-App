//
//  ListViewModel.swift
//  Tasking App
//
//  Created by Lalu Iman Abdullah on 24/12/23.
//

import Foundation

/*
 CRUD
 
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [itemModel] = [] {
        didSet{
            saveItem()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItem = try?JSONDecoder().decode([itemModel].self, from: data)
        else { return }
        
        self.items = saveItem
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
        saveItem()
    }
    
    func moveItem(from: IndexSet, to : Int) {
        items.move(fromOffsets: from, toOffset: to)
        saveItem()
    }
    
    func addItem(title: String){
        let newItem = itemModel(title: title, isCompletd: false)
        items.append(newItem)
    }
    
    func upadateItem(item: itemModel){
        
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        }{
////            run tihs code
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
        
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
     
}
