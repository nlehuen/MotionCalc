class Stack
	def initialize
		@stack = []
	end

	def push(number)
		@stack << number
		@stack.last
	end

	def peek()
		@stack.last
	end

	def pop()
		@stack.pop
	end

	def add()
		return nil if @stack.size < 2
		a = @stack.pop
		b = @stack.pop
		@stack << (a + b)
		@stack.last
	end

	def sub()
		return nil if @stack.size < 2
		a = @stack.pop
		b = @stack.pop
		@stack << (a - b)
		@stack.last
	end

	def mul()
		return nil if @stack.size < 2
		a = @stack.pop
		b = @stack.pop
		@stack << (a * b)
		@stack.last
	end

	def div()
		return nil if @stack.size < 2
		a = @stack.pop
		b = @stack.pop
		@stack << (a / b)
		@stack.last
	end			
end