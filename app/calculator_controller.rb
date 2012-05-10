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

        @input = view.viewWithTag 1
        @stack_display = []
        for i in 2..3 do
            @stack_display << view.viewWithTag(i)
        end

        for i in 10..19 do
            addTapAction i, 'figureTapped:'
        end

        addTapAction 20, 'commaTapped'

        for i in 30..36 do
            addTapAction i, 'operationTapped:'
        end

        addTapAction 40, 'enterTapped'
        addTapAction 41, 'dropTapped'
        addTapAction 42, 'deleteTapped'
        addTapAction 43, 'swapTapped'
    end

    def updateStackDisplay
        for i in 0...@stack_display.size do
            value = @stack.peek(i)
            if value != nil
                if value.denominator == 1
                    value = "#{value.numerator}"
                else
                    value = "%s = %.6f" % [value, value.to_f]
                end
            else
                value = ''
            end

            @stack_display[i].text = value
        end
    end

    def figureTapped(figure)
        @input.text += "#{figure.tag - 10}"
    end

    def commaTapped
        unless @input.text.include? '.'
            @input.text += '.'
        end
    end

    def enterTapped
        @stack.push @input.text
        @input.text = ''
        updateStackDisplay
    end

    def deleteTapped
        if @input.text.size > 0
            @input.text = @input.text[0...-1]
        end
    end

    def swapTapped
        if @input.text.size > 0
            @stack.push @input.text
            @input.text = ''
        end
    	@stack.swap
    	updateStackDisplay
    end

    def dropTapped
        v = @stack.pop
        if v != nil
            if v.denominator == 1
                @input.text = v.numerator.to_s
            else
                @input.text = v.to_f.to_s
            end
        end
        updateStackDisplay
    end

    def operationTapped(operation)
        if @input.text.size > 0
            @stack.push @input.text
            @input.text = ''
        end
        
        @stack.add if operation.tag == 30
        @stack.sub if operation.tag == 31
        @stack.mul if operation.tag == 32
        @stack.div if operation.tag == 33
        @stack.square if operation.tag == 34
        @stack.invert if operation.tag == 35
        @stack.percent if operation.tag == 36

        updateStackDisplay
    end
end