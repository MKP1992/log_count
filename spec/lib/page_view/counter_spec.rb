# frozen_string_literal: true

require 'spec_helper'
require 'page_view/counter'

RSpec.describe PageView::Counter do
  subject(:counter) { described_class.new(page_views) }

  let(:page_views) do
    [
      instance_double('View', path: '/home', ip: '111.111.111.111'),
      instance_double('View', path: '/home', ip: '222.222.222.222'),
      instance_double('View', path: '/help', ip: '111.111.111.111'),
      instance_double('View', path: '/home', ip: '111.111.111.111'),
      instance_double('View', path: '/help', ip: '222.222.222.222'),
      instance_double('View', path: '/home', ip: '222.222.222.222')
    ]
  end

  describe '#total_count_by_path' do
    it 'returns page_views for total views per page' do
      expect(counter.total_count_by_path).to eq({ '/home' => 4, '/help' => 2 })
    end
  end

  describe '#unique_count_by_path' do
    it 'returns page_views for unique views per page' do
      expect(counter.unique_count_by_path).to eq({ '/home' => 2, '/help' => 2 })
    end
  end
end
