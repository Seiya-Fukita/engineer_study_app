require 'rails_helper'

RSpec.describe 'Home', type: :system, js: true do
  it 'Homeという文字が存在する' do
    visit root_path

    expect(page).to have_content('Home')
  end
end
