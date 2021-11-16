
class Tree
  attr_accessor :children, :node_name
  def initialize(tree = {})
    @node_name = tree.keys[0]
    @children = []
    tree.values.each do |value|
      if value.is_a?(Hash) and value.count > 0
        value.each do |k,v|
          @children << Tree.new(Hash[k,v])
        end
      end
    end
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
end


ruby_tree = Tree.new({'grandpa' => {'dad' => {'child 1' => {}, 'child2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {}}}})

puts ruby_tree.visit_all {|node| puts node.node_name}