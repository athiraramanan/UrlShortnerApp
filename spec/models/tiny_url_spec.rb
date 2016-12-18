require 'rails_helper'

RSpec.describe TinyUrl, type: :model do
	describe "TinyUrl model" do   
      it "should validate fields " do
        expect(TinyUrl.new(:full_url => "")).not_to be_valid
      end
      it "should validate fields " do
        expect(TinyUrl.new(:shortend_url => "")).not_to be_valid
      end
      it "should validate fields" do
        expect(TinyUrl.new(:full_url => "https://www.google.co.in/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=How+do+i+get+my+console+to+display+test+results+in+color(red%2Fgreen)+in+ruby",:shortend_url=>"d2f16d5")).to be_valid
      end
    end 
    describe "Generate tiny url" do 
      it "should generate_tiny_url tiny_url " do 
        tiny_url=TinyUrl.generate_tiny_url("https://www.relishapp.com/rspec/rspec-rails/docs/routing-specs")
        expect(tiny_url).to eq("7c9d2df")
      end
    end
    describe "TinyUrl model" do 
      it "should generate_tiny_url tiny_url " do
      if TinyUrl.all
      	TinyUrl.all.delete_all
      end 
        tiny_url= TinyUrl.create(:full_url=>"chrome-extension://mkhojklkhkdaghjjfdnphfphiaiohkef/index.html",:shortend_url=>"asdasd")
        shortend_url=TinyUrl.get_full_url(tiny_url.shortend_url)
        expect(tiny_url).not_to eq(shortend_url)
      end
    end
    describe "TinyUrl model" do 
      it "should generate_tiny_url tiny_url " do 
        tiny_url= TinyUrl.create(:full_url=>"chrome-extension://mkhojklkhkdaghjjfdnphfphiaiohkef/index.html",:shortend_url=>"asdasd")
        shortend_url=TinyUrl.get_full_url(tiny_url.shortend_url)
        expect(tiny_url).not_to eq(shortend_url)
      end
    end

end
