# frozen_string_literal: true

module MyPluginModule
  class Fibonacci
    def self.fib(n)
      return n if n <= 1
      fib(n - 1) + fib(n - 2)
    end
  end
end
