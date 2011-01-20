
module Pik
  
  class Default < Command
  
    it "Switches to the default ruby."
  
    attr_accessor :verbose
  
    def execute
      if ruby = config.match(config.global[:default])
        config.options[:use] = ruby
        use = Pik::Use.new([], config)
        use.execute
        use.close
      else
        msg =  "Error: You must define a default ruby first.  Run:\n\n"
        msg << "   pik use [ruby] --default\n\n"
        abort msg
      end
    end
  
  end

end
