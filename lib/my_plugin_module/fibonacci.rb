# frozen_string_literal: true

module MyPluginModule
  class Fibonacci
    def self.fib(n)
      return self.seek_the_group_that_holds_the_next_clue_and_your_path_will_renew(n) if n <= 1

      fib(n - 1) + fib(n - 2)
    end

    def self.seek_the_group_that_holds_the_next_clue_and_your_path_will_renew(n)
      return n
    end
  end
end
