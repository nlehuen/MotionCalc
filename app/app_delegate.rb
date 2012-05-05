class AppDelegate
  def fibo(n)
  	if n < 2
  		1
  	else
  		fibo(n-1) + fibo(n-2)
  	end
  end

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = CalculatorViewController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    UIApplication.sharedApplication.setStatusBarHidden true, withAnimation:UIStatusBarAnimationSlide

    return true	  	
  end

  attr_reader :window
end
