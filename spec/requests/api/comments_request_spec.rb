require 'rails_helper'

RSpec.describe "Api::Comments", type: :request do

  let!(:article) {create(:article)}
  let!(:comment) {create(:article)}
  let!(:user) {create(:user)}
  
  describe 'successfully' do
    before do
      get 'api/comments'
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns article comment' do
      expect(response_json['comments']).to eq 1
    end

end