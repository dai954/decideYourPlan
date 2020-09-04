require 'rails_helper'
describe Places::SearchesController do
  let(:place) { create(:place) }
  let(:user) { create(:user) }

  describe 'GET #new' do
  subject{
    get :new,
    params: params
  }
    let(:params) {{ placeid: place.id, departure: "大阪府東大阪市若江南町１−１−１"}}
    context "@subplaceに値が入っていない場合" do
      it "new.html.erbに遷移すること" do
        subject
        expect(response).to render_template :new
      end
      it "@placeに正しい値が入っていること " do
        subject
        expect(assigns(:place)).to eq place
      end
    end
    context "@subplaceに値が入っている場合" do
      let!(:subplace) { create(:subplace, place_id: place.id) }
      it "new.html.erbに遷移すること" do
        subject
        expect(response).to render_template :new
        end
      it "@placeに正しい値が入っていること " do
        subject
        expect(assigns(:place)).to eq place
      end
      it "@subplaceに正しい値が入っていること " do
        subject
        expect(assigns(:subplace)).to eq subplace
      end
    end
  end

  describe 'GET #index' do
    context "@subplaceに値が入っていない場合" do
      it "index.html.erbに遷移すること" do
        searches = create_list(:search, 3, place_id: place.id, user_id: user.id)
        get :index
        expect(response).to render_template :index
      end
      it "@searchesに正しい値が入っていること" do
        searches = create_list(:search, 3,place_id: place.id, user_id: user.id)
        get :index
        expect(assigns(:searches)).to match(searches.sort{ |a, b| b.created_at <=> a.created_at })
      end
    end
    context "@subplaceに値が入っている場合" do
      let(:subplace) { create(:subplace, place_id: place.id) }
      it "index.html.erbに遷移すること" do
        searches = create_list(:search, 3, place_id: place.id,subplace_id: subplace.id, user_id: user.id)
        get :index
        expect(response).to render_template :index
      end
      it "@searchesに正しい値が入っていること" do
        searches = create_list(:search, 3,place_id: place.id, subplace_id: subplace.id, user_id: user.id)
        get :index
        expect(assigns(:searches)).to match(searches.sort{ |a, b| b.created_at <=> a.created_at })
      end
    end
  end

  describe 'GET #show' do
      subject {
      get :show,
      params: params
    }
    context "@subplaceに値が入っていない場合" do
      let(:search) { create(:search, place_id: place.id, user_id: user.id) }
      let(:params) {{id: search.id, placeid: place.id, departure: "大阪府東大阪市若江南町１−１−１" }}
      context "かつ出発地とお出かけの日付の指定がない場合" do
        it "index.html.erbに遷移すること" do
          subject
          expect(response).to render_template :show
        end
        it "@searchに正しい値が入っていること" do
          subject
          expect(assigns(:search)).to eq search
        end
      end
      context "かつ出発地とお出かけの日付の指定がある場合" do
        if_true = "true"
        search_date = "2020-01-01"
        let(:params) {{id: search.id, if_true: if_true, search_date: search_date, placeid: place.id, departure: "大阪府東大阪市若江南町１−１−１" }}
        it "index.html.erbに遷移すること" do
          subject
          expect(response).to render_template :show
        end
        it "@searchに正しい値が入っていること" do
          subject
          expect(assigns(:search)).to eq search
        end
      end
    end
    context "@subplaceに値が入っている" do
      let(:subplace) { create(:subplace, place_id: place.id) }
      let(:search) { create(:search, place_id: place.id,  subplace_id: subplace.id, user_id: user.id) }
      context "かつ出発地とお出かけの日付の指定がない場合" do
        let(:params) {{id: search.id, placeid: place.id, departure: "大阪府東大阪市若江南町１−１−１" }}
        it "index.html.erbに遷移すること" do
          subject
          expect(response).to render_template :show
        end
        it "@searchに正しい値が入っていること" do
          subject
          expect(assigns(:search)).to eq search
        end
      end
      context "かつ出発地とお出かけの日付の指定がある場合" do
        if_true = "true"
        search_date = "2020-01-01"
        let(:params) {{id: search.id, if_true: if_true, search_date: search_date, placeid: place.id, departure: "大阪府東大阪市若江南町１−１−１" }}
        it "index.html.erbに遷移すること" do
          subject
          expect(response).to render_template :show
        end
        it "@searchに正しい値が入っていること" do
          subject
          expect(assigns(:search)).to eq search
        end
      end
    end
  end

  describe 'POST #create' do
    let(:subplace) { create(:subplace, place_id: place.id) }
    let(:params) {{ search: {lunch_name: "ランチもも", lunch_text: "最高です", lunch_image: "image.jpeg", lunch_address: "大阪市中央区大手前2丁目", lunch_link:"https:hoge", dinner_name: "ディナーステーキハウス", dinner_text: "美味しい！", dinner_image: "image.jpeg", dinner_address: "奈良市登大路町30", dinner_link: "https:dinner", section1: "1000", section2: "1000", section3: "1000", section4: "1000", plan_comment: "いいプランです", went_date: "2020-10-10", place_id: place.id, subplace_id: subplace.id, user_id: user.id}}}
    subject {
      post :create,
      params: params
    }
    it "プランが保存されること" do
      expect{ subject }.to change(Search, :count).by(1)
    end
    it 'places_searches_pathへリダイレクトすること' do
      subject
      expect(response).to redirect_to(places_searches_path)
    end
  end
end