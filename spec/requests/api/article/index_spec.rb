RSpec.describe 'GET /api/articles', type: :request do
  let!(:articles) { 3.times { create(:article) } }
  describe 'successfully' do
    before do
      get '/api/articles'
    end

    it 'returns a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'returns the article comment' do
      expect(response_json['comment']).to eq "Some cool comment."
    end
  end
end