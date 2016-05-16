require 'test_helper'

describe EntriesController, :controller do
  describe '#index' do
    it 'responds with HTTP success' do
      get :index
      assert_response :success
    end

    it 'assigns the @entries variable for the views to pick up' do
      get :index
      assert_not_nil assigns(:entries)
    end
  end

  describe '#show' do
    describe 'with an existing entry' do
      let(:existing_entry) { create(:entry) }

      it 'respondes with HTTP success' do
        get :show, id: existing_entry.id
        assert_response :success
      end

      it 'assigns the @entry variable' do
        get :show, id: existing_entry.id
        assert_not_nil assigns(:entry)
      end
    end

    describe 'with a non existing entry' do
      it 'responds with not found error' do
        get :show, id: 12345
        assert_response :not_found
      end
    end
  end
end
