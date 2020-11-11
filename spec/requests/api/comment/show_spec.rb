RSpec.describe 'GET /api/comments/:id', type: :request do
  let!(:comment) { create(:comment) }
  describe 'successfully' do
    before do
      get "/api/comments/#{comment.id}"
    end

    it 'returns a 200 response' do
      expect(response).to have_http_status 200
    end

    it 'returns correct comment' do
      expect(response_json['article']['id']).to eq "A really cool comment."
    end
  end
end