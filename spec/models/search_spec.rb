require 'rails_helper'
describe Search do
  describe '#create' do

    context 'placesテーブルに対応するデータがある場合' do
      it "searchesテーブルにデータが登録できること" do
        place = create(:place)
        search = build(:search, place_id: place.id)
        expect(search).to be_valid
      end
    end

    context 'placesテーブルに対応するデータがない場合' do
      it "エラーになること" do
        search = build(:search)
        search.valid?
        expect(search.errors[:place]).to include("を入力してください")
      end
    end
  end
  
end
