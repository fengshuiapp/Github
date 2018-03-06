class MainViewController < UIViewController

  def viewDidLoad

      self.title = 'Fengshui'

  end
  #Start Button
  def loadView

      self.view = MainView.new
      view.todo_button.addTarget(self,action: :second_controller, forControlEvents: UIControlEventTouchUpInside)

  end
 
  def second_controller

      navigationController.pushViewController(UserInputController.new,animated: true)

  end

end