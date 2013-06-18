require 'spec_helper'

describe OmniAuth::Strategies::TtiAppAuthorizer do

  subject do
    OmniAuth::Strategies::TtiAppAuthorizer.new({})
  end

  context "general" do
    it "should be called TtiAppAuthorizer" do
      subject.options.name.should eq('ttiappauthorizer')
    end
  end

  context "endpoints" do
    it "has correct site" do
      subject.options.client_options.site.should eq("http://vanilla-red.herokuapp.com")
    end

    it "has correct authorize_url" do
      subject.options.client_options.authorize_url.should eq("/oauth/authorize")
    end

    # it "has correct token_url" do
    #   subject.options.client_options.token_url.should eq("/oauth/access_token")
    # end
  end

end