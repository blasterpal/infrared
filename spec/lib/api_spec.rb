require './spec/spec_helper'

describe Infrared::API do

  let(:auth_hash){ {url: 'http://localhost:2368',email:'hbeaver@gmail.com',password:'password'}}
  let(:api) {Infrared::API.new(auth_hash)}

  before do
  end

  describe "#posts" do
    use_vcr_cassette
    it "no arguments should return published post" do
      expect(api.posts["posts"][0]["title"]).to eq('Post Num 1 - published') 
      expect(api.posts["meta"]["pagination"]["pages"]).to eq(1) 
    end
    it "status of draft should return draft post" do
      expect(api.posts(:draft)["posts"][0]["title"]).to eq('Post Num 2 - draft')
      expect(api.posts["meta"]["pagination"]["pages"]).to eq(1) 
    end
    it "status of published should return published json" do
      expect(api.posts(:published)["posts"][0]["title"]).to eq('Post Num 1 - published') 
      expect(api.posts["meta"]["pagination"]["pages"]).to eq(1) 
    end
    it "status of all should return all posts" do
      expect(api.posts(:all)["meta"]["pagination"]["total"]).to eq(2) 
    end
  end

  describe "#add_post" do
    use_vcr_cassette
    before do
    end

    it "should post correct data" do
      
    end
  end

end

