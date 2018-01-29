describe Private::MarketsController, type: :controller do
  let(:member) { create :member }
  before { session[:member_id] = member.id }

  context 'logged in user' do
    describe 'GET /markets/btccad' do
      before { get :show, data }

      it { expect(response.status).to eq 200 }
    end
  end

  context 'non-login user' do
    before { session[:member_id] = nil }

    describe 'GET /markets/btccad' do
      before { get :show, data }

      it { expect(response.status).to eq 200 }
      it { expect(assigns(:member)).to be_nil }
    end
  end

  private

  def data
    {
      id: 'btccad',
      market: 'btccad',
      ask: 'btc',
      bid: 'cad'
    }
  end
end
