require 'test_helper'

describe EntriesController, :controller do
  describe '#index' do
    it 'assigns the @index variable for the views to pick up' do
      get :index

      assert_response :success
      assert_not_nil assigns(:articles)
    end
  end
end
