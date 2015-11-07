require 'test_helper'


class FindHelperTest < ActionView::TestCase
  include Find

  test "should give me the hash from arrary" do
    hash = [{id: 1, description: '1'}, {id: 2, description: '2'}]

  end

end
