require 'rails_helper'
require 'spec_helper'

describe "todo_lists/show" do
  before(:each) do
    @todo_list = assign(:todo_list, mock_model(TodoList,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
