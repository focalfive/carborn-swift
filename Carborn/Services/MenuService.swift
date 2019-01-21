//
//  MenuService.swift
//  Carborn
//
//  Created by pureye4u on 12/01/2019.
//  Copyright © 2019 slowslipper. All rights reserved.
//

import FirebaseDatabase
import ReSwift
import RxSwift

class MenuService: StoreSubscriber {
    typealias StoreSubscriberStateType = CarState
    
    static let shared = MenuService()
    
    internal let reference = Database.database().reference()
    internal var menu: [String]?
    internal var cars: [Car]?
    internal var menuSubject: BehaviorSubject<[Menu]> = BehaviorSubject<[Menu]>(value: [])
    
    init() {
        DispatchQueue.main.async {
            mainStore.subscribe(self) {
                $0.select {
                    $0.carState
                }
            }
            self.reference.child("menu").observeSingleEvent(of: .value, with: { snapshot in
                if let value = snapshot.value as? [String] {
                    print("menu subscribe")
                    self.menu = value
                    self.createMenu()
                }
            }) { error in
                print(error.localizedDescription)
            }
        }
    }
    
    internal func newState(state: CarState) {
        cars = state.collection
        createMenu()
    }
    
    func get() -> Observable<[Menu]> {
        return menuSubject.asObservable()
    }
    
    internal func createMenu() {
//        print("createMenu", cars, menu)
        guard let cars = cars, cars.count > 0, let menu = menu, menu.count > 0 else {
            return
        }
        
        guard let rootMenu = menu.first else {
            return
        }
        
        var newMenu: [Menu]?
        switch rootMenu {
        case "brand":
            newMenu = getMenuFromBrands(cars: cars)
        default: break
        }
        
        self.cars = nil
        self.menu = nil
        
        if let menu = newMenu {
            menuSubject.onNext(menu)
        }
    }
    
    internal func getBrands(cars: [Car]) -> [String] {
        guard cars.count > 0 else {
            return []
        }
        
        var brands: [String] = []
        _ = cars.map {
            let brand = $0.brand
            if brands.firstIndex(of: brand) == nil {
                brands.append(brand)
            }
        }
        return brands
    }
    
    internal func getMenuFromBrands(cars: [Car]) -> [Menu] {
        let brands = getBrands(cars: cars)
        return brands.map {
            var menu = Menu()
            menu.name = $0
            return menu
        }
    }
    
}
