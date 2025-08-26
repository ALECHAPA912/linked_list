require "./linked_list.rb"

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
list.prepend('alex')
list.prepend('agucha')
list.append('matecito')

puts list
list.pop
list.pop
list.pop
list.pop
list.pop
puts list