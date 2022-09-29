//
//  PizzaData.swift
//  UIKit_DZ_Swift2.0
//
//  Created by Ernest Avagovich on 28.09.2022.
//

import Foundation

/// Описывает название пиццы и картинку
///  name - Название пиццы
///  imageName - Название картинки пиццы
struct Pizza {
    let name: String?
    let imageName: String?
}

/// Описыввает названия ингредиентов
struct PizzaIngredients {
    let dough = "тесто"
    let mozzarella = "мацарелла"
    let tomatoSauce = "томатный соус"
    let blackPepper = "черный перец"
    let sausage = "колбаса"
    let oregano = "базелик"
    let ownJuice = "перец чили"
}
