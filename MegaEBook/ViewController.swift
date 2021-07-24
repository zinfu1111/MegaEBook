//
//  ViewController.swift
//  MegaEBook
//
//  Created by 連振甫 on 2021/7/23.
//

import UIKit

class ViewController: UIViewController {

    let data = ["身為東京咒術高專一年級班級導師的五條悟，擁有超過190公分的高挑身材，個性雖然吊兒郎當，但卻是自己和周遭人都認同的「最強咒術師」，出自御三家之一的「五條家」，也是目前本作中最強及人氣最高的角色。雖然平常都戴著一副眼罩，但拿下眼罩的五條悟將會發動他的能力，超多人都被他拿下眼罩的那一瞬間給圈粉，編輯可以告訴大家這一幕將出現在動畫第7話、漫畫第15話，有興趣的人趕緊去看，絕對會超乎你想像精彩！",
                "本作主角，具有超乎常人的身體能力，能夠耐得住詛咒之王「兩面宿儺」的猛毒，不被對方操縱身體，是千年難得一見的奇才。為了阻止因詛咒而發生的非自然死亡事件，背負著兩面宿儺附身的詛咒，投入各種咒術迴戰。而兩面宿儺則是真實存在於日本史書《日本書記》上的人物，書中描述他有兩張背對的臉、四手四腳，雖然行動敏捷卓越，但不斷欺壓百姓，最後便被討伐。故事中虎杖吃下去的咒物就是兩面宿儺的手指，一旦虎杖切換成兩面宿儺的人格，就會大開殺戮，不管是人或是咒靈，只要他看不順眼的就會痛下殺手，但這樣殘忍的宿儺，復活後發現唯一能引起他興趣的，就是伏黑惠。",
                "與虎杖同為咒術高等專門學校的一年級學生，入學就已具有二級咒術師資格，是一年級當中唯一被允許單獨執行任務的天才。擅長以自己的影子做為媒介，召喚出各種動物式神，招式名稱為「十種影法術」，具有御三家之一「禪院家」的血脈，天賦甚至比宗家更優秀，個性謹慎小心的他，在主角群當中屬於實力超強的頭腦派。"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var pageInfoLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    private var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectData(index: 0)
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { _ in
            self.selectData(index: (self.pageControl.currentPage + self.pageControl.numberOfPages + 1) % self.pageControl.numberOfPages)
        })
    }
    @IBAction func switchAction(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex
        selectData(index: value)
    }
    
    @IBAction func changePage(_ sender: UIPageControl) {
        let value = sender.currentPage
        selectData(index: value)
    }
    
    @IBAction func preAction(_ sender: UIButton) {
        selectData(index: (pageControl.currentPage + pageControl.numberOfPages - 1) % pageControl.numberOfPages)
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        selectData(index: (pageControl.currentPage + pageControl.numberOfPages + 1) % pageControl.numberOfPages)
    }
    
    @IBAction func leftSwipeAction(){
        selectData(index: (pageControl.currentPage + pageControl.numberOfPages - 1) % pageControl.numberOfPages)
    }

    @IBAction func rightSwipeAction(){
        selectData(index: (pageControl.currentPage + pageControl.numberOfPages + 1) % pageControl.numberOfPages)
    }

    @IBAction func longPressAction(_ sender: UILongPressGestureRecognizer) {
        selectData(index:Int.random(in: 0..<pageControl.numberOfPages))
    }
    
    func selectData(index:Int) {
        
        textView.text = data[index]
        pageControl.currentPage = index
        segmentedControl.selectedSegmentIndex = index
        imageView.image = UIImage(named: "Image-\(index+1)")
        pageInfoLabel.text = "\(pageControl.currentPage + 1)/\(pageControl.numberOfPages)"
    }
    
}

