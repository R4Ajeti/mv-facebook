# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'GET index' do
    it 'assigns @teams' do
      team = Team.create
      get :index
      expect(assigns(:teams)).to eq([team])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
