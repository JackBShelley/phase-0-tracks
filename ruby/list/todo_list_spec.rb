class TodoList

   def initialize(item1)
     @list = item1
   end
   
   def get_items
     @list
   end

   def add_item(item)
     @list << item
   end
   
   def delete_item(item1)
   p @list.delete(item1)
   @list
   end

   def get_item(item1)
    @list[item1]
   end

end


#rspec

describe TodoList do
 let(:list) { TodoList.new(["do the dishes", "mow the lawn"]) }

 it "stores the list items given on initialization" do
   expect(list.get_items).to eq ["do the dishes", "mow the lawn"]
 end

 it "adds an item to the list" do
   list.add_item("mop")
   expect(list.get_items).to eq ["do the dishes", "mow the lawn", "mop"]
 end

 it "deletes an item" do
   list.delete_item("do the dishes")
   expect(list.get_items).to eq ["mow the lawn"]
 end

 it "retrieves an item by index" do
   expect(list.get_item(0)).to eq "do the dishes"
 end

 
end