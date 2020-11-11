RSpec.describe 'GET /api/articles', type: :request do
  let!(:comment) {
    create(:comment) 
  }
  describe 'successfully' do
    before do
      get '/api/comments'
    end

    it 'returns a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'returns three articles' do
      expect(response_json['articles'].count).to eq 3
    end
  end
end