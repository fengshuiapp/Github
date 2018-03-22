class MainViewController < UIViewController

  def viewDidLoad

      self.title = 'Fengshui'

  end
  #Start Button
  def loadView

      self.view = UIImageView.alloc.init
      view.contentMode = UIViewContentModeScaleAspectFill
      view.image = UIImage.imageNamed("WelcomePage.png")

      @view2 = MainView.new
      view.addSubview(@view2)
      view.bringSubviewToFront(@view2)

      next_button =
      UIBarButtonItem.alloc.initWithTitle('Start', style:
      UIBarButtonItemStyleDone, target: self, action: :second_controller)
      # Add the Bar Button Item to the Navigation Bar
      self.navigationItem.rightBarButtonItem = next_button
      
      
  end

 
  def second_controller

      navigationController.pushViewController(UserInputController.new,animated: true)

  end

end