# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: 5.99
    fill_in 'Date', with: '1/1/2001'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end
end

RSpec.describe 'deleting a book', type: :feature do
  scenario 'Through direct link to delete page' do
    @book = Book.new(title: 'harry potter', author: 'JK Rowling', price: 5.99, date: Date.new(2001, 1, 1))
    @book.save
    visit books_path
    expect(page).to have_content('harry potter')
    visit delete_book_path(@book)
    click_on 'Yes'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end
end

RSpec.describe 'viewing a book', type: :feature do
  scenario 'Through direct link to view page' do
    @book = Book.new(title: 'harry potter', author: 'JK Rowling', price: 5.99, date: Date.new(2001, 1, 1))
    @book.save
    visit books_path(@book)
    expect(page).to have_content('harry potter')
    expect(page).to have_content('JK Rowling')
    expect(page).to have_content(5.99)
    expect(page).to have_content('1/1/2001')
  end
end

RSpec.describe 'deleting a book', type: :feature do
  scenario 'Through links' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: 5.99
    fill_in 'Date', with: '1/1/2001'
    click_on 'Create Book'
    click_on 'back'
    click_on 'Delete'
    click_on 'Yes'
    visit books_path
    expect(page).not_to have_content('harry potter')
  end
end