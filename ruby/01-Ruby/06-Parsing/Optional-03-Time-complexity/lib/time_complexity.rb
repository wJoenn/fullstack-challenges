require_relative "../spec/books_1000"

def find_book(books, book_to_find)
  # TODO: return index of `book_to_find` in the array of `books`
  # Use `each_with_index`
  # return nil unless books.include?(book_to_find)

  # books.each_with_index { |e, i| return i if e == book_to_find }
  books.index(book_to_find)
end

def find_book_enhanced(books, book_to_find)
  # TODO: return index of `book_to_find` in the array of `books`
  # Use binary search
  books.bsearch_index { |book| book_to_find <=> book }
  # return nil unless books.include?(book_to_find)

  # min = 0
  # max = books.length - 1

  # loop do
  #   book = (min + max) / 2
  #   if books[book] == book_to_find
  #     return book
  #   elsif books[book] < book_to_find
  #     min = book + 1
  #   elsif books[book] > book_to_find
  #     max = book - 1
  #   end
  # end
end
