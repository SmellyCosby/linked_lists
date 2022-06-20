require "pry-byebug"

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def find_final_node(node = @head, prev_node = nil)
    #first find when next_node == nil
    # then go back to previous non-nil, areturn to append, so new @tail can be properly linked to previous tails @next node
    return prev_node if node.nil?

    find_final_node(node.next, prev_node = node)
  end

  def append(value)
    return @head = Node.new(value) if @tail.nil? && @head.nil?

    @tail = Node.new(value)
    final_node = find_final_node
    final_node.update_next_node(@tail)
    # adds a new node containined value to end of list
  end

  def prepend(value)
    return @head = Node.new(value) if @head.nil?

    previous_head = @head
    @head = Node.new(value, previous_head)
  end

  def size(node = @head, count = 0)
    # returns total number of nodes in list
    return count if node.nil?

    size(node.next, count += 1)
  end

  def head
    # returns node at position 0
    @head
  end

  def tail
    @tail
  end

  def at(index, location = 0, node = @head)
    return "#{node.node_name} | #{node.node_value}" if location == index

    at(index, location += 1, node.next)
  end

  def pop
    # removes last  element in the list
    list.delete_at(-1)
  end

  def contains?(value)
    # return true if value is in list
  end

  def find(value)
    # return index of node == value
    return nil
  end

  def to_s(next_node = @head)
    if next_node.nil?
      print "nil\n"
      return
    end
    # print linklist objects as strings
    # format should be (value) -> (value) -> (value) - nil
    # will need to navigate entire list to do this
    print "(#{next_node.node_name} | #{next_node.node_value}) -> "
    next_node = to_s(next_node.next)
  end


  def insert_at(value, index)
    # inserts a new node with provided value at given index
    # update next_node
  end

  def remove_at(index)
    # removes node at given index
    # update next_node
  end
end

class Node
  @@number_of_nodes = 0
  attr_accessor :value, :name
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
    @name = assign_name
    @@number_of_nodes += 1
  end

  def next
    @next_node
  end

  def update_next_node(node)
    @next_node = node
  end

  def node_value
    @value
  end

  def node_name
    @name
  end

  def assign_name
    number_of_characters = @@number_of_nodes / 26 + 1
    node_name = []
    number_of_characters.times do
      node_name.push((@@number_of_nodes % 26 + 65).chr)
    end
    node_name.join('')
  end
end

l = LinkedList.new
l.append(20)
l.prepend("first")
l.append(30)
l.prepend("second")
l.append(70)
l.append(80)



print "#{l}\n\n"

print "#{l.size}\n\n"

print "#{l.at(3)}\n\n"

print "#{l.at(1)}\n\n"
