require 'spec_helper'

describe Financialinstrument do
  it "should have a user_id" do
    user = User.new
    financialinstrument = user.Financialinstrument.new
    expect(financialinstrument.user_id).to equal_to(:user_id)
  end
end
(Application stubs)

