class Stack
    def initialize
        @stack = []
    end

    def push(str)
        @stack << Rational(str)
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

    def swap()
        return nil if @stack.size < 2
        a = @stack.pop
        b = @stack.pop
        @stack << a
        @stack << b
        @stack.last
    end

    def square()
        return nil if @stack.size < 1
        a = @stack.pop
        @stack << (a * a)
        @stack.last
    end           

    def invert()
        return nil if @stack.size < 1
        a = @stack.pop
        @stack << (Rational(1) / a)
        @stack.last
    end

    def negate()
        return nil if @stack.size < 1
        a = @stack.pop
        @stack << (Rational(0) - a)
        @stack.last
    end

    def percent()
        return nil if @stack.size < 2
        a = @stack.pop
        b = @stack.pop
        @stack << (a * b / Rational(100))
        @stack.last
    end
end