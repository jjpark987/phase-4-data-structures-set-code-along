class MySet
    # iterate the enumerable array (default is empty array) and set every element as keys in @hash
    # O(1) runtime for accessing any key in @hash (or element in array)
    def initialize enumerable = []
        @hash = {}
        enumerable.each { |value| @hash[value] = true }
    end

    # use @hash to find if value is an existing hash key
    # O(1) runtime because we are using hash keys to find the value
    def include? value
        # @hash[value] returns nil instead of false
        # Hash#has_key?(value) method always returns true or false
        @hash.has_key? value
    end

    # O(1) runtime because we are adding via hash key
    def add value
        # adds value as key on hash
        @hash[value] = true
        # returns the updated set
        self
    end

    # O(1) runtime because we are deleting via hash key
    def delete value
        # deletes value (which is a key in @hash)
        @hash.delete(value)
        # returns the updated set
        self
    end

    # O(1) runtime because only one operation is performed to count the set size regardless of how large the set is
    def size
        @hash.size
    end

    # alternative initialization via bracket notation
    # * in *enumerable is splat operator that converts any number of arguments into an array
    def self.[] *enumerable
        new enumerable
    end

    # reassigns @hash to an empty hash
    def clear
        @hash = {}
        # returns updated set
        self
    end

    # iterates over each item in set
    def each
        @hash.each_key { |value| yield value }
        # returns updated set
        self
    end

    # prints the set in a readable format
    def inspect
        set = @hash.keys.join(', ')
        "#<MySet: {#{set}}>"
    end
end
