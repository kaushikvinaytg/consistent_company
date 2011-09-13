require 'helper'
require 'consistent_company'
require 'pry'

class TestConsistentCompany < Test::Unit::TestCase

  def test_company_namer
    # don't change the calling string
    str = ' my test '
    company = str.company_namer
    assert_equal(' my test ', str) 
    # remove leading and trailing space
    assert_equal('TEST', " test ".company_namer)
    # remove embedded space
    assert_equal('TEST', " te st ".company_namer)
    # remove Company
    assert_equal("MYTEST", "My Test Company".company_namer)
    # remove leading The
    assert_equal("AAA", "The AAA Company".company_namer)
    # remove punctuation
    assert_equal("TESTERS", %q{The tester's company}.company_namer)
    # empty name
    assert_equal("", "".company_namer)
    
    assert_equal("My Test Advertising Co".company_namer, "MY TEST ADV COMPANY".company_namer)
  end

    
  # def test_benchmark
  #   looptimes = 1000000
  # 
  #   puts "[BaseString]"
  #   puts Benchmark::CAPTION
  #   puts Benchmark.measure {
  #     base = BaseString.new
  #     looptimes.times { |n|
  #       base.make " My Test Company Name (A)"
  #     }
  #   }
  # end
end
