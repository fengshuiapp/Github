class MainViewController < UIViewController
  def viewDidLoad
      self.title = 'Fengshui'
  end
  def loadView
      self.view = MainView.new
      #view.button.addTarget(self,action: :alert_controller, forControlEvents: UIControlEventTouchUpInside)
      view.todo_button.addTarget(self,action: :second_controller, forControlEvents: UIControlEventTouchUpInside)
  end
 
    def second_controller
      navigationController.pushViewController(ResultDisplayController.new,animated: true)
    end
end