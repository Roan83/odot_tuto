require 'rails_helper'

RSpec.describe TodoList, type: :model do
  it { should have_many(:todo_items) }

  describe "#has_completed_items?" do
    let!(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery list.") }

    it "return true with completed todo list items" do
      todo_list.todo_items.create(content:"Eggs", completed_at: 1.minute.ago)
      expect(todo_list.has_completed_items?).to be true
    end

    it "return false with no completed todo list items" do
      todo_list.todo_items.create(content:"Eggs")
      expect(todo_list.has_completed_items?).to be false
    end
  end

  describe "#has_incomplete_items?" do
    let!(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery list.") }

    it "return true incompleted todo list items" do
      todo_list.todo_items.create(content:"Eggs")
      expect(todo_list.has_incomplete_items?).to be true
    end

    it "return false with no incomplete todo list items" do
      todo_list.todo_items.create(content:"Eggs", completed_at: 1.minute.ago)
      expect(todo_list.has_incomplete_items?).to be false
    end
  end
end
