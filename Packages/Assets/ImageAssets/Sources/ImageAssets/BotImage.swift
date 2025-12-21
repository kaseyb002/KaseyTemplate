import SwiftUI

public enum BotImage: Equatable {
    case adamSmith
    case alexander
    case argerich
    case austen
    case bach
    case beethoven
    case burke
    case cantor
    case chopin
    case coase
    case coltrane
    case copernicus
    case copland
    case curry
    case descartes
    case dickinson
    case dostoevsky
    case friedman
    case gibbons
    case goya
    case hakeem
    case hara
    case hawthorne
    case hayek
    case haytham
    case hugo
    case hume
    case ives
    case janeJacobs
    case jobs
    case johnCage
    case kant
    case kierkegaard
    case kurosawa
    case mizoguchi
    case mozart
    case nozick
    case ozu
    case pascal
    case plato
    case richardEpstein
    case russRoberts
    case ryu
    case schumpeter
    case seneca
    case stockton
    case tesla
    case thoburn
    case vermeer
    case woolf
    
    public var image: Image {
        switch self {
        case .adamSmith:
            Image(.FamousBots.adamSmith)
        case .alexander:
            Image(.FamousBots.alexander)
        case .argerich:
            Image(.FamousBots.argerich)
        case .austen:
            Image(.FamousBots.austen)
        case .bach:
            Image(.FamousBots.bach)
        case .beethoven:
            Image(.FamousBots.beethoven)
        case .burke:
            Image(.FamousBots.burke)
        case .cantor:
            Image(.FamousBots.cantor)
        case .chopin:
            Image(.FamousBots.chopin)
        case .coase:
            Image(.FamousBots.coase)
        case .coltrane:
            Image(.FamousBots.coltrane)
        case .copernicus:
            Image(.FamousBots.copernicus)
        case .copland:
            Image(.FamousBots.copland)
        case .curry:
            Image(.FamousBots.curry)
        case .descartes:
            Image(.FamousBots.descartes)
        case .dickinson:
            Image(.FamousBots.dickinson)
        case .dostoevsky:
            Image(.FamousBots.dostoevsky)
        case .friedman:
            Image(.FamousBots.friedman)
        case .gibbons:
            Image(.FamousBots.gibbons)
        case .goya:
            Image(.FamousBots.goya)
        case .hakeem:
            Image(.FamousBots.hakeem)
        case .hara:
            Image(.FamousBots.hara)
        case .hawthorne:
            Image(.FamousBots.hawthorne)
        case .hayek:
            Image(.FamousBots.hayek)
        case .haytham:
            Image(.FamousBots.haytham)
        case .hugo:
            Image(.FamousBots.hugo)
        case .hume:
            Image(.FamousBots.hume)
        case .ives:
            Image(.FamousBots.ives)
        case .janeJacobs:
            Image(.FamousBots.janeJacobs)
        case .jobs:
            Image(.FamousBots.jobs)
        case .johnCage:
            Image(.FamousBots.johnCage)
        case .kant:
            Image(.FamousBots.kant)
        case .kierkegaard:
            Image(.FamousBots.kierkegaard)
        case .kurosawa:
            Image(.FamousBots.kurosawa)
        case .mizoguchi:
            Image(.FamousBots.mizoguchi)
        case .mozart:
            Image(.FamousBots.mozart)
        case .nozick:
            Image(.FamousBots.nozick)
        case .ozu:
            Image(.FamousBots.ozu)
        case .pascal:
            Image(.FamousBots.pascal)
        case .plato:
            Image(.FamousBots.plato)
        case .richardEpstein:
            Image(.FamousBots.richardEpstein)
        case .russRoberts:
            Image(.FamousBots.russRoberts)
        case .ryu:
            Image(.FamousBots.ryu)
        case .schumpeter:
            Image(.FamousBots.schumpeter)
        case .seneca:
            Image(.FamousBots.seneca)
        case .stockton:
            Image(.FamousBots.stockton)
        case .tesla:
            Image(.FamousBots.tesla)
        case .thoburn:
            Image(.FamousBots.thoburn)
        case .vermeer:
            Image(.FamousBots.vermeer)
        case .woolf:
            Image(.FamousBots.woolf)
        }
    }
    
    public var uiImage: UIImage {
        switch self {
        case .adamSmith:
            UIImage(resource: .FamousBots.adamSmith)
        case .alexander:
            UIImage(resource: .FamousBots.alexander)
        case .argerich:
            UIImage(resource: .FamousBots.argerich)
        case .austen:
            UIImage(resource: .FamousBots.austen)
        case .bach:
            UIImage(resource: .FamousBots.bach)
        case .beethoven:
            UIImage(resource: .FamousBots.beethoven)
        case .burke:
            UIImage(resource: .FamousBots.burke)
        case .cantor:
            UIImage(resource: .FamousBots.cantor)
        case .chopin:
            UIImage(resource: .FamousBots.chopin)
        case .coase:
            UIImage(resource: .FamousBots.coase)
        case .coltrane:
            UIImage(resource: .FamousBots.coltrane)
        case .copernicus:
            UIImage(resource: .FamousBots.copernicus)
        case .copland:
            UIImage(resource: .FamousBots.copland)
        case .curry:
            UIImage(resource: .FamousBots.curry)
        case .descartes:
            UIImage(resource: .FamousBots.descartes)
        case .dickinson:
            UIImage(resource: .FamousBots.dickinson)
        case .dostoevsky:
            UIImage(resource: .FamousBots.dostoevsky)
        case .friedman:
            UIImage(resource: .FamousBots.friedman)
        case .gibbons:
            UIImage(resource: .FamousBots.gibbons)
        case .goya:
            UIImage(resource: .FamousBots.goya)
        case .hakeem:
            UIImage(resource: .FamousBots.hakeem)
        case .hara:
            UIImage(resource: .FamousBots.hara)
        case .hawthorne:
            UIImage(resource: .FamousBots.hawthorne)
        case .hayek:
            UIImage(resource: .FamousBots.hayek)
        case .haytham:
            UIImage(resource: .FamousBots.haytham)
        case .hugo:
            UIImage(resource: .FamousBots.hugo)
        case .hume:
            UIImage(resource: .FamousBots.hume)
        case .ives:
            UIImage(resource: .FamousBots.ives)
        case .janeJacobs:
            UIImage(resource: .FamousBots.janeJacobs)
        case .jobs:
            UIImage(resource: .FamousBots.jobs)
        case .johnCage:
            UIImage(resource: .FamousBots.johnCage)
        case .kant:
            UIImage(resource: .FamousBots.kant)
        case .kierkegaard:
            UIImage(resource: .FamousBots.kierkegaard)
        case .kurosawa:
            UIImage(resource: .FamousBots.kurosawa)
        case .mizoguchi:
            UIImage(resource: .FamousBots.mizoguchi)
        case .mozart:
            UIImage(resource: .FamousBots.mozart)
        case .nozick:
            UIImage(resource: .FamousBots.nozick)
        case .ozu:
            UIImage(resource: .FamousBots.ozu)
        case .pascal:
            UIImage(resource: .FamousBots.pascal)
        case .plato:
            UIImage(resource: .FamousBots.plato)
        case .richardEpstein:
            UIImage(resource: .FamousBots.richardEpstein)
        case .russRoberts:
            UIImage(resource: .FamousBots.russRoberts)
        case .ryu:
            UIImage(resource: .FamousBots.ryu)
        case .schumpeter:
            UIImage(resource: .FamousBots.schumpeter)
        case .seneca:
            UIImage(resource: .FamousBots.seneca)
        case .stockton:
            UIImage(resource: .FamousBots.stockton)
        case .tesla:
            UIImage(resource: .FamousBots.tesla)
        case .thoburn:
            UIImage(resource: .FamousBots.thoburn)
        case .vermeer:
            UIImage(resource: .FamousBots.vermeer)
        case .woolf:
            UIImage(resource: .FamousBots.woolf)
        }
    }
}
