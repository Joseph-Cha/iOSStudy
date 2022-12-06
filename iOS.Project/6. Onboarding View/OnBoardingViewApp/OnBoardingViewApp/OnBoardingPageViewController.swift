import UIKit

class OnBoardingPageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    var bottomButtonMargin: NSLayoutConstraint?
    var pageControl = UIPageControl()
    
    let startIndex = 0
    var currentIndex = 0 {
        didSet {
            pageControl.currentPage = currentIndex
        }
    }
    
    func makePageVC() {
        let itemVC1 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC1.mainText = "Focus on your ideal buyer"
        itemVC1.topImage = UIImage(named: "onboarding1")
        itemVC1.subText = "When you write..."
        
        let itemVC2 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC2.mainText = "Entice with benefits"
        itemVC2.topImage = UIImage(named: "onboarding2")
        itemVC2.subText = "When we sell our .."
        
        let itemVC3 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC3.mainText = "Avoid yeah.."
        itemVC3.topImage = UIImage(named: "onboarding3")
        itemVC3.subText = "When we're stuck..."
        
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        
        // 처음으로 나와야 하는 페이지 설정
        setViewControllers([itemVC1], direction: .forward, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makePageVC()
        self.makeBottomButton()
        self.makePageControl()
        
        self.dataSource = self
        self.delegate = self
    }
    
    func makeBottomButton() {
        print("make button")
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        
        // touchUpInside: 버튼을 클릭 후 땠을 때 호출
        button.addTarget(self, action: #selector(dismissPageVC), for: .touchUpInside)
        
        // 버튼을 view에 올리는 과정
        self.view.addSubview(button)
        // auto layout 설정을 위해서는 아래 값이 false로 설정이 되어 있어야 한다.
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // code로 auto layout 설정
        // equalTo: 어디를 기준으로 anchor를 심을 것인지
        // self.view의 의미: 현재 View는 OnBoardingPageViewController이기 때문에 버튼이 부모 view를 기준으로 엥커를 심는 것이다.
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 100)
        bottomButtonMargin?.isActive = true
        hideButton()
    }
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        // 선택한 페이지의 점색상
        pageControl.currentPageIndicatorTintColor = .black
        // 선택되지 않은 페이지의 점색상
        pageControl.pageIndicatorTintColor = .lightGray
        // 점의 갯수
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex
        
        // 점을 클릭 시 아무런 동작도 안하게끔 만들어줌
//        pageControl.isUserInteractionEnabled = false
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // button의 이벤트 등록과 동일한 구현
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    
    @objc func dismissPageVC() {
        self.dismiss(animated: true)
    }
    
    @objc func pageControlTapped(sender: UIPageControl) {
        
        // 1 -> 2 페이지로 이동
        if sender.currentPage > self.currentIndex {
            self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)

        } else {
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true, completion: nil)

        }
        
        currentIndex = sender.currentPage
        
        buttonPresentationStyle()
    }
}

extension OnBoardingPageViewController: UIPageViewControllerDataSource {
    // 현재 페이지에서 이전 페이지로 이동했을 시 나오는 페이지 정의
    // pageViewController: 현재 페이지
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        self.currentIndex = currentIndex
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
        
    }
    
    // 현재 페이지에서 이후 페이지로 이동했을 시 나오는 페이지 정의
    // pageViewController: 현재 페이지
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        if currentIndex == pages.count - 1 {
            return pages.first
        } else {
            return pages[currentIndex + 1]
        }
    }
}

extension OnBoardingPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first else {
            return
        }
        
        guard let currentIndex = pages.firstIndex(of: currentVC) else {
            return
        }
        self.currentIndex = currentIndex
        
        buttonPresentationStyle()

    }
    func buttonPresentationStyle() {
        if currentIndex == pages.count - 1 {
            self.showButton()
        } else {
            self.hideButton()
        }
        
        // 버튼이 등장하고 사라지는 첫 번째 방법
//        UIView.animate(withDuration: 0.5, delay: 0) {
//            self.view.layoutIfNeeded()
//        }
        
        // 버튼이 등장하고 사라지는 두 번째 방법
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.25, delay: 0, options: [.curveEaseInOut], animations: {
            // 즉시 변경 -> 0.5초 동안의 시간을 두고
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func showButton() {
        bottomButtonMargin?.constant = 0
    }
    
    func hideButton() {
        bottomButtonMargin?.constant = 100
    }
}
