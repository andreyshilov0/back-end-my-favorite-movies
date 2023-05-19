# frozen_string_literal: true

class ApplicationController < ActionController::API
  def current_user
    User.find_by(id: 1)
    # current_user = user.id

    # Не совсем понятна модель работы, к примеру, у нас есть модель User, тобишь
    # user = User.new(id: '1', login: 'Jack') у этой модели мы можем обратиться через ассоциации к
    # user.favorite_genres в которых будут все жанры пользователя с id: 1, ну по крайней мере в консоли так работает,
    # не совсем понимаю как сюда закинуть текущего пользователя, если только не передавать id как аргумент,
    # но для этого придется менять схему, как мне кажется.
  end
end
