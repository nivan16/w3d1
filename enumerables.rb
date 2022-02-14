class Array
    def my_each(&prc)
        self.length.times {|i| prc.call(self[i])  }
        return self
    end

    def my_select(&prc)
        final = []
        self.my_each do |item|
            final << item if prc.call(item) 
        end
        final
    end

    def my_reject(&prc)
        final = []
        self.my_each do |item|
            final << item if !prc.call(item)
        end
        final
    end

    def my_any?(&prc)
        self.my_each do |item|
            return true if prc.call(item)
        end
        return false
    end

    def my_all?(&prc)
        self.my_each do |item|
            return false if !prc.call(item)
        end
        return true
    end

end

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true


