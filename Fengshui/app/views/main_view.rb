class MainView < UIView
  #attr_accessor :button
  
  attr_accessor :intro_label

  def init
      super

      @intro_label= UILabel.alloc.initWithFrame([[50,250],[300,200]])
      @intro_label.numberOfLines = 20
      @intro_label.highlighted = true
      @intro_label.textColor = UIColor.blackColor
      @intro_label.backgroundColor = UIColor.clearColor
      @intro_label.font = UIFont.fontWithName("HelveticaNeue-
      CondensedBold",size:20)
      @intro_label.shadowColor = UIColor.blackColor
      @intro_label.text = "     Welcome to Fengshui APP!
      1. Please pick up the built date in western calender and enter the facing direction in integer value at next page.
      2. Please upload your floor plan and apply the Nine Palace grid on top of it by pressing apply button.
      3. The Fengshui of each room will be displayed to you at the last Page."
      addSubview(@intro_label)
end     
  
end
