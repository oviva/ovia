require 'spec_helper'

describe Ticket do
  it "has pretty URLs" do
    ticket = Factory(:ticket, :title => "Make it shiny!")
    ticket.to_param.should eql("#{ticket.id}-make-it-shiny")
  end
end
