require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @user = users(:example)
    @message = users(:example).messages.build(content: "Lorem ipsum@example, @nonexistant")
  end

  test "should be valid" do
    assert @message.valid?, @message.errors.full_messages
  end

  test "should not be blank" do
    @message.content = " "
    assert !@message.valid?
  end

  test "should include valid mentions" do
    assert_includes(@message.mentions.to_s, @user.username)
    assert_not_includes(@message.mentions.to_s, "nonexistant")
  end
end
