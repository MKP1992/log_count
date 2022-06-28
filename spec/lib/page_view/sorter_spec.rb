# frozen_string_literal: true

require 'spec_helper'
require 'page_view/sorter'

RSpec.describe PageView::Sorter do
  subject(:sorter) { described_class.new }

  describe '#sort' do
    
    subject(:sort_result) { sorter.sort(page_views) }
    
    let(:page_views) { { '/d' => 3, '/c' => 3, '/b' => 2, '/a' => 1, '/e' => 4 } }

    it { is_expected.to be_kind_of(Hash) }

    it 'sorts hash DESC on values' do
      expect(sort_result.values).to eq([4, 3, 3, 2, 1])
    end
  end
end
