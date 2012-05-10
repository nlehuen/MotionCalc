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

		@display = []
		for i in 1..4 do
			@display << view.viewWithTag(i)
		end

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

	def updateStack
		for i in 1..3 do
			@display[i].text = @stack.peek(i-1).to_s
		end
	end

	def figureTapped(figure)
		@display[0].text += "#{figure.tag - 10}"
	end

	def commaTapped
		unless @display.text.include? '.'
			@display[0].text += '.'
		end
	end

	def enterTapped
		@stack.push @display[0].text.to_f
		@display[0].text = ''
		updateStack
	end

	def deleteTapped
		if @display[0].text.size > 0
			@display[0].text = @display[0].text[0...-1]
		end
	end

	def operationTapped(operation)
		if @display[0].text.size > 0
			@stack.push @display[0].text.to_f 
			@display[0].text = ''
		end
		
		@stack.add if operation.tag == 30
		@stack.sub if operation.tag == 31
		@stack.mul if operation.tag == 32
		@stack.div if operation.tag == 33

		updateStack
	end
end