class CalculatorViewController < UIViewController
	def initialize
		@stack = Stack.new
	end

	def viewDidLoad
	    ox = view.frame.origin.x
	    oy = view.frame.origin.y
	    wi = view.frame.size.width
	    he = view.frame.size.height

	    # Display
		@state = UILabel.new
	    @state.font = UIFont.systemFontOfSize(16)
	    @state.text = ""
	    @state.textAlignment = UITextAlignmentCenter
	    @state.textColor = UIColor.whiteColor
	    @state.backgroundColor = UIColor.redColor
	    @state.frame = [[ox, oy], [wi, @state.font.lineHeight]]
	    view.addSubview @state

    	cell_w = wi / 4
    	cell_h = (he - @state.frame.size.height) / 5

		def frameForRow(row, andCol:col)

		end

	    # Number buttons
	    @figures = []
	    for i in 0..9 do
	    	@figure = UIButton.buttonWithType UIButtonTypeRoundedRect
	    	@figure.setTitle "#{i}", forState:UIControlStateNormal
	    	@figure.tag = i
	    	
			# 7 8 9 +
			# 4 5 6 -
			# 1 2 3 *
			# 0   . /
			#    =
	    	row = (9 - i) / 3
	    	col = (i - 1) % 3
	    	col = 0 if i == 0

	    	@figure.frame = [
				[ col * cell_w + 0.1 * cell_w, @state.frame.size.height + row * cell_h + 0.1 * cell_h ],
				[ 0.8 * cell_w, 0.8 * cell_h ]
		    ]

		    @figure.addTarget(self, action:'figureTapped:', forControlEvents:UIControlEventTouchUpInside)

	    	view.addSubview @figure

	    	@figures << @figure
	    end
	end

	def figureTapped(figure)
		@state.text += "#{figure.tag}"
	end
end