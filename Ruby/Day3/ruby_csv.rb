#Please execute in current folder's path
# ruby ruby_csv.rb
# homework: 修改前面的CSV应用程序，使它可以用each方法返回CsvRow对象。然后，在CsvRow对象上，
# 对某个给定标题，用method_missing方法返回标题所在列的值。
# 这是一个很好的 metaprogramming 的例子
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents, :i

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.to_s.chomp.split(', ')
      end
    end

    def initialize
      read
      @i = 0
    end

    def each
      while @i < @csv_contents.length
        yield(CsvRow.new(@csv_contents[@i], @headers))
        @i += 1
      end
    end
  end
end

class CsvRow
  attr_accessor :rowData, :headerArr
  def initialize(contents, headers)
    @rowData = contents
    @headerArr = headers
  end

  def method_missing(symbol, *args)
    if @headerArr.include?(symbol.to_s)
      @rowData[@headerArr.index(symbol.to_s)]
    else
      super
    end
  end
end


class RubyCsv
  include ActsAsCsv
  acts_as_csv
end


m = RubyCsv.new
#puts m.headers.inspect
#puts m.csv_contents.inspect

m.each {|row| puts row.name + ",  " + row.age + ' years old'}
puts '-' * 50