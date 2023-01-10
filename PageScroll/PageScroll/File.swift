//
//  File.swift
//  PageScroll
//
//  Created by Hoàng Loan on 10/01/2023.
//

import UIKit

func createSlides() -> [Slide] {
    let slide1: Slide = Bundle.main.loadNibNamed("Slide", owner: Slide.self)?.first as! Slide
    let slide2: Slide = Bundle.main.loadNibNamed("Slide", owner: Slide.self)?.first as! Slide
    let slide3: Slide = Bundle.main.loadNibNamed("Slide", owner: Slide.self)?.first as! Slide
    let slide4: Slide = Bundle.main.loadNibNamed("Slide", owner: Slide.self)?.first as! Slide
    
    slide1.imageView.image = UIImage(named: "dongsong")
    slide1.titleLabel.text = "Rừng Núi Bao La"
    slide1.detalLabel.text = "Thiên nhiên nước ta đa dạng và có nhiều cảnh đẹp trải dài 3 miền Tổ quốc, mỗi địa danh lại có những đặc trưng riêng khiến bất kì ai đặt chân đến đều mê say"
    
    slide2.imageView.image = UIImage(named: "nuimuadong")
    slide2.titleLabel.text = "Rừng Núi Bao La"
    slide2.detalLabel.text = "Thiên nhiên nước ta đa dạng và có nhiều cảnh đẹp trải dài 3 miền Tổ quốc, mỗi địa danh lại có những đặc trưng riêng khiến bất kì ai đặt chân đến đều mê say"
    
    slide3.imageView.image = UIImage(named: "nuirungdep")
    slide3.titleLabel.text = "Rừng Núi Bao La"
    slide3.detalLabel.text = "Thiên nhiên nước ta đa dạng và có nhiều cảnh đẹp trải dài 3 miền Tổ quốc, mỗi địa danh lại có những đặc trưng riêng khiến bất kì ai đặt chân đến đều mê say"
    
    slide4.imageView.image = UIImage(named: "ruongbacthang")
    slide4.titleLabel.text = "Rừng Núi Bao La"
    slide4.detalLabel.text = "Thiên nhiên nước ta đa dạng và có nhiều cảnh đẹp trải dài 3 miền Tổ quốc, mỗi địa danh lại có những đặc trưng riêng khiến bất kì ai đặt chân đến đều mê say"
    
    return [slide1, slide2, slide3, slide4]
}


