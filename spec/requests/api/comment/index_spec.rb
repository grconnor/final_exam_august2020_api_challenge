RSpec.describe 'GET /api/comments', type: :request do
  let!(:comments) { 3.times { create(:comment) } }
  describe 'successfully' do
    before do
      get '/api/comment'
    end

    it 'returns a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'returns multiple comments' do
      expect(response_json['comment'].count).to eq "A really awesome comment."
    end
  end
end