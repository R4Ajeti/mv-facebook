# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET index' do
    it 'should be redirected' do
      get :index
      expect(response).to be_redirect
    end
  end
  describe 'GET new' do
    it 'should be redirected' do
      get :new
      expect(response).to be_redirect
    end
  end
end
