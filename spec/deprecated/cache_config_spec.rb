require "spec_helper"

describe MusicBrainz::Deprecated::CacheConfig do
  before(:all) {
    @old_cache_path = MusicBrainz.config.cache_path
  }

  before(:each) {
    MusicBrainz.config.cache_path = nil
  }

  after(:all) {
    MusicBrainz.config.cache_path = @old_cache_path
  }

  it "allows deprecated use of cache_path" do
    MusicBrainz.config.cache_path = "test1"

    expect(MusicBrainz::Tools::Cache.cache_path).to eq "test1"
    expect(MusicBrainz.cache_path).to eq "test1"
  end

  it "allows deprecated use of cache_path=" do
    MusicBrainz::Tools::Cache.cache_path = "test2"
    expect(MusicBrainz.config.cache_path).to eq "test2"

    MusicBrainz.cache_path = "test3"
    expect(MusicBrainz.config.cache_path).to eq "test3"
  end
end
