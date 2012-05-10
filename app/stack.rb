class Stack
    def initialize
        @stack = []
    end

    def push(str)
        @stack << Rational(str.to_i)
        @stack.last
    end

    def peek(i=0)
        @stack[-1-i]
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
        @stack << (b - a)
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
        @stack << (b / a)
        @stack.last
    end            
end