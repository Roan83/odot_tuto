require 'rails_helper'

describe "todo_lists/index" do
  before(:each) do
    assign(:todo_lists, [
      stub_model(TodoList,
        :title => "Title"
      ),
      stub_model(TodoList,
        :title => "Title"
      )
    ])
  end

  it "renders a list of todo_lists" do
    #stub_template "todo_lists/_todo_list.html.erb" => "<%= todo_list.todo_items.size %><br/>"
    #render 
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #expect(page("ul.todo-lists li div")).to :text => "Title".to_s, :count => 2 
    assert_select "ul.todo-lists li div", { :text => "Title".to_s, :count => 2 }
  end
end
