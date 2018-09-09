require 'rails_helper'

describe 'the welcome page' do
  it 'visits the "/" page' do
    visit 'root_path'
    expect(page).to have_content ("About")
  end
end
