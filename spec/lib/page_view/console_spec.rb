# frozen_string_literal: true

require 'spec_helper'
require 'page_view/console'

RSpec.describe PageView::Console do
  subject(:console) { described_class.new }

  describe '#output' do
    let(:page_views) { { '/1' => 10, '/5' => 55, '/3' => 2, '/2' => 1, '/4' => 4 } }
    let(:title) { 'views' }
    let(:result) do
      <<~REPORT
        /1 10 views
        /5 55 views
        /3 2 views
        /2 1 views
        /4 4 views
      REPORT
    end

    it 'outputs result for given page_views' do
      expect { console.output(page_views, title) }.to output(result).to_stdout
    end
  end
end
