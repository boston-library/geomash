require 'test_helper'

class TGNTest < ActiveSupport::TestCase
  def test_tgn_lookup_from_id
    if Geomash::TGN.tgn_enabled == 'true'
       result = Geomash::TGN.get_tgn_data('2051159')

       assert_equal '45', result[:coords][:latitude]
       assert_equal '-84.1333', result[:coords][:longitude]
       assert_equal '45,-84.1333', result[:coords][:combined]
       assert_equal 'Atlanta', result[:hier_geo][:city]
       assert_equal 'Montmorency', result[:hier_geo][:county]
       assert_equal 'Michigan', result[:hier_geo][:state]
       assert_equal 'United States', result[:hier_geo][:country]
       assert_equal 'North and Central America', result[:hier_geo][:continent]


       #Check for a weird prefLabel case of only zh-latn-pinyin-x-notone
       result = Geomash::TGN.get_tgn_data('7002066')
       assert_equal '45.75', result[:coords][:latitude]
       assert_equal '126.65', result[:coords][:longitude]
       assert_equal '45.75,126.65', result[:coords][:combined]
       assert_equal 'Harbin', result[:hier_geo][:city]
       assert_equal 'Heilongjiang', result[:hier_geo][:province]
       assert_equal 'China', result[:hier_geo][:country]
       assert_equal 'Asia', result[:hier_geo][:continent]
       assert_equal 'Harbin', result[:non_hier_geo][:value]
       assert_nil result[:non_hier_geo][:qualifier]

       result = Geomash::TGN.get_tgn_data('7008038')
       assert_equal '48.866667', result[:coords][:latitude]
       assert_equal '2.333333', result[:coords][:longitude]
       assert_equal '48.866667,2.333333', result[:coords][:combined]
       assert_equal 'Paris', result[:hier_geo][:city]
       assert_equal 'Île-de-France', result[:hier_geo][:province]
       assert_equal 'France', result[:hier_geo][:country]
       assert_equal 'Europe', result[:hier_geo][:continent]
       assert_equal nil, result[:non_hier_geo][:value]
       assert_nil result[:non_hier_geo][:qualifier]
    end
  end
end
