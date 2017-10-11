class MainViewController < UIViewController
  def viewDidLoad
      self.title = 'Fengshui'
  end
  def loadView
      self.view = MainView.new
      #view.button.addTarget(self,action: :alert_controller, forControlEvents: UIControlEventTouchUpInside)
      view.todo_button.addTarget(self,action: :second_controller, forControlEvents: UIControlEventTouchUpInside)


  end
  #def alert_controller
   #   @alert_controller = UIAlertController.alertControllerWithTitle('Alert Title',
   #   message: 'This is the message',
   #   preferredStyle: UIAlertControllerStyleAlert )
   #   ok_action = UIAlertAction.actionWithTitle('OK',style: UIAlertActionStyleDefault, handler: Proc.new {|obj| ok_response})
   #   @alert_controller.addAction(ok_action)
   #   cancel_action = UIAlertAction.actionWithTitle('Cancel',style: UIAlertActionStyleCancel, handler: nil)
    #  self.presentViewController(@alert_controller, animated: true, completion:nil)
    #  @alert_controller.addAction(cancel_action)
 # end
    #def ok_response
    #  puts 'OK pressed'
    #end
    def second_controller
      navigationController.pushViewController(SecondViewController.new,animated: false)
    end
end