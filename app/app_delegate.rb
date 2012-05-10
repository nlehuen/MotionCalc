class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = CalculatorViewController.alloc.init

    # @window.rootViewController.wantsFullScreenLayout = true

    @window.makeKeyAndVisible

    # UIApplication.sharedApplication.setStatusBarHidden true, withAnimation:UIStatusBarAnimationSlide

    return true	  	
  end

  attr_reader :window
end
