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

    def my_flatten
        flattened = [] 
        self.my_each do |el|
            if el.is_a?(Array)
                flattened += (el.my_flatten)
            else 
                flattened << el 
            end 
        end 
        flattened
    end 

    def my_zip(*args)
        final = []
        self.length.times do |i|
            row = [self[i]]
            
            args.my_each do |arg|
            row << arg[i]
            end 
            final << row
        end 
        final
    end 

    def my_rotate(n = 1)
        dup = self.dup
        if n > 0 
            n.times {dup = dup.push(dup.shift)}

        else 
            (-n).times {dup = dup.unshift(dup.pop)}
        end 
        dup
    end 

    

end




# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


