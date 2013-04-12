class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # this is just a demonstration to play with the look and feel of the UITable
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    controller = NameController.alloc.initWithNibName(nil, bundle:nil)
    @window.rootViewController = controller

    true
  end
end
