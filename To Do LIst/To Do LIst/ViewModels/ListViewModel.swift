//
//  ListViewModel.swift
//  To Do LIst
//
//  Created by Hlwan Aung Phyo on 2024/06/17.
//

import Foundation

class ListViewModel : ObservableObject{
    
    let itemsKey:String = "itemsKey"
    
    
    @Published var items : [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    
        
    init(){
        getItems()
    }
    func getItems(){
//        let newItems = [
//            ItemModel(title: "first", isCompleted: false),
//            ItemModel(title: "second", isCompleted: true),
//            ItemModel(title: "third", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
            
    
    func deleteItem(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from:IndexSet,to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodedDate = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedDate, forKey: itemsKey)
        }
    }
}

