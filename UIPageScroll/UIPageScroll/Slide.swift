//
//  Slide.swift
//  UIPageScroll
//
//  Created by Hoàng Loan on 10/01/2023.
//

import UIKit

class Slide: UIView {

    @IBOutlet weak var imageView: UIImageView!    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var detailLable: UILabel!
}

func createSlide() -> [Slide] {
    let detailLabel = "Thiên nhiên là người bạn tốt của con người. Thiên nhiên, đó là rừng vàng mang lại cho ta một lượng gỗ khổng lồ, muôn vàn loại thảo dược quý hiếm, những động vật thú vị, một bầu khí quyển trong lành và vô vàn loại khoáng sản quý báu."
    
    let slide1: Slide = Bundle.main.loadNibNamed("Slide", owner: Slide.self)?.first as! Slide
    let slide2: Slide = Bundle.main.loadNibNamed("Slide", owner: Slide.self)?.first as! Slide
    let slide3: Slide = Bundle.main.loadNibNamed("Slide", owner: Slide.self)?.first as! Slide
    let slide4: Slide = Bundle.main.loadNibNamed("slide", owner: Slide.self)?.first as! Slide
    
    slide1.imageView.image = UIImage(named: "nuimuadong")
    slide1.titleLable.text = "Vẻ Đẹp Thiên Nhiên"
    slide1.detailLable.text = detailLabel
    
    slide1.imageView.image = UIImage(named: "nuirungdep")
    slide1.titleLable.text = "Vẻ Đẹp Thiên Nhiên"
    slide1.detailLable.text = detailLabel
    
    slide1.imageView.image = UIImage(named: "ruongbacthang")
    slide1.titleLable.text = "Vẻ Đẹp Thiên Nhiên"
    slide1.detailLable.text = detailLabel
    
    slide1.imageView.image = UIImage(named: "suongmu")
    slide1.titleLable.text = "Vẻ Đẹp Thiên Nhiên"
    slide1.detailLable.text = detailLabel
    

    return [slide1, slide2, slide3, slide4]
    
}
