# frozen_string_literal: true

require 'spec_helper'
require 'page_view/view'

RSpec.describe PageView::View do
  subject(:page_view) { described_class.new(path, ip) }

  let(:path) { '/home' }
  let(:ip) { '123.123.123.123' }

  it { expect(page_view.path).to eq(path) }
  it { expect(page_view.ip).to eq(ip) }
end
