//
//  DataService.swift
//  Internet store
//
//  Created by Iza on 10.01.2017.
//  Copyright © 2017 Iza. All rights reserved.
//

import Foundation

class dataService {
    static let instance = dataService()
    
    private let categories = [
        Category(Title: "Podkłady", imageName: "podklad.png"),
        Category(Title: "Cienie", imageName: "cien.png"),
        Category(Title: "Korektory", imageName: "korektor.png"),
        Category(Title: "Tusze do rzęs", imageName: "tusz.png"),
        Category(Title: "Szminki do ust", imageName: "szminka.png")
    ]
    
    private let podklady = [
        Product(_id: "A1" ,_name: "Diorskin Forever Nr. 020", _description: "Gama Diorskin Forever od lat dba o doskonałą cerę kobiet na całym świecie. Laboratoria Dior wraz z ekspertami ds. makijażu, prezentują ekstremalny podkład Diorskin Forever Undercover. Ten maksymalnie kryjący podkład na bazie wody łączy w sobie trwałość do 24 godzin* oraz naturalność i świeże, matowe wykończenie", _amount: "40 ml", _price: 185, _imagesList: ["podklad1a.png", "podklad1b.png"], _brand: "Dior"),
        
        Product(_id: "A2" ,_name: "ESTÉE LAUDER Double Wear Stay-in-Place Podkład SPF 10", _description: "GCiepło, wilgoć, intensywna aktywność, to nie ma znaczenia! Pewna jego działania i pewna siebie od rana do wieczora.Dzięki długotrwałej i niezmiennej formule SPF 10, podkład Double Wear gwarantuje perfekcyjną cerę i świeżą skórę przez cały dzień. 15 godzin trwałości, jest odporny na ciepło i wilgoć. Komfortowy, nietłusty, niezmieniający się, kontroluje nadmiar wydzielanego sebum.", _amount: "30 ml", _price: 189, _imagesList: ["dw.png"], _brand: "Estee Lauder")
        
    ]
    
    private let cienie = [
        Product(_id: "B1", _name: "Le Prisme Superstellar", _description: "Kolekcja makijażu Givenchy zaprasza do świata fantazji. Gwiazda kolekcji, Le Prisme Superstellar to limitowana paleta trzech, intensywnych cieni do powiek inspirowanych fantastycznym światem kobiety - super bohaterki. Rewolucyjna, hybrydowa, kremowo-pudrowa formuła. Intensywne, śmiałe kolory. Makijaż, który w każdej kobiecie odkryje super bohaterkę.", _amount: "4 g", _price: 295, _imagesList: ["cien1a.png"], _brand: "Givenchy"),
        Product(_id: "B2", _name: "HUDA BEAUTY Rose Gold Palette Remastered", _description: "Paleta cieni do powiek Rose Gold REMASTERED powraca z 18 całkowicie przeformułowanymi odcieniami, w tym 8 łatwymi do wymieszania kremowymi matami, 8 ultra-błyszczącymi, ultra-błyszczącymi metalicznymi rumieńcami, 1 czarny głęboki do użycia na mokro do precyzyjnej linii eyelinera lub suche dla efektu dymu, 1 masa perłowa przyciśnięta, aby rozświetlić twój wygląd.", _amount: "10 g", _price: 299, _imagesList: ["huda.png"], _brand: "Huda Beauty")
        
    ]
    
    private let korektory = [
        Product(_id: "C1", _name: "All Hours Concealer", _description: "Korektor Encre De Peau All Hours zapewnia efekt perfekcyjnego makijażu nawet do 16 godzin. Odkryj trzeci krok do uzyskania pięknej cery. Encre De Peau All Hours od Yves Saint Laurent to korektor, który pomaga zmniejszyć widoczność niedoskonałości.Jego wygładzająca formuła wzbogacona oczyszczonymi pigmentami pozwala ukryć cienie pod oczami i przebarwienia, byś mogła cieszyć się idealną cerą oraz matowym makijażem nawet przez 16 godzin. Aksamitna konsystencja produktu została poddana wymagającym testom i jest odporna na wysokie temperatury.", _amount: "5 ml", _price: 160, _imagesList: ["korektor1a.png", "korektor1b.png", "korektor1c.png"], _brand: "Yves Saint Laurent")
    ]
    
    private let tusze = [
        Product(_id: "D1", _name: "Hypnôse Doll Eyes", _description: "Osiągnij efekt doll-eyed look z innowacyjną maskarą Lancôme Hypnôse Doll Eyes. Must have wśród maskar stworzony dla spektakularnie podkręconych i wydłużonych rzęs! Hypnôse Doll Eyes od Lancôme ma lekką formułę, by ułatwiać równomierne rozprowadzanie podczas aplikacji. Wystarczy jeden ruch, aby pokryć rzęsy od nasady aż po same końce bez ich obciążania. Wykorzystaj szczoteczkę Lancôme w kształcie stożka i zobacz, jak ekstremalnie podkręcone mogą być Twoje rzęsy!", _amount: "5 ml", _price: 155, _imagesList: ["tusz1a.png"], _brand: "Lancôme")
    ]
    
    private let szminki = [
        Product(_id: "E1", _name: "Naughty is the new nice", _description: "The Kylie Cosmetics Metal Liquid Lipstick Lip Kit is your secret weapon to create the perfect 'Kylie Lip.' Each Lip Kit comes with a Metal Liquid Lipstick and matching Lip Liner. Naughty Is The New Nice is a metallic rosy red.", _amount: "3 g", _price: 99, _imagesList: ["szminka1a.png", "szminka1b.png", "szminka1c.png"], _brand: "Kylie Cosmetics")
    ]
    
    func getCategory() -> [Category] {
        return categories
    }
    
    func GetProduct(forCategoryTitle title: String) -> [Product] {
        switch title {
        case "Podkłady":
            return getPodklady()
        case "Cienie":
            return getCienie()
        case "Korektory":
            return getKorektory()
        case "Tusze do rzęs":
            return getTusze()
        case  "Szminki do ust":
            return getSzminki()
        default:
            return getSzminki()
        }
    }
    
    func getPodklady() -> [Product] {
        return podklady
    }
    
    func getCienie() -> [Product] {
        return cienie
    }
    
    func getKorektory() -> [Product] {
        return korektory
    }
    
    func getTusze() -> [Product] {
        return tusze
    }
    
    func getSzminki() -> [Product] {
        return szminki
    }
}
