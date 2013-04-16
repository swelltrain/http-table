class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # this is just a demonstration to play with the look and feel of the UITable
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    name_controller = NameController.alloc.initWithNames()
    @window.rootViewController = name_controller 

    true
  end
end
