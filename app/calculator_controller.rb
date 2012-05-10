class CalculatorViewController < UIViewController
	def loadView
		views = NSBundle.mainBundle.loadNibNamed "Keyboard", owner:self, options:nil
		self.view = views[0]
	end

	def addTapAction(tag, action)
		sv = view.viewWithTag tag
		if !sv
			puts "Unknown tag : #{tag}"
		else
			sv.addTarget self, action:action, forControlEvents:UIControlEventTouchUpInside
		end
	end

	def viewDidLoad
		@stack = Stack.new
		@clean = true

		@display = view.viewWithTag 1

		for i in 10..19 do
			addTapAction i, 'figureTapped:'
		end

		addTapAction 20, 'commaTapped'

		addTapAction 21, 'enterTapped'

		addTapAction 22, 'deleteTapped'

		for i in 30..33 do
			addTapAction i, 'operationTapped:'
		end

	end

	def handleClean
		if @clean
			@clean = false
			@display.text = ''
		end
	end

	def figureTapped(figure)
		handleClean
		@display.text += "#{figure.tag - 10}"
	end

	def commaTapped
		handleClean
		unless @display.text.include? '.'
			@display.text += '.'
		end
	end

	def enterTapped
		@stack.push @display.text.to_f
		@display.text = ''
	end

	def deleteTapped
		@clean = false
		if @display.text.size > 0
			@display.text = @display.text[0...-1]
		end
	end

	def operationTapped(operation)
		@stack.push @display.text.to_f
		
		@stack.add if operation.tag == 30
		@stack.sub if operation.tag == 31
		@stack.mul if operation.tag == 32
		@stack.div if operation.tag == 33

		@display.text = @stack.peek.to_s
		@clean = true
	end
end