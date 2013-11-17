require 'spec_helper'

NUM_ARTICLES = 5

describe "Search" do
  let(:options) do
    {
      :classes        => [Article],
      :limit          => 2,
      :order          => "created_at ASC",
    }
  end


  it "finds the articles the first time" do
    articles = []
    NUM_ARTICLES.times { articles << Article.create(headline: "Test") }

    ThinkingSphinx::Test.index
    sleep 2 # Be extra sure that it's not a timing bug

    ThinkingSphinx.search("", options).to_a.should eq articles.first(2)
  end


  context "with the same options as the original search" do
    it "doesn't raise a StaleIdsException" do
      ThinkingSphinx.search("", options).to_a.should eq []
    end
  end

  context "with changed options" do
    it "doesn't raise a StaleIdsException when limit is changed" do
      options[:limit] = 3
      ThinkingSphinx.search("", options).to_a.should eq []
    end

    it "doesn't raise a StaleIdsException when page is changed" do
      options[:page] = 2
      ThinkingSphinx.search("", options).to_a.should eq []
    end

    it "doesn't raise a StaleIdsException when order is changed" do
      options[:order] = "created_at DESC"
      ThinkingSphinx.search("", options).to_a.should eq []
    end

    it "doesn't raise a StaleIdsException when query is changed" do
      ThinkingSphinx.search("hello", options).to_a.should eq []
    end
  end
end
