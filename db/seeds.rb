# frozen_string_literal: true

users = User.create([
                      {
                        login: 'Jonh'
                      },
                      {
                        login: 'Jane'
                      }
                    ])

favorite_movies = FavoriteMovie.create([
                                         {
                                           title: 'Zena',
                                           description: 'overview',
                                           image_url: 'url',
                                           year: 2002,
                                           watched: false,
                                           user: users.first
                                         },
                                         {
                                           title: 'Omen',
                                           description: 'overview',
                                           image_url: 'url',
                                           year: 2021,
                                           watched: false,
                                           user: users.last
                                         }
                                       ])

genres = Genre.create([
                        {
                          title: 'Action',
                          user: users.first
                        },
                        {
                          title: 'Adventure',
                          user: users.last
                        }
                      ])
