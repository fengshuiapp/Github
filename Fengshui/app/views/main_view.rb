class MainView < UIView
  #attr_accessor :button
  attr_accessor :todo_button
  def init
    super

    self.backgroundColor = UIColor.whiteColor
    #@button = UIButton.new
    #@button.setTitle('Button Title',forState: UIControlStateNormal)
    #@button.setTitle ('pressed', forState: UIControlStateHighlighted)
    #@button.setTitleColor (UIColor.redColor, forState: UIControlStateNormal)


    #@button.frame = [[20,200],[250,30]]
    #addSubview(@button)

    @todo_button = UIButton.buttonWithType(UIButtonTypeSystem)
    @todo_button.setTitle('Start->',forState: UIControlStateNormal)
    #@todo_button.setTitle ('pressed', forState: UIControlStateHighlighted)
    @todo_button.setTitleColor (UIColor.blueColor, forState: UIControlStateNormal)


    @todo_button.frame = [[250,600],[100,30]]
    addSubview(@todo_button)


    #label = UILabel.new
    #label.text = 'Text Label'
    #label.textColor = UIColor.blueColor
    #label.frame = [[20,150],[200,30]]
    #addSubview(label)

    #field = UITextField.new
    #field.text = 'This'
    #field.placeholder = 'Text inside'
    #field.backgroundColor = UIColor.yellowColor
    #field.frame = [[20,250],[250,30]]
    #addSubview(field)
  end
end
