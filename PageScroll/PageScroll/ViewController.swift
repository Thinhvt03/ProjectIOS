
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var slides : [Slide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        slides = createSlides()
       
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        
    }
    
    override func viewDidLayoutSubviews() {
        setupSlideScrollView(slides: slides)
    }
    
    private func setupSlideScrollView(slides: [Slide]) {
        
        let contentWidth = scrollView.bounds.width
        let contentHeight = scrollView.bounds.height
        scrollView.contentSize = CGSize(width: contentWidth*CGFloat(slides.count), height: contentHeight)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: contentWidth*CGFloat(i), y: 0, width: contentWidth, height: contentHeight)
            scrollView.addSubview(slides[i])
        }
        
    }
        
    @IBAction func PageControlDidPage(_ sender: Any) {

        let xOfset = scrollView.bounds.width * CGFloat(pageControl.currentPage)
        let newOfset = CGPointMake(xOfset, 0)
        scrollView.setContentOffset(newOfset, animated: true)
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
}
