class CalculatorViewController < UIViewController
	def initialize
		@stack = Stack.new
	end

	def frameForRow(row,andCol:col)
		[
			[ col * @cell_w + 0.1 * @cell_w, @display.frame.size.height + row * @cell_h + 0.1 * @cell_h ],
			[ 0.8 * @cell_w, 0.8 * @cell_h ]
		]
	end

	def viewDidLoad
	    ox = view.frame.origin.x
	    oy = view.frame.origin.y
	    wi = view.frame.size.width
	    he = view.frame.size.height

	    # Display
		@display = UILabel.new
	    @display.font = UIFont.systemFontOfSize(16)
	    @display.text = ""
	    @display.textAlignment = UITextAlignmentCenter
	    @display.textColor = UIColor.whiteColor
	    @display.backgroundColor = UIColor.redColor
	    @display.frame = [[ox, oy], [wi, @display.font.lineHeight]]
	    view.addSubview @display

    	@cell_w = wi / 4
    	@cell_h = (he - @display.frame.size.height) / 5

	    # Number buttons
	    for i in 0..9 do
	    	figure = UIButton.buttonWithType UIButtonTypeRoundedRect
	    	figure.setTitle "#{i}", forState:UIControlStateNormal
	    	figure.tag = i
	    	
			# 7 8 9 +
			# 4 5 6 -
			# 1 2 3 *
			# 0   . /
			#    =
	    	row = (9 - i) / 3
	    	col = (i - 1) % 3
	    	col = 0 if i == 0

	    	figure.frame = frameForRow row, andCol: col
		    figure.addTarget(self, action:'figureTapped:', forControlEvents:UIControlEventTouchUpInside)
	    	view.addSubview figure
	    end

	    # Operations
	    operations = ['+', '-', '*', '/']
	    for i in 0..3 do
	    	operation = operations[i]
	    	op = UIButton.buttonWithType UIButtonTypeRoundedRect
	    	op.setTitle operation, forState:UIControlStateNormal
	    	op.tag = i
	    	op.frame = frameForRow i, andCol: 3
		    op.addTarget(self, action:'operationTapped:', forControlEvents:UIControlEventTouchUpInside)
	    	view.addSubview op
	    end
	end

	def figureTapped(figure)
		@display.text += "#{figure.tag}"
	end

	def operationTapped(operation)
		p operation.tag
	end
end