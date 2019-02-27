require 'rails_helper'

describe Api::V1::PlacesController do
  describe "GET #index" do
    it "populates an array of places" do
      place = FactoryBot.create(:place)
      get :index
      expect(JSON.parse(response.body).count).to eq 1
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new place in the database" do
        expect{
          post :create, params: {'data'=> FactoryBot.attributes_for(:place).to_json, 'image' => ''}
        }.to change(Place, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new place in the database" do
        expect{
          post :create, params: {'data'=> {name: '', location: ''}.to_json, 'image' => ''}
        }.to change(Place, :count).by(0)
      end
    end
  end
end
