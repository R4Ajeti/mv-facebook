# frozen_string_literal: true

# https://relishapp.com/rspec/rspec-rails/docs/controller-specs

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'should be redirected' do
      get :index
      expect(response).to be_redirect
    end
  end
end
