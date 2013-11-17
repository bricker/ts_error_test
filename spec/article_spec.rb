require 'spec_helper'

NUM_ARTICLES = 5

describe Article do
  let(:options) do
    {
      :classes        => [Article],
      :limit          => 2,
      :page           => 1,
      :order          => "created_at ASC",
      :retry_stale    => true,
      :populate       => true
    }
  end

  it "finds the articles" do
    articles = []
    NUM_ARTICLES.times { articles << Article.create(headline: "Test") }

    ThinkingSphinx::Test.index
    sleep 2 # Be extra sure that it's not a timing bug

    ThinkingSphinx.search("", options).to_a.should eq articles.first(2)
  end

  it "doesn't raise a StaleIdsException" do
    ThinkingSphinx.search("", options).to_a.should eq []
  end
end
