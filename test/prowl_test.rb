require './test/test_helper.rb'
class ProwlTest < MiniTest::Unit::TestCase
  def test_notify_users
    message = "omg"
    keys = ['lol', 'rofl']

    FakeWeb.register_uri(:post, "#{OmgPullRequest::Prowl::PROWL_URL}#{OmgPullRequest::Prowl::PROWL_PATH}", :body => "OK")
    
    prowl_client.notify_users(message, keys) 
  end

  def test_keys_for_users
    assert_equal ['OMG_OMG'],
      prowl_client.send(:keys_for_users, ['kenmazaika','kenmazaika@gmail.com', 'omg'])
  end

  private

  def prowl_client
    @prowl_client ||= OmgPullRequest::Prowl.new(:configuration => OmgPullRequest::CONFIGURATION)
  end
end


