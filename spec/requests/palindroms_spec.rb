# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PalindromsController, type: :controller do
  describe 'different sidex' do
    it 'returns result in html' do
      get 'result', params: { num: '11', side: 'html' }
      expect(response.content_type).to eq('text/html; charset=utf-8')
    end

    it 'returns result in xml' do
      get 'result', params: { num: '11', side: 'xml' }
      expect(response.content_type).to eq('application/xml; charset=utf-8')
    end

    it 'returns result from server in xml' do
      get 'result', params: { num: '11', side: 'server' }
      expect(response.content_type).to eq('application/xml; charset=utf-8')
    end
  end
end
