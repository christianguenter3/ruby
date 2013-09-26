class Tree
	attr_accessor :children, :node_name

	def initialize(nodes)
	  key = nodes.to_a[0][0]
	  value = nodes.to_a[0][1]
	  @node_name = key
	  @children = []
	  value.each do |name, children|
	  	@children << Tree.new({name => children})
		end if value		
 	end

	def visit_all(&block)
		visit &block
		children.each do |child|
			child.visit_all(&block) 
		end if children
	end

	def visit(&block)
		block.call self
	end
end

# ruby_tree = Tree.new( "Ruby", [Tree.new( "Reia"), Tree.new("MacRuby")])

# ruby_tree.visit{|x| puts x.node_name}

# ruby_tree.visit_all{|x| puts x.node_name}

ruby_tree = Tree.new({'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {} },	
														        'uncle' => {'child 3' => {}, 'child 4' => {} } } })
ruby_tree.visit_all {|x| puts x.node_name }
